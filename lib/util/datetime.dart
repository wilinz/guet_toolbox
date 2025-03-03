class DateTimeUtils {
  /// 将 DateTime 对象转换为 RFC3339 格式的字符串
  static String? toRfc3339(DateTime? dateTime) {
    if (dateTime == null) return null;
    // 确保时间为 UTC，以符合 RFC3339 标准
    dateTime = dateTime.toUtc();
    // 使用 Dart 内置的方法格式化为 ISO8601 字符串，RFC3339 是 ISO8601 的子集
    String formatted = dateTime.toIso8601String();
    // 添加 'Z' 表示 UTC 时间
    if (!formatted.endsWith('Z')) {
      formatted += 'Z';
    }
    return formatted;
  }

  /// 将 RFC3339 格式的字符串解析为 DateTime 对象
  static DateTime? fromRfc3339(String? rfc3339String) {
    if (rfc3339String == null) return null;
    return DateTime.parse(rfc3339String);
  }
}

DateTime getMondayOfTheWeek(DateTime date) {
  // If the given date is already a Monday, return it
  if (date.weekday == DateTime.monday) {
    return DateTime(date.year, date.month, date.day); // Remove time part
  }
  // Otherwise, subtract the number of days to get to Monday and remove time part
  DateTime monday = date.subtract(Duration(days: date.weekday - DateTime.monday));
  return DateTime(monday.year, monday.month, monday.day);
}
