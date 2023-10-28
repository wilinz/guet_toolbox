import 'dart:convert';

import 'package:guettoolbox/data/model/template.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/network.dart';


class TermService {
  static Future<List<Term>> getTermList() async {
    final resp = await AppNetwork.get().dio2.get("comm/getlabarrangeterm");
    final respData = TermResponse.fromJson(resp.data);
    return respData.data;
  }
}
