import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/ui/page/experiment/experiment_items/experiment_items.dart';
import 'package:guethub/ui/route.dart';

import 'experiment_courses_controller.dart';

class ExperimentCoursesPage extends StatefulWidget {
  const ExperimentCoursesPage({super.key});

  @override
  State<ExperimentCoursesPage> createState() => _ExperimentCoursesPageState();
}

class _ExperimentCoursesPageState extends State<ExperimentCoursesPage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExperimentCoursesController());

    return Scaffold(
      appBar: AppBar(
        title: Text("实验课选课系统"),
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
                        value: c.currentTeacherCalendarOptions.value,
                        items: c.teacherCalendarOptions.map((semester) {
                          return DropdownMenuItem(
                            value: semester,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(semester.text),
                            ), // Assuming semester has a `name` field
                          );
                        }).toList(),
                        onChanged: (selectedSemester) {
                          if (selectedSemester != null) {
                            c.changeCurrentSemester(
                                selectedSemester); // Update the current semester
                          }
                        },
                        hint: Text("请选择学期"),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Text("Tip: 点击即可进行评价哦",
                //       style: TextStyle(color: Colors.grey)),
                // ),
                Expanded(
                  child: c.experimentCourseRecords.isEmpty
                      ? Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "当前学期暂时没有实验课安排，您可以尝试切换学期",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 8);
                          },
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
                          itemCount: c.experimentCourseRecords.length,
                          itemBuilder: (context, index) {
                            final item = c.experimentCourseRecords[index];
                            return Card(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                onTap: () {},
                                child: ListTile(
                                  title: SelectableText(
                                      "${item.courseName}-${item.courseNumber}"),
                                  subtitle: Text("${item.teacherCalendarText}-第${item.beginWeek ?? ""}~\n${item.endWeek ?? ""}周-${item.coursePeriod}学时-${item.credit}学分"),
                                  trailing: TextButton(
                                    onPressed: () {
                                      Get.toNamed(AppRoute.experimentItemsPage,
                                          arguments: ExperimentItemsPageArgs(
                                              taskId: item.id));
                                    },
                                    child: Text(
                                      "去选课",
                                    ),
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
