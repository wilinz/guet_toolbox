import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/ui/page/teaching_evaluation/content/teaching_evaluation_content.dart';
import 'package:guethub/ui/page/teaching_evaluation/teaching_evaluation_controller.dart';
import 'package:guethub/ui/route.dart';

class TeachingEvaluationPage extends StatefulWidget {
  const TeachingEvaluationPage({super.key});

  @override
  State<TeachingEvaluationPage> createState() => _TeachingEvaluationState();
}

class _TeachingEvaluationState extends State<TeachingEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(TeachingEvaluationController());

    return Scaffold(
      appBar: AppBar(
        title: Text("评教"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return Center(child: CircularProgressIndicator()); // 显示加载指示器
        } else if (c.hasError.value) {
          return Center(
            child: TextButton(
              onPressed: () {
                c.refreshData();
              },
              child: Text(
                "加载失败，点击重试",
                style: GoogleFonts.longCang(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await c.refreshData();
            },
            child: Column(
              children: [
                // 学期选择下拉菜单
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("选择学期: "),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(8),
                        value: c.currentSemester.value,
                        items: c.semester.map((semester) {
                          return DropdownMenuItem(
                            value: semester,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(semester.name),
                            ), // Assuming semester has a `name` field
                          );
                        }).toList(),
                        onChanged: (selectedSemester) {
                          if (selectedSemester != null) {
                            c.currentSemester(selectedSemester); // Update the current semester
                          }
                        },
                        hint: Text("请选择学期"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Tip: 点击教师名字即可进行评教哦", style: TextStyle(color: Colors.grey)),
                ),
                Expanded(
                  child: c.teachingEvaluationData.isEmpty
                      ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "当前学期暂时没有评教信息，您可以尝试切换学期",
                        style: TextStyle(color: Colors.grey, fontSize: 16,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: c.teachingEvaluationData.length,
                    itemBuilder: (context, index) {
                      final item = c.teachingEvaluationData[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(item.courseName + " " + item.lessonCode),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  item.majorStatus ? "已完成" : "未完成",
                                  style: TextStyle(
                                    color: item.majorStatus ? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                for (final task in item.taskList)
                                  for (final teacher in task.teachers)
                                    Row(
                                      children: [
                                        Text(task.evaluationQuestionnaireName),
                                        TextButton(
                                          onPressed: teacher.status == "END_EVALUATED"
                                              ? null
                                              : () {
                                            Get.toNamed(
                                              AppRoute
                                                  .teachingEvaluationContentPage,
                                              arguments:
                                              TeachingEvaluationContentPageArgs(
                                                task: task,
                                                teacher: teacher,
                                              ),
                                            );
                                          },
                                          child: Text(teacher.teacherName),
                                        ),
                                        if (teacher.status == "END_EVALUATED")
                                          Text(
                                            "已评  ",
                                            style: TextStyle(color: Colors.green),
                                          ),
                                        if (teacher.status != "END_EVALUATED")
                                          Text(
                                            "未评  ",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        Text("${task.days} 天后结束")
                                      ],
                                    ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
