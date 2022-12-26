import 'package:dio/dio.dart';
import 'package:guettoolbox/common/encrypt/cas.dart';
import 'package:guettoolbox/data/network.dart';

class LoginService {
  static Future<String?> loginCAS(
      String username, String password, String service) async {
    Future<String?> first(
        String username, String password, String service) async {
      var data = {
        "username": username,
        "password": CAS.encrypt(password),
        "service": service,
        "loginType": ""
      };
      var resp = await AppNetwork().dio.post(
          "https://cas.guet.edu.cn/cas/v1/tickets",
          options: Options(contentType: AppNetwork.typeUrlEncode),
          data: data);
      var location = resp.headers.value("Location");
      resp.data.toString();
      return location;
    }

    Future<String?> second(String url, String service) async {
      var data = {"service": service};
      var resp = await AppNetwork().dio.post(url,
          options: Options(contentType: AppNetwork.typeUrlEncode),
          data: data);
      var body = resp.data.toString();
      if (resp.statusCode != 200) {
        return null;
      }
      return body;
    }

    var url = await first(username, password, service);
    if (url == null) return null;
    return await second(url, service);
  }

  static Future<bool> loginWebVpn(String username, String password) async {
    Future<bool> loginWebVpn1(String ticket) async {
      var resp = await AppNetwork()
          .dio
          .get("${AppNetwork.webVpnUrl}login?cas_login=true&ticket=$ticket");
      resp.data.toString();
      return resp.statusCode == 200;
    }

    var ticket = await loginCAS(
        username, password, "https://v.guet.edu.cn/login?cas_login=true");

    if (ticket == null) return Future(() => false);
    return loginWebVpn1(ticket);
  }

  static Future<String?> loginAcademicAffairsSystem(
      String username, String password) async {
    Future<bool> login(String ticket) async {
      var resp = await AppNetwork()
          .dio
          .get("${AppNetwork.baseUrlInWebVpn}?ticket=$ticket");
      resp.data.toString();
      return resp.statusCode == 200;
    }

    var ticket = await loginCAS(username, password, "https://bkjw.guet.edu.cn");
    if (ticket == null) return Future(() => null);
    login(ticket);
    return Future(() => ticket);
  }
}

class LogonFailedException implements Exception {
  final String msg;

  LogonFailedException(this.msg);

  @override
  String toString() => msg;
}
