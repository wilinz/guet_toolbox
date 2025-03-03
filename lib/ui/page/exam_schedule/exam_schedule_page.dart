import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/ui/page/exam_schedule/exam_schedule_controller.dart';
import 'package:guethub/ui/page/exam_scores/exam_scores_controller.dart';

class ExamSchedulePage extends StatelessWidget {
  const ExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExamScheduleController());
    return Scaffold(
      appBar: AppBar(
        title: Text("考试安排"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (c.isLoading.isFalse && c.isLoadFailed.isTrue) {
          return Center(
            child: TextButton(
                onPressed: () {
                  c.fetchData(isShowToast: true);
                },
                child: Text("加载失败点击重试")),
          );
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Obx(() => ListView.builder(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      itemCount: c.examSchedule.length,
                      itemBuilder: (context, index) {
                        final item = c.examSchedule[index];
                        return Container(
                          margin: EdgeInsets.only(top: 4, bottom: 4),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                "课程名称：${item.course}",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "考试日期：${item.time}",
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "考试状态：",
                                      ),
                                      Text(
                                        "${item.status}",
                                        style: TextStyle(
                                            color: item.status == "已结束"
                                                ? Colors.red
                                                : Colors.green),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "考试地点：${item.campus}${item.building}",
                                  ),
                                  Text(
                                    "教室编号：${item.room}",
                                  ),
                                  Text(
                                    "备注：${item.tag}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })))
            ],
          ),
        );
      }),
    );
  }
}
