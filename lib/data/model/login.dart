import 'dart:convert';

LoginCasResponse loginCasResponseFromJson(String str) =>
    LoginCasResponse.fromJson(json.decode(str));

String loginCasResponseToJson(LoginCasResponse data) =>
    json.encode(data.toJson());

class LoginCasResponse {
  LoginCasResponse({
    required this.meta,
    required this.data,
  });

  late final Meta meta;
  late final Data data;

  LoginCasResponse.fromJson(Map<String, dynamic> json) {
    meta = Meta.fromJson(json['meta']);
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meta'] = meta.toJson();
    _data['data'] = data.toJson();
    return _data;
  }
}

class Meta {
  Meta({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  late final bool success;
  late final int statusCode;
  late final String message;

  Meta.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['statusCode'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.code,
    required this.data,
  });

  late final String code;
  late final String data;

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data;
    return _data;
  }
}
