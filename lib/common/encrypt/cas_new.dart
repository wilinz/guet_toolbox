import 'package:encrypt/encrypt.dart';
import 'package:guettoolbox/util/random.dart';

String encryptPassword(String password, String key) {
  final key1 = Key.fromUtf8(key);
  final iv = IV.fromUtf8(randomString(16));
  final encrypter = Encrypter(AES(key1, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(randomString(64) + password, iv: iv);
  return encrypted.base64;
}
