
import 'dart:convert';

import 'package:crypto/crypto.dart';

String sha256Text(String text){
  var bytes = utf8.encode(text); // convert data to bytes
  var hash = sha256.convert(bytes);
  return hash.toString();
}