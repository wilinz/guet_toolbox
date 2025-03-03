extension StringExtension on String {
  String truncateCodePoint(int length) {
    if (length >= this.length) {
      return this;
    }

    int count = 0;
    int index = 0;

    while (count < length) {
      int codeUnit = this.codeUnitAt(index);

      if (codeUnit < 0xD800 || codeUnit > 0xDBFF) {
        count++;
      } else {
        index++;
      }

      index++;
    }

    return '${this.substring(0, index)}...';
  }

  String trimChars(String char) {
    String result = this;

    // 修剪开头的指定字符
    while (result.startsWith(char)) {
      result = result.substring(1);
    }

    // 修剪结尾的指定字符
    while (result.endsWith(char)) {
      result = result.substring(0, result.length - 1);
    }

    return result;
  }

}
