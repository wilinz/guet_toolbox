import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guettoolbox/data/network.dart';
import 'package:guettoolbox/data/service/empty_classroom.dart';

Future<void> main() async {
  await AppNetwork.init(isTest: true);
  // final resp = await EmptyClassRoom.getEmptyClassRoom("17", "2023-10-16", 1, 1);
  // prettyPrint(resp);
}

void prettyPrint(dynamic json) {
  const encoder = JsonEncoder.withIndent('  ');
  final prettyString = encoder.convert(json);
  print(prettyString);
}

