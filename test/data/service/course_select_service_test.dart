import 'package:flutter_test/flutter_test.dart';
import 'package:guethub/data/service/course_select.dart';

void main() {
  group('extractTokenUrlFromHtml', () {
    test('should return token URL when script tag contains valid URL', () {
      const htmlResponse = '''
<html>
<script>
test script1
</script>
<body style="display:none;">
<script>
test script2
</script>
<script>
  /*<![CDATA[*/
  \$(function () {
    var url = 'https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx';
    window.location.href=url;
  });
  /*]]>*/
</script>
<script>
  /*<![CDATA[*/
  \$(function () {
    var url = 'https://examplle.com/course-selection/window.location.href=url;
  });
  /*]]>*/
</script>
</body>
<script>
test script3
</script>
</html>
''';

      final tokenUrl = CourseSelectService.extractTokenUrlFromHtml(htmlResponse);

      expect(
          tokenUrl,
          equals(
              """https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx"""));
    });

    test('should return token URL when using double quotes', () {
      const htmlResponse = '''
<html>
<body style="display:none;">
<script>
  /*<![CDATA[*/
  \$(function () {
    let url = "https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx";
    window.location.href=url;
  });
  /*]]>*/
</script>
</body>
</html>
''';

      final tokenUrl = CourseSelectService.extractTokenUrlFromHtml(htmlResponse);

      expect(
          tokenUrl,
          equals(
              """https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx"""));
    });

    test('should return token URL when semicolon is missing', () {
      const htmlResponse = '''
<html>
<body style="display:none;">
<script>
  /*<![CDATA[*/
  \$(function () {
    const url = 'https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx'
    window.location.href=url;
  });
  /*]]>*/
</script>
</body>
</html>
''';

      final tokenUrl = CourseSelectService.extractTokenUrlFromHtml(htmlResponse);

      expect(
          tokenUrl,
          equals(
              """https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx"""));
    });

    test('should return token URL even with extra spaces', () {
      const htmlResponse = '''
<html>
<body style="display:none;">
<script>
  /*<![CDATA[*/
  \$(function () {
    var   url   =    'https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx';
    window.location.href=url;
  });
  /*]]>*/
</script>
</body>
</html>
''';

      final tokenUrl = CourseSelectService.extractTokenUrlFromHtml(htmlResponse);

      expect(
          tokenUrl,
          equals(
              """https://examplle.com/course-selection/?token=eyJ0eXAiOiJKV1Qxxxxxxxxxxxxxxxxxx.eyJpc3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.QVZG8RWfqmqZ6jpN2DTSObrPRFxxxxxxxxxxxxxxxxx"""));
    });
  });


  group('extractTokenFromUrl', () {
    test('should return token when URL contains valid token', () {
      const url = 'https://example.com/course-selection/?token=valid-token';

      final token = CourseSelectService.extractTokenFromUrl(url);

      expect(token, equals('valid-token'));
    });

    test('should return null when token is not present in URL', () {
      const url = 'https://example.com/course-selection/';

      final token = CourseSelectService.extractTokenFromUrl(url);

      expect(token, isNull);
    });

    test('should return null when URL is invalid', () {
      const url = 'invalid-url';

      final token = CourseSelectService.extractTokenFromUrl(url);

      expect(token, isNull);
    });
  });
}
