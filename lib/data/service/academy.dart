
import 'dart:convert';

import 'package:guettoolbox/data/model/academy/academy_response.dart';
import 'package:guettoolbox/data/network.dart';

class AcademyService{
  static Future<List<Academy>> get() async {
    final resp = await AppNetwork.get().dio2.get(
        "Comm/GetDepart");
    final respData = AcademyResponse.fromJson(resp.data);
    return respData.data;
  }
}