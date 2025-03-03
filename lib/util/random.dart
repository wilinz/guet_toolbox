import 'dart:math';

final _AES_CHARS = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz0123456789';
final _AES_CHARS_LEN = _AES_CHARS.length;

String randomString(len) {
  var retStr = StringBuffer();
  for (var i = 0; i < len; i++) {
    final index = (Random().nextDouble() * _AES_CHARS_LEN).floor();
    retStr.write(_AES_CHARS[index]);
  }
  return retStr.toString();
}

final _UID_CHARS = '0123456789abcdef';
final _UID_CHARS_LEN = _UID_CHARS.length;

String randomUidString(len) {
  var retStr = StringBuffer();
  for (var i = 0; i < len; i++) {
    final index = (Random().nextDouble() * _UID_CHARS_LEN).floor();
    retStr.write(_UID_CHARS[index]);
  }
  return retStr.toString();
}
