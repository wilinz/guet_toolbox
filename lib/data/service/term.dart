import 'dart:convert';

import 'package:guettoolbox/data/model/template.dart';
import 'package:guettoolbox/data/model/term/term_response.dart';
import 'package:guettoolbox/data/network.dart';


class TermService {
  static Future<List<Term>> getTermList() async {
    final resp = await (await AppNetwork.getDio()).get("comm/getlabarrangeterm");
    final respData = TermResponse.fromJson(resp.data);
    return respData.data;
  }
}
