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
}
