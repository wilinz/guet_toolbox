import 'dart:convert';

import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/network.dart';

class MajorsService {
  static Future<List<Major>> get() async {
    final sort = [
      {"property": "dptno", "direction": "ASC"},
      {"property": "spno", "direction": "ASC"}
    ];
    final resp = await (await AppNetwork.getDio())
        .get("Comm/GetSpno", queryParameters: {"sort": jsonEncode(sort)});
    final respData = MajorsResponse.fromJson(resp.data);
    return respData.data;
  }
}
