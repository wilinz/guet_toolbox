import 'dart:convert';
import 'package:guettoolbox/data/model/index.dart';
import 'package:html/parser.dart' show parse;
import 'package:dio/dio.dart';
import 'package:guettoolbox/common/encrypt/cas.dart';
import 'package:guettoolbox/data/network.dart';

class LoginService {
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
      var resp = await (await AppNetwork.getDio(followRedirects: true)).post(
          "https://cas.guet.edu.cn/cas/v1/tickets",
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
        var document = parse(respData);
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
      var resp = await (await AppNetwork.getDio(followRedirects: true)).post(
          url,
          options: Options(contentType: AppNetwork.typeUrlEncode),
          data: data);
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

  static Future<bool> loginWebVpn(String username, String password) async {
    Future<bool> loginWebVpn1(String ticket) async {
      var resp = await (await AppNetwork.getDio(followRedirects: true))
          .get("${AppNetwork.webVpnUrl}login?cas_login=true&ticket=$ticket");
      resp.data.toString();
      return resp.statusCode == 200;
    }

    var ticket = await loginCAS(
        username, password, "https://v.guet.edu.cn/login?cas_login=true");

    return loginWebVpn1(ticket);
  }

  static Future<String?> loginAcademicAffairsSystem(
      String username, String password) async {
    Future<bool> login(String ticket) async {
      var resp = await (await AppNetwork.getDio(followRedirects: true))
          .get("${AppNetwork.baseUrlInWebVpn}?ticket=$ticket");
      resp.data.toString();
      if (resp.statusCode != 200) {
        throw LogonFailedException(
            "登录失败, 响应头 Location 为null，状态码：${resp.statusCode}，返回：${resp.data}");
      }
      return resp.statusCode == 200;
    }

    var ticket = await loginCAS(username, password, "https://bkjw.guet.edu.cn");
    await login(ticket);
    return Future(() => ticket);
  }
}

class LogonFailedException implements Exception {
  final String msg;

  LogonFailedException(this.msg);

  @override
  String toString() => msg;
}
