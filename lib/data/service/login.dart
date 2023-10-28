import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:guettoolbox/common/encrypt/cas_new.dart';
import 'package:guettoolbox/data/model/dynamic_code/dynamic_code.dart';
import 'package:guettoolbox/data/model/dynamic_code/reauth.dart';
import 'package:guettoolbox/data/model/login/login_cas_response.dart';
import 'package:guettoolbox/data/repository/campus_network.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:guettoolbox/util/js.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:dio/dio.dart';
import 'package:guettoolbox/common/encrypt/cas.dart';
import 'package:guettoolbox/data/network.dart';
import 'package:kt_dart/kt.dart';

class LoginService {
  @Deprecated("use loginNewCas")
  static Future<String> loginCAS(
      String username, String password, String service) async {
    Future<String> first(
        String username, String password, String service) async {
      var data = {
        "username": username,
        "password": CAS.encrypt(password),
        "service": service,
        "loginType": ""
      };

      final Uri uri = Uri.parse("https://cas.guet.edu.cn/cas/v1/tickets");
      // final cookieJar = (await AppNetwork.getInstance()).cookieJar;
      // cookieJar.delete(uri);
      var resp = await AppNetwork.get().dio2.postUri(uri,
          options: Options(
              contentType: AppNetwork.typeUrlEncode,
              responseType: ResponseType.plain),
          data: data);
      var location = resp.headers.value("Location");
      var respData = resp.data;
      if (resp.statusCode != 201) {
        var loginResp = LoginCasResponse.fromJson(jsonDecode(respData));
        var loginResult = loginResp.data;
        var title = "登录失败";
        var message = "密码错误";
        if ("PASSERROR" == loginResult.code) {
          if (loginResult.data.indexOf(",") > 0) {
            var data = loginResult.data.split(",");
            var total = data[0];
            var count = data[1];
            message = total == count
                ? "密码已连续错误【" + count + "】次，账号锁定。"
                : "密码已连续错误【" + count + "】次，连续错误【" + total + "】次账号将被锁定。";
          }
        } else if ("NOUSER" == loginResult.code) {
          message = "账号不存在。";
        } else if ("USERNOTONLY" == loginResult.code) {
          message = "账号不唯一，请联系相关管理员处理。";
        } else if ("USERDISABLED" == loginResult.code) {
          message = "账号被停用，请联系相关管理员处理。";
        } else if ("USERLOCK" == loginResult.code) {
          var count = loginResult.data;
          if (count.length > 11) {
            count = count.substring(11, count.length);
          }
          message = "账号锁定至:" + count + "，请稍后重新登录或联系管理员处理。";
        }

        throw LogonFailedException("$title: $message");
      }
      if (location == null) {
        var document = htmlParser.parse(respData);
        final form = document.body?.getElementsByTagName("form").first;
        location = form?.attributes["action"];
      }
      if (location == null) {
        throw LogonFailedException(
            "登录失败, 响应头 Location 为null，状态码：${resp.statusCode}");
      }
      return location;
    }

    Future<String> second(String url, String service) async {
      var data = {"service": service};
      var resp = await AppNetwork.get().dio2.post(url,
          options: Options(contentType: AppNetwork.typeUrlEncode), data: data);
      var body = resp.data;
      if (resp.statusCode != 200) {
        throw LogonFailedException(
            "登录失败, 响应头 Location 为null，状态码：${resp.statusCode}，返回：${body}");
      }
      return body;
    }

    var url = await first(username, password, service);
    return await second(url, service);
  }

  static Future<bool> loginWithWebVpn(String username, String password) async {
    // final resp = await (await AppNetwork.getDio()).get("https://v.guet.edu.cn");

    var resp1 = await loginNewCas(username, password,
        "https://v.guet.edu.cn/login?cas_login=true", false);

    if (resp1.data.toString().contains("注销")) {
      var resp2 = await loginNewCas(
          username, password, "https://bkjw.guet.edu.cn", false);
      if (resp2.data.toString().contains("用户类型：学生")) {
        return true;
      }
    }

    return false;
  }

  static Future<bool> loginWithCampusNetwork(
      String username, String password) async {
    var resp =
        await loginNewCas(username, password, "https://bkjw.guet.edu.cn", true);
    if (resp.data.toString().contains("用户类型：学生")) {
      return true;
    }
    return false;
  }

  static String getCasBaseUrl(bool isCampusNetwork) {
    final baseUri = isCampusNetwork
        ? "https://cas.guet.edu.cn/"
        : Uri.parse("https://cas.guet.edu.cn").toWebVpnUrl().toString();
    return baseUri;
  }

