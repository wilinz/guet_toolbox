class DateTimeUtil {
  /// example："2023/2/13 0:00:00"
  static DateTime parseDate(String date) {
    var list0 = date.split(" ");
    var list1 = list0[0].split("/");
    var list2 = list0[1].split(":");
    var year = int.parse(list1[0]);
    var month = int.parse(list1[1]);
    var day = int.parse(list1[2]);
    var hour = int.parse(list2[0]);
    var minute = int.parse(list2[1]);
    var second = int.parse(list2[2]);
    return DateTime(year, month, day, hour, minute, second).toLocal();
  }
}
