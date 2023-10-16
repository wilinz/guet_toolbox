import 'dart:convert';
import 'dart:ffi';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/empty_classroom/empty_classroom.dart';
import 'package:guettoolbox/data/service/empty_classroom.dart';

class EmptyClassroomPage extends StatelessWidget {
  const EmptyClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(EmptyClassroomController());
    return Scaffold(
      appBar: AppBar(
        title: Text("空教室"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              children: [
                TextFormField(
                  controller: c.classroomController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "教室",
                    hintText: "例如：17211 或者 17",
                    // prefixIcon: Icon(Icons.person),
                    // border: const OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  // validator: (v) {
                  //   return v!.trim().length > 0 ? null : "不能为空";
                  // },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: c.dateController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "日期",
                    hintText: "例如：2023-10-1",
                    // prefixIcon: Icon(Icons.person),
                    // border: const OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  // validator: (v) {
                  //   return v!.trim().length > 0 ? null : "不能为空";
                  // },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: c.startSequenceController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "开始节次",
                    hintText: "1~5",
                    // prefixIcon: Icon(Icons.person),
                    // border: const OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  // validator: (v) {
                  //   return v!.trim().length > 0 ? null : "不能为空";
                  // },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: c.endSequenceController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "结束节次",
                    hintText: "1~5",
                    // prefixIcon: Icon(Icons.person),
                    // border: const OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  // validator: (v) {
                  //   return v!.trim().length > 0 ? null : "不能为空";
                  // },
                ),
                SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: c.getValue, child: Text("查询"))),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => c.rooms.isEmpty
                ? Container(padding: EdgeInsets.all(16), child: Text("没找到"))
                : ListView.separated(
                    padding: EdgeInsets.all(8),
                    separatorBuilder: (context, i) => SizedBox(height: 8),
                    itemCount: c.rooms.length,
                    itemBuilder: (context, i) {
                      final item = c.rooms[i];
                      return Card(
                        child: ListTile(
                          title: Text(item.classroom),
                          subtitle: Text(
                              "${item.campus} | ${item.teachingBuilding} | ${item.seatCount} | ${item.type}"),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}

class EmptyClassroomController extends GetxController {
  final r = "".obs;
  final rooms = <EmptyClassroomData>[].obs;
  final classroomController = TextEditingController(text: "");
  final dateController = TextEditingController(text: "");
  final startSequenceController = TextEditingController(text: "");
  final endSequenceController = TextEditingController(text: "");

  // final

  getValue() async {
    final resp = await EmptyClassRoom.getEmptyClassRoom(
        classroom: classroomController.text,
        date: dateController.text,
        startSequence: startSequenceController.text.toIntOrNull() ?? 0,
        endSequence: endSequenceController.text.toIntOrNull() ?? 0);
    rooms.value = resp;
  }
}
