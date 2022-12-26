import 'package:dio/dio.dart';
import 'package:guettoolbox/data/network.dart';

class LoginService {
  static Future<String?> loginCAS(
      String username, String password, String service) async {
    Future<String?> first(
        String username, String password, String service) async {
      var data = {
        "username": username,
        "password": password,
        "service": service,
        "loginType": ""
      };
      var resp = await AppNetwork().dio.post(
          "https://cas.guet.edu.cn/cas/v1/tickets",
          options: Options(contentType: AppNetwork().typeUrlEncode),
          data: data);
      var location = resp.headers.value("Location");
      resp.data.toString();
      return location;
    }

    Future<String?> second(String url, String service) async {
      var data = {"service": service};
      var resp = await AppNetwork().dio.post(url,
          options: Options(contentType: AppNetwork().typeUrlEncode),
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

  Future<bool> loginWebVpn(String username, String password) async {

    Future<bool> loginWebVpn1(String ticket) async {
      var resp = await AppNetwork()
          .dio
          .get("${AppNetwork().webVpnUrl}login?cas_login=true&ticket=$ticket");
      resp.data.toString();
      return resp.statusCode == 200;
    }

    var ticket = await loginCAS(
        username, password, "https://v.guet.edu.cn/login?cas_login=true");

    if (ticket == null) return Future(() => false);
    return loginWebVpn1(ticket);
  }

}

class LogonFailedException implements Exception {
  final String msg;

  LogonFailedException(this.msg);

  @override
  String toString() => msg;
}
