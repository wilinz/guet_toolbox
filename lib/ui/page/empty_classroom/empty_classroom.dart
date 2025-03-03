import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom.dart';
import 'package:guethub/data/service/empty_classroom.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/kt.dart';

@Deprecated('Old System')
class EmptyClassroomPage extends StatelessWidget {
  const EmptyClassroomPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(EmptyClassroomController());
    return Scaffold(
      appBar: AppBar(
        title: Text("空教室"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _QueryInput(controller: c),
            ),
            SliverPadding(padding: EdgeInsets.all(8)),
            Obx(() {
              return c.rooms.isEmpty && !c.isFirstQuery.value
                  ? SliverToBoxAdapter(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("没找到")),
                    )
                  : SliverList(
                      //列表项高度固定
                      delegate: SliverChildBuilderDelegate(
                        (_, i) {
                          final item = c.rooms[i];
                          return Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Card(
                              child: ListTile(
                                title: Text(item.classroom),
                                subtitle: Text(
                                  "${item.campus} | ${item.teachingBuilding} | ${item.seatCount} | ${item.type}",
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: c.rooms.length,
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}

class _QueryInput extends StatelessWidget {
  const _QueryInput({
    super.key,
    required this.controller,
  });

  final EmptyClassroomController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
            children: [
              TextFormField(
                controller: controller.classroomController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "教室",
                  hintText: "例如：17211 或者 17",
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.startSequenceController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "开始节次",
                  hintText: "1~5",
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.endSequenceController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "结束节次",
                  hintText: "1~5",
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () async {
              final result = await showDatePicker(
                context: context,
                locale: Get.locale,
                initialDate: controller.date.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              result?.let((it) => controller.date(it));
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Obx(() => Text(
                  "日期：${controller.dateFormat.format(controller.date.value)}")),
            ),
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => ElevatedButton(
              onPressed:
                  controller.isLoading.isFalse ? controller.getEmptyClass : null,
              child: Text(controller.isLoading.value ? "正在查询..." : "查询"),
            ),
          ),
        ),
      ],
    );
  }
}

@Deprecated("Old system")
class EmptyClassroomController extends GetxController {
  final rooms = <EmptyClassroomData>[].obs;
  final classroomController = TextEditingController(text: "");
  final date = DateTime.now().obs;
  final startSequenceController = TextEditingController(text: "");
  final endSequenceController = TextEditingController(text: "");
  final isLoading = false.obs;

  final dateFormat = DateFormat("yyyy-MM-dd");
  final isFirstQuery = true.obs;

  @Deprecated("Old system")
  getEmptyClass() async {
    try {
      isLoading.value = true;
      final resp = await EmptyClassRoom.getEmptyClassRoom(
        classroom: classroomController.text,
        date: dateFormat.format(date.value),
        startSequence: startSequenceController.text.toIntOrNull() ?? 0,
        endSequence: endSequenceController.text.toIntOrNull() ?? 0,
      );
      rooms.value = resp;
      Get.snackbar("成功", "查询成功", duration: Duration(seconds: 1));
    } catch (e) {
      Get.snackbar("查询失败", e.toString(), duration: Duration(seconds: 1));
    } finally {
      isFirstQuery.value = false;
      isLoading.value = false;
    }
  }
}
