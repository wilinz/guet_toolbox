import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/ui/page/exam_schedule/exam_schedule_controller.dart';
import 'package:guettoolbox/ui/page/exam_scores/exam_scores_controller.dart';

class ExamSchedulePage extends StatelessWidget {
  const ExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExamScheduleController());
    return Scaffold(
      appBar: AppBar(
        title: Text("考试安排"),
      ),
      body: Container(
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            //   child: Row(
            //       children: <Widget>[
            //         Expanded(child: buildTermDropdownButton(c)),
            //         SizedBox(width: 8),
            //         ElevatedButton(
            //             onPressed: () {
            //               c.getExamSchedule();
            //             },
            //             child: Text("查询")),
            //       ]),
            // ),
            Expanded(
                child: Obx(() => ListView.builder(
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    itemCount: c.examSchedule.length,
                    itemBuilder: (context, index) {
                      final item = c.examSchedule[index];
                      return Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                                // AppRoute.pedagogicalEvaluationEditPage,
                                // arguments: item);
                          },
                          child: Card(
                            child: Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("学期：${item.term}"),
                                          Text("课程名称：${item.courseName}"),
                                          Text("课程编号：${item.courseNo}"),
                                          Text("考试日期：${item.examDate}"),
                                          Text("考试时间：${item.examTimeRange}"),
                                          Text("教室编号：${item.classroomNo}"),
                                          Text("周次：${item.weekNo}，星期：${item.weekDay}，节次：${item.startSection} - ${item.endSection}"),
                                          Text("备注：${item.remarks}"),
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }

  Widget buildTermDropdownButton(ExamScheduleController c) {
    return Obx(() => DropdownButton<Term>(
        borderRadius: BorderRadius.circular(16),
        items: createTermItemList(c),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择学期"))),
        value: c.currentTerm.value,
        onChanged: (v) {
          c.currentTerm.value = c.terms.firstWhere((e) => e == v);
        }));
  }

  createTermItemList(ExamScheduleController c) {
    return c.terms.map((t) {
      return DropdownMenuItem<Term>(
        child: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text(t.termName))),
        value: t,
      );
    }).toList();
  }

}



