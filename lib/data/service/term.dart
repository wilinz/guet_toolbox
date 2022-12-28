import 'dart:convert';

import 'package:guettoolbox/data/model/template.dart';
import 'package:guettoolbox/data/network.dart';

import '../model/term.dart';

class TermService {
  static Future<List<Term>> getTermList() async {
    var resp = await (await AppNetwork.getDio()).get("comm/getlabarrangeterm");
    var respData = ResponseTemplate<List<Term>,Term>.fromJson(
        resp.data, (e) => Term.fromJson(e));
    return Future(() => respData.data);
  }
}
