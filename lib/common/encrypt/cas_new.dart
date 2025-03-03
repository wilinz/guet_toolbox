import 'dart:typed_data';

import 'package:rust_module/rust_module.dart';

String encryptPassword(String password, Uint8List key) =>
    encryptAes128Cbc64Prefix(plain: password, key: key);

String decryptPassword(String encryptedPassword, Uint8List key) =>
    decryptAes128Cbc64Prefix(encryptedBase64: encryptedPassword, key: key);
