import 'dart:async';
import 'dart:io';

Future<String?> inputOfFile(String filePath, {bool clearFileContent = false}) async {
  try {
    var file = File(filePath);
    var lastLine = '';
    var isExitCommandReceived = false;
    var content = StringBuffer();

    // 如果文件不存在，则创建文件
    if (!file.existsSync()) {
      await file.create(recursive: true);
    }

    // 清空文件内容（如果指定了清空参数）
    if (clearFileContent) {
      await file.writeAsString('');
    }

    while (!isExitCommandReceived) {
      await Future.delayed(Duration(seconds: 5)); // 每隔2秒读取一次文件

      // 读取文件内容
      var lines = await file.readAsLines();

      // 如果文件非空，取最后一行
      if (lines.isNotEmpty) {
        lastLine = lines.last.trim();
      }

      // 如果最后一行是 ':wq'，则退出循环
      if (lastLine == ':wq') {
        isExitCommandReceived = true;
        content.write(lines.sublist(0,lines.length-1).join('\n'));
      }
    }

    return content.toString();
  } catch (e) {
    print("发生错误：$e");
    return null;
  }
}

void main() async {
  var content = await inputOfFile('./test-input/authcode.txt', clearFileContent: true);
  print("读取的内容为：$content");
}
