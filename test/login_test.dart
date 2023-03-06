import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guettoolbox/data/repository/login.dart';

// $env:GUET_PASSWORD=""
// flutter test test/login_test.dart
Future<void> main() async {
  Map<String, String> envVars = Platform.environment;
  // $env:GUET_PASSWORD="you_password"
  final password = envVars['GUET_PASSWORD'];
  print("password: ${password}");
  // final resp = await LoginRepository.getInstance()
  //     .loginAcademicAffairsSystem("id", password.toString());
}
