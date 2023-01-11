import 'dart:math';

final _AES_CHARS = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
final _AES_CHARS_LEN = _AES_CHARS.length;

String randomString(len) {
  var retStr = StringBuffer();
  for (var i = 0; i < len; i++) {
    final index = (Random().nextDouble() * _AES_CHARS_LEN).floor();
    retStr.write(_AES_CHARS[index]);
  }
  return retStr.toString();
}