  static Future<Response> loginNewCas(String username, String password,
      String service, bool isCampusNetwork) async {
    String getUri() => isCampusNetwork
        ? "https://cas.guet.edu.cn/authserver/login"
        : "${getCasBaseUrl(isCampusNetwork)}authserver/login";

    var uri = getUri();
    if (service == "https://v.guet.edu.cn/login?cas_login=true") {
      uri = "https://v.guet.edu.cn/login?cas_login=true";
    }
    var resp = await AppNetwork.get(username: username).dio2.get(uri,
        queryParameters: {"service": service},
        options: Options(extra: {LoginInterceptor.allowCheckingLogin: false}));

    if (service == "https://v.guet.edu.cn/login?cas_login=true") {
      if (resp.data.toString().contains("注销")) {
        return resp;
      } else {
        // resp = await (await AppNetwork.getDio())
        //     .get(getUri(), queryParameters: {"service": service});
        var resp = await AppNetwork.get().dio2.get(uri,
            options:
                Options(extra: {LoginInterceptor.allowCheckingLogin: false}));
        if (resp.data.toString().contains("注销")) {
          return resp;
        }
      }
    }

    if (service == "https://bkjw.guet.edu.cn" &&
        resp.data.toString().contains("用户类型：学生")) {
      return resp;
    }

    if (resp.data.toString().contains("多因子登录")) {
      throw RequireLoginVerificationCodeException("");
    }

    final doc = htmlParser.parse(resp.data);
    final aesKey = doc.getElementById("pwdEncryptSalt")?.attributes["value"];
    final execution = doc.getElementById("execution")?.attributes["value"];

    if (aesKey == null || execution == null) {
      throw Exception("aes key is null");
    }

    bool needCaptcha = false;
    final needCaptchaScript = doc
        .getElementsByTagName("script")
        .firstWhereOrNull((e) => e.text.contains("needCaptcha"));

    if (needCaptchaScript != null) {
      final variables =
          getVariableByJavaScript(needCaptchaScript.text, ["needCaptcha"]);
      if (variables["needCaptcha"] == "\"true\"") {
        needCaptcha = true;
      }
    }
    final uri1 = getUri();
    final resp1 = await AppNetwork.get().dio2.post(uri1,
        queryParameters: {"service": service},
        options: Options(
            contentType: AppNetwork.typeUrlEncode,
            responseType: ResponseType.plain,
            extra: {LoginInterceptor.allowCheckingLogin: false}),
        data: {
          "username": username,
          "password": encryptPassword(password, aesKey),
          "rememberMe": true,
          "captcha": "",
          "_eventId": "submit",
          "cllt": "userNameLogin",
          "dllt": "generalLogin",
          "lt": "",
          "execution": execution
        });

    // final location = resp1.headers.value("location");
    // if (location == null) {
    //   throw Exception("hello");
    // }

    // return await (await AppNetwork.getDio()).get(location);
    return resp1;
  }

  /// {"res":"success","mobile":"123****4567","returnMessage":"动态口令已发送到手机","codeTime":120}
  static Future<DynamicCode> getDynamicCode(String username) async {
    final isCampusNetwork =
        await NetworkDetectionRepository.get().isCampusNetwork ?? false;
    final resp = await AppNetwork.get().dio2.post(
        "${getCasBaseUrl(isCampusNetwork)}authserver/dynamicCode/getDynamicCodeByReauth.do",
        data: {
          "userName": username,
          "authCodeTypeName": "reAuthDynamicCodeType"
        },
        options: Options(
            contentType: AppNetwork.typeUrlEncode,
            responseType: ResponseType.plain));
    return DynamicCode.fromJson(json.decode(resp.data));
  }

  ///{"msg":"动态码错误","code":"reAuth_failed"}
  static Future<ReAuth> reAuthCheck(String code) async {
    final isCampusNetwork =
        await NetworkDetectionRepository.get().isCampusNetwork ?? false;
    final resp = await AppNetwork.get().dio2.post(
        "${getCasBaseUrl(isCampusNetwork)}authserver/reAuthCheck/reAuthSubmit.do",
        data: {
          "service": "",
          "reAuthType": 3,
          "isMultifactor": true,
          "password": "",
          "dynamicCode": code,
          "uuid": "",
          "answer1": "",
          "answer2": "",
          "otpCode": "",
        },
        options: Options(
            contentType: AppNetwork.typeUrlEncode,
            responseType: ResponseType.json));
    return ReAuth.fromJson(resp.data);
  }
}

class LogonFailedException implements Exception {
  final String msg;

  LogonFailedException(this.msg);

  @override
  String toString() => msg;
}

class RequireLoginVerificationCodeException implements Exception {
  final String msg;

  RequireLoginVerificationCodeException(this.msg);

  @override
  String toString() => msg;
}
