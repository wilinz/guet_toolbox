import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'dart:ffi';
import 'package:sqlite3/open.dart';

setupDatabases() {
  open
    ..overrideFor(OperatingSystem.android, openCipherOnAndroid);
}
