import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/ui/widget/selection_transformer.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/kt.dart';

import 'add_course.dart';
import 'course_detail_vm.dart';

class CourseDetailPageArgs {
  final List<SemesterSchedule> schedules;

  final SemesterSchedule scheduleTemplate;

  CourseDetailPageArgs(
      {required this.schedules, required this.scheduleTemplate});
}

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({super.key, required this.args});

  final CourseDetailPageArgs args;

  List<SemesterSchedule> get schedules => args.schedules;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CourseDetailController(widget.schedules));
    return Obx(() {
      if (c.schedules.isEmpty) {
        return AddCoursePage(widget.args.scheduleTemplate);
      }
      return PageView.builder(
        itemCount: c.schedules.length,
        itemBuilder: (_, i) {
          return CourseDetailPageContent(
            schedule: c.schedules[i],
            toNext: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            },
            toPrevious: () {
              pageController.previousPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            },
            pageCount: () => c.schedules.length,
            onAddSchedule: () async {
              final result =
                  await Get.to(AddCoursePage(widget.args.scheduleTemplate));
              if (result != null) {
                c.schedules.add(result);
              }
            },
            onDeleteSchedule: (schedule) async {
              showDeleteConfirmationDialog(context, schedule, c);
            },
            onEditSchedule: (schedule) async {
              final result = await Get.to(AddCoursePage(schedule));
              if (result != null) {
                c.schedules[c.schedules.indexOf(schedule)] = result;
              }
            },
          );
        },
        controller: pageController,
      );
    });
  }

  void showDeleteConfirmationDialog(BuildContext context,
      SemesterSchedule schedule, CourseDetailController c) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("确认删除"),
          content: Text("您确定要删除课程 \"${schedule.name}\" 吗？"),
          actions: [
            TextButton(
              onPressed: () {
                // 取消操作
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () async {
                // 执行删除操作
                await c.deleteSchedule(schedule);
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text("确认"),
            ),
          ],
        );
      },
    );
  }
}

class CourseDetailPageContent extends StatefulWidget {
  const CourseDetailPageContent({
    Key? key,
    required this.schedule,
    this.toPrevious,
    this.toNext,
    this.pageCount,
    this.onAddSchedule,
    this.onDeleteSchedule,
    this.onEditSchedule,
  }) : super(key: key);

  final SemesterSchedule schedule;
  final Function()? toPrevious;
  final Function()? toNext;
  final int Function()? pageCount;
  final Function()? onAddSchedule;
  final Function(SemesterSchedule)? onDeleteSchedule;
  final Function(SemesterSchedule)? onEditSchedule;

  @override
  State<CourseDetailPageContent> createState() =>
      _CourseDetailPageContentState();
}

class _CourseDetailPageContentState extends State<CourseDetailPageContent>
    with AutomaticKeepAliveClientMixin {
  SemesterSchedule get schedule => widget.schedule;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isShowToggleButton = (widget.pageCount?.call() ?? 1) > 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(schedule.name, overflow: TextOverflow.ellipsis),
          actions: [
            if (isShowToggleButton)
              IconButton(
                  onPressed: () {
                    widget.toPrevious?.call();
                  },
                  icon: Icon(Icons.navigate_before)),
            if (isShowToggleButton)
              IconButton(
                  onPressed: () {
                    widget.toNext?.call();
                  },
                  icon: Icon(Icons.navigate_next)),
            PopupMenuButton<int>(
              onSelected: (value) {
                switch (value) {
                  case 1:
                    widget.onDeleteSchedule?.call(schedule);
                    break;
                  case 2:
                    widget.onEditSchedule?.call(schedule);
                    break;
                  case 3:
                    widget.onAddSchedule?.call();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline),
                      SizedBox(width: 8),
                      Text("删除"),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined),
                      SizedBox(width: 8),
                      Text("编辑"),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text("添加"),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                final source =
                    SemesterScheduleSource.toSystemAndUser(schedule.source).let(
                        (it) =>
                            it == SemesterScheduleSource.system ? '系统' : '用户');

                final list = [
                  buildRow("课程名称：", schedule.name),
                  buildRow("课号：", schedule.courseNo),
                  // buildRow("来源：", source),
                  buildRow("教室：", schedule.classroom),
                  buildRow("教室别名：", schedule.classroomAlias),
                  buildRow("开始时间：", schedule.startTime ?? ''),
                  buildRow("结束时间：", schedule.endTime ?? ''),
                  buildRow("课程备注：",
                      schedule.comment.let((it) => it.isNotBlank ? it : '无备注')),
                  buildRow("课程类型：", schedule.type),
                  buildRow("类型名称：", schedule.typename),
                  buildRow("考试类别：", schedule.examType),
                  buildRow("专业名称：", schedule.majorName),
                  buildRow("年级：", schedule.grade),
                  buildRow("教师：", schedule.teachers),
                  buildRow("学期名称：", schedule.termName),
                  buildRow("课程容量：", schedule.capacity.toString()),
                  buildRow("已选人数：", schedule.selected.toString()),
                  buildRow("学分：", schedule.credits.toString()),
                  buildRow("实验课：", schedule.isLab ? "是" : "否"),
                  buildRow("实验批次：", schedule.batch.toString()),
                  buildRow("实验批次号：", schedule.experimentNo),
                  buildRow("实验名称：", schedule.experiment),
                  buildRow("开始周：", schedule.startWeek.toString()),
                  buildRow("结束周：", schedule.endWeek.toString()),
                  buildRow("星期：", schedule.weekday.toString()),
                  buildRow("大节节次：", schedule.section.toString()),
                ];
                return SelectionArea(
                  child: SelectionTransformer.tabular(
                    columns: 2,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(7),
                      },
                      children: list,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  String getDisplayText(String text) => text.isNotEmpty ? text : " ";

  TableRow buildRow(String key, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              key,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(getDisplayText(value)),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
