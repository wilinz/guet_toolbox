import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class CaptchaSolverService {
  static Future<String> ocr(Dio dio, Uint8List bytes,
      {String apiUrl = 'ai/captcha_solve/ocr'}) async {
    // 构造 MultipartFormData
    final formData = FormData.fromMap({
      "file": await MultipartFile.fromBytes(
        bytes,
        filename: "captcha.jpg",
      ),
    });

    // 发送 POST 请求
    final response = await dio.post(
      apiUrl,
      data: formData,
    );

    // 检查响应状态码
    if (response.statusCode == 200) {
      final responseData = response.data;

      // 根据返回的数据格式提取 OCR 结果
      if (responseData != null && responseData["success"] == true) {
        return responseData["data"]; // 返回 OCR 的结果
      } else {
        throw Exception(
            "OCR failed: ${responseData["msg"] ?? "Unknown error"}");
      }
    } else {
      throw Exception("Failed to solve captcha: ${response.statusCode}");
    }
  }
}
