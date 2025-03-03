import 'package:flutter/material.dart';

class ExtendedTimeOfDay extends TimeOfDay implements Comparable<TimeOfDay> {
  ExtendedTimeOfDay({required int hour, required int minute})
      : super(hour: hour, minute: minute);

  static ExtendedTimeOfDay? tryParse(String time){
    try {
      return ExtendedTimeOfDay.parse(time);
    } catch (e) {
      return null;
    }
  }

  /// 从字符串解析时间，例如 "08:30"
  factory ExtendedTimeOfDay.parse(String time) {
    final parts = time.split(':');
    if (parts.length != 2) {
      throw FormatException("Invalid time format. Expected HH:mm, got: $time");
    }

    final hours = int.tryParse(parts[0]);
    final minutes = int.tryParse(parts[1]);

    if (hours == null || minutes == null) {
      throw FormatException("Invalid time format. Expected HH:mm, got: $time");
    }

    // 检查范围
    if (hours < 0 || hours > 23) {
      throw FormatException("Hour out of range. Expected 0-23, got: $hours");
    }
    if (minutes < 0 || minutes > 59) {
      throw FormatException("Minute out of range. Expected 0-59, got: $minutes");
    }

    return ExtendedTimeOfDay(hour: hours, minute: minutes);
  }

  /// 格式化为 HH:mm 字符串
  String formatToString() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  /// 实现 Comparable 接口的 compareTo 方法
  @override
  int compareTo(TimeOfDay other) {
    final thisMinutes = hour * 60 + minute;
    final otherMinutes = other.hour * 60 + other.minute;

    if (thisMinutes < otherMinutes) {
      return -1;
    } else if (thisMinutes > otherMinutes) {
      return 1;
    } else {
      return 0;
    }
  }

  /// 重载 < 运算符
  bool operator <(TimeOfDay other) {
    return compareTo(other) < 0;
  }

  /// 重载 > 运算符
  bool operator >(TimeOfDay other) {
    return compareTo(other) > 0;
  }

  /// 重载 <= 运算符
  bool operator <=(TimeOfDay other) {
    return compareTo(other) <= 0;
  }

  /// 重载 >= 运算符
  bool operator >=(TimeOfDay other) {
    return compareTo(other) >= 0;
  }

}
