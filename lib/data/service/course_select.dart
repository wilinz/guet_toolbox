import 'package:guethub/logger.dart';
import 'package:html/parser.dart' as html;
import 'package:dio/dio.dart';

class CourseSelectService {

  /// <html>
  /// <body style="display:none;">
  /// <script>
  ///   /*<![CDATA[*/
  ///   \$(function () {
  ///     var url = 'https://example.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx';
  ///     window.location.href=url;
  ///   });
  ///   /*]]>*/
  /// </script>
  /// </body>
  /// </html>
  /// Function to parse the token URL from the HTML response
  static String? extractTokenUrlFromHtml(String htmlText) {
    final doc = html.parse(htmlText);
    final scriptTag = doc.querySelectorAll('body > script').map((e) => e.text).join("\n\n");

    // Regular expression to match 'var', 'let', or 'const' followed by a variable name and value
    // The URL must contain the 'token' parameter in the query string
    RegExp regExp = RegExp(
        r"""(var|let|const)\s+(\w+)\s*=\s*['\"](https?:\/\/[^\s'"]*token=[^'"]+)['\"]\s*;?""",
        caseSensitive: false,
        dotAll: true);

    Match? match = regExp.firstMatch(scriptTag);

    // Return the value of the first match or null if no match is found
    return match != null ? match.group(3) : null;
  }


  // Function to extract the token from the URL
  static String? extractTokenFromUrl(String url) {
    final uri = Uri.parse(url);
    final token = uri.queryParameters['token']; // Extract 'token' from query parameters
    return token; // Return the token if found
  }

  // The main method to get the token from HTML response
  static Future<String?> getToken(Dio dio) async {
    try {
      // Make the HTTP request to get the HTML response
      final response = await dio.get("student/for-std/course-select");
      final htmlText = response.data;

      // Extract token URL from HTML
      final tokenUrl = extractTokenUrlFromHtml(htmlText);
      if (tokenUrl != null) {
        // Extract token from the URL
        return extractTokenFromUrl(tokenUrl);
      }
      return null;
    } catch (e) {
      logger.d('Error occurred: $e');
      return null;
    }
  }
}
