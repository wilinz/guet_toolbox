// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guettoolbox/common/encrypt/cas.dart';
import 'package:guettoolbox/common/encrypt/webvpn.dart';

import 'package:guettoolbox/main.dart';

void main() {
  var str = "2023/2/13 0:00:00";
  var list1 = str.split(" ");
  var list2 = list1[0].split("/");
  var list3 = list1[1].split(":");
  var year = int.parse(list2[0]);
  var month = int.parse(list2[1]);
  var day = int.parse(list2[2]);
  var hour = int.parse(list3[0]);
  var minute = int.parse(list3[1]);
  var second = int.parse(list3[2]);
  var a = DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second);
  print(a.millisecond);
  // for (var i = 0; i < 35; i++) {
  //   var column = (i + 1) % 7;
  //   column = column == 0 ? 7 : column;
  //
  //   var row = i ~/ 7 + 1;
  //
  //   print("$i => $row, $column");
  // }
  // print(CAS.encrypt("Guet@045612"));
  // print(WebVPN.encryptHost("bkjw.guet.edu.cn"));
  // print(WebVPN.encryptPassword("bkjw.guet.edu.cn"));
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
