import 'dart:convert';
import 'package:crypto/crypto.dart';

String md5sum(String input) {
  // 将输入字符串转换为 UTF-8 编码的字节数组
  List<int> bytes = utf8.encode(input);

  // 计算 MD5 哈希值
  Digest digest = md5.convert(bytes);

  // 返回哈希值的十六进制字符串表示
  return digest.toString();
}
