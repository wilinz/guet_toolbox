import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/ui/widget/selection_transformer.dart';

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({super.key, required this.schedule});

  final List<SemesterSchedule> schedule;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.schedule.length,
      itemBuilder: (_,i){
        return CourseDetailPageContent(
          schedule: widget.schedule[i],
          toNext: () {
            pageController.nextPage(
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
          toPrevious: () {
            pageController.previousPage(
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
          pageCount: () => widget.schedule.length,
        );
      },
      controller: pageController,
    );
  }
}

class CourseDetailPageContent extends StatefulWidget {
  const CourseDetailPageContent(
      {Key? key,
      required this.schedule,
      this.toPrevious,
      this.toNext,
      this.pageCount})
      : super(key: key);
  final SemesterSchedule schedule;
  final Function()? toPrevious;
  final Function()? toNext;
  final int Function()? pageCount;

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
    return Scaffold(
      appBar: AppBar(
          title: Text(schedule.name, overflow: TextOverflow.ellipsis),
          actions: (widget.pageCount?.call() ?? 1) > 1
              ? [
                  IconButton(
                      onPressed: () {
                        widget.toPrevious?.call();
                      },
                      icon: Icon(Icons.navigate_before)),
                  IconButton(
                      onPressed: () {
                        widget.toNext?.call();
                      },
                      icon: Icon(Icons.navigate_next)),
                ]
              : []),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,0,16,16),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                final list = [
                  buildRow("课程名称：", schedule.name),
                  buildRow("课号：", schedule.courseNo),
                  buildRow("类型：", schedule.type),
                  buildRow("类型名称：", schedule.typename),
                  buildRow("考试类别：", schedule.examType),
                  buildRow("专业名称：", schedule.majorName),
                  buildRow("专业序号：", schedule.majorNo),
                  buildRow("学期：", schedule.grade),
                  buildRow("教师：", schedule.teacher),
                  buildRow("教师序号：", schedule.teacherNo),
                  buildRow("学期：", schedule.term),
                  buildRow("课程标识：", schedule.courseId),
                  buildRow("课程容量：", schedule.capacity.toString()),
                  buildRow("已选人数：", schedule.selected.toString()),
                  buildRow("学分：", schedule.credits.toString()),
                  buildRow("实验课：", schedule.isLab ? "是" : "否"),
                  buildRow("课程备注：", schedule.comment),
                  buildRow("实验ID：", schedule.labLessonId),
                  buildRow("实验名称：", schedule.experiment),
                  buildRow("教室：", schedule.classroom),
                  buildRow("教室别名：", schedule.classroomAlias),
                  buildRow("开始周：", schedule.startWeek.toString()),
                  buildRow("结束周：", schedule.endWeek.toString()),
                  buildRow("星期：", schedule.weekday.toString()),
                  buildRow("节次：", schedule.section.toString()),
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
