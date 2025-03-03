import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/data/util/section_finder.dart';
import 'package:guethub/ui/page/course_detail/course_detail.dart';
import 'package:guethub/ui/page/main/schedule/term_dialog.dart';
import 'package:guethub/ui/route.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/ui/widget/loading_text.dart';
import 'package:guethub/util/ext.dart';
import 'package:guethub/util/string_ext.dart';
import 'package:guethub/util/time.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/kt.dart';

import 'schedule_viewmodel.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key, required this.globalTheme}) : super(key: key);

  ThemeData globalTheme;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin {
  final viewModel = Get.put(ScheduleViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getDateString(DateTime dateTime) {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }

  termDialog() async {
    if (!viewModel.newSystemMode.value) {
      await viewModel.getSemesters(isFlush: false);
      showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: widget.globalTheme,
            child: Obx(() =>
                CustomTermDialog(
                  items: viewModel.termList,
                  // 传递学期列表
                  selectedItem: viewModel.currentTerm.value,
                  // 当前选中的学期
                  title: "请选择学期",
                  onSelectItem: (term) {
                    viewModel.currentTerm.value = term;
                    viewModel.toTerm(term);
                  },
                  displayItem: (term) => term?.termName ?? "", // 显示学期的名字
                )),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: widget.globalTheme,
            child: Obx(() =>
                CustomTermDialog(
                  items: viewModel.semesters,
                  // 传递学年列表
                  selectedItem: viewModel.currentSemester.value,
                  // 当前选中的学年
                  title: "请选择学年",
                  onSelectItem: (semester) {
                    viewModel.currentSemester.value = semester;
                    viewModel.toSemester(semester);
                  },
                  displayItem: (semester) => semester?.name ?? "", // 显示学年的名字
                )),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() {
              final isThisWeekText =
                  "${viewModel.isThisWeek.isTrue ? "本周" : ""}";
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() =>
                      Text(
                          "第${viewModel
                              .scheduleDatetime.value?.week ??
                              1}周 ${_getDateString(viewModel.scheduleDatetime
                              .value
                              ?.dateTime ?? DateTime.now())}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge)),
                  if (viewModel.isSyncing.isTrue)
                    LoadingText(
                        text: Text(
                          "正在同步",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ),
                        indicatorSize: 11),
                  if (viewModel.isSyncing.isFalse &&
                      viewModel.updateDateTime.value != null)
                    Obx(
                          () =>
                          Text(
                            "${isThisWeekText}同步于${viewModel
                                .updateDateTimeText
                                .value}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall,
                          ),
                    ),
                  if (viewModel.isSyncing.isFalse &&
                      viewModel.updateDateTime.value == null)
                    Builder(builder: (context) {
                      if (viewModel.courseListIsEmpty.isTrue) {
                        return Text(
                          "${isThisWeekText}无课程",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        );
                      } else {
                        return LoadingText(
                            text: Text(
                              "正在加载",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall,
                            ),
                            indicatorSize: 12);
                      }
                    }),
                ],
              );
            }),
            actions: [
              IconButton(
                onPressed: () {
                  viewModel.toPreviousWeek();
                },
                icon: Icon(Icons.navigate_before),
              ),
              IconButton(
                onPressed: () {
                  viewModel.toNextWeek();
                },
                icon: Icon(Icons.navigate_next),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  listTileTheme: Theme
                      .of(context)
                      .listTileTheme
                      .copyWith(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                    ),
                  ),
                ),
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) =>
                  [
                    PopupMenuItem(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      value: "refresh_color_scheme",
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(Icons.style_outlined),
                        ),
                        title: Text('刷新配色'),
                        onTap: () async {
                          Navigator.pop(context);
                          viewModel.updateColorScheme();
                        },
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      value: "sync",
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(Icons.sync),
                        ),
                        title: Text('同步'),
                        onTap: () async {
                          Navigator.pop(context);
                          toast("正在尝试同步");
                          viewModel.loadData(isFlush: true);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      value: "select",
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(Icons.date_range),
                        ),
                        title: Text('选择学期'),
                        onTap: () async {
                          Navigator.pop(context);
                          await termDialog();
                        },
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      value: "isAutoAdjustHoliday",
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(Icons.swap_horiz),
                        ),
                        title: Obx(() =>
                            Text(viewModel.isAutoAdjustHoliday.isFalse
                                ? '开启自动假日调休'
                                : '关闭自动假日调休')),
                        onTap: () {
                          viewModel.toggleAutoAdjustHoliday();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    if (viewModel.isHideToggleSystemModeUI.isFalse)
                      PopupMenuItem(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        value: "switch_system",
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Icon(Icons.turn_right),
                          ),
                          title: Obx(() =>
                              Text(
                                  viewModel.newSystemMode.value
                                      ? '切换为旧系统'
                                      : '切换为新系统')),
                          onTap: () {
                            Navigator.pop(context);
                            toggleSystem();
                          },
                        ),
                      ),
                  ],
                  onSelected: (value) {},
                ),
              ),
            ],
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: [
                  WeekGridView(viewModel: viewModel),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SectionGridView(),
                        ),
                        Expanded(
                          flex: 7,
                          child: Obx(() =>
                              Stack(
                                children: [
                                  if(viewModel.courseListIsEmpty.value)
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              textScaler: TextScaler.linear(
                                                  1.0)),
                                          child: Text(
                                            "暂时没有找到数据，如果您没有登录请先登录哦\n\n如果同步成功还是没有显示，有可能是本周没有课程安排，可以切换周数试试呢",
                                            style: GoogleFonts.longCang(
                                                textStyle: TextStyle(
                                                    fontSize: 25),
                                                color: Theme
                                                    .of(context)
                                                    .colorScheme
                                                    .onSurface),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ContentGridView(viewModel: viewModel)
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> toggleSystem() async {
    viewModel.newSystemMode.toggle();
    await viewModel.getSemesters(isFlush: false);
    viewModel.updateToToday();
  }

  @override
  bool get wantKeepAlive => true;
}

class WeekGridView extends StatelessWidget {
  final ScheduleViewModel viewModel;

  const WeekGridView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < 8; index++)
          Expanded(
              flex: 1,
              child: WeekdayListItem(index: index, viewModel: viewModel))
      ],
    );
  }
}

class WeekdayListItem extends StatelessWidget {
  final int index;
  final ScheduleViewModel viewModel;

  const WeekdayListItem(
      {Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Container(
          color: index == viewModel.currentWeekdayIndex.value
              ? Color(0xf7f7f7)
              : null,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: WeekdayItem(index: index, viewModel: viewModel),
            ),
          ),
        ));
  }
}

class WeekdayItem extends StatelessWidget {
  final int index;
  final ScheduleViewModel viewModel;

  const WeekdayItem({Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index == 0
          ? MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(1.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("星期", style: TextStyle(fontSize: 14)),
            // SpaceWidget(height: 5),
            Text("日期", style: TextStyle(fontSize: 14)),
          ],
        ),
      )
          : MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(1.0)),
        // 设置 textScaleFactor 为 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
                Text(viewModel.weekdayList[index - 1],
                    style: TextStyle(
                        fontSize: 14,
                        color: index == viewModel.weekday.value
                            ? Theme
                            .of(context)
                            .colorScheme
                            .primary
                            : null))),
            Obx(
                  () =>
                  AutoSizeText(
                    viewModel.dateList[index - 1],
                    style: TextStyle(
                        fontSize: 12,
                        color: index == viewModel.weekday.value
                            ? Theme
                            .of(context)
                            .colorScheme
                            .primary
                            : null),
                    minFontSize: 6,
                    maxLines: 1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentGridView extends StatelessWidget {
  final ScheduleViewModel viewModel;

  const ContentGridView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 5; i++)
          Expanded(
            flex: 1,
            child: Row(
              children: [
                for (var j = 0; j < 7; j++)
                  Expanded(
                      flex: 1,
                      child: TableItem(
                          viewModel: viewModel,
                          index: 7 * i + j,
                          row: i,
                          column: j))
              ],
            ),
          )
      ],
    );
  }
}

bool _isLargeScreen(BuildContext context) {
  double screenWidth = MediaQuery
      .of(context)
      .size
      .width;
  return screenWidth >= 600; // 600 是一个常用的宽度阈值
}


class TableItem extends StatelessWidget {
  final ScheduleViewModel viewModel;
  final int index;
  final int row;
  final int column;

  const TableItem(
      {Key? key,
        required this.viewModel,
        required this.index,
        required this.row,
        required this.column})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = _isLargeScreen(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Container(
        margin: EdgeInsets.all(1.5),
        child: Stack(
          children: [
            Obx(() {
              if (viewModel.courseList.length - 1 < index ||
                  viewModel.courseList[index].isEmpty) {
                return InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      Get.toNamed(AppRoute.courseDetailPage,
                          arguments: CourseDetailPageArgs(
                              schedules: [],
                              scheduleTemplate:
                              genScheduleTemplate(viewModel)));
                    },
                    child: Container(
                      color: Colors.transparent, // 不加颜色不响应手势事件
                    ));
              }
              final courses = viewModel.courseList[index];
              var text = courses.map((course) {
                return course.classroom +
                    "#" +
                    (isLargeScreen
                        ? course.name
                        : course.name.truncateCodePoint(7)) +
                    "@" +
                    course.teachers;
              }).join(" || ");

              final exam = courses.firstWhereOrNull((e) =>
              e.source == SemesterScheduleSource.bkjwtest_exam_schedule);

              SemesterSchedule? minStartTimeSchedule;
              try {
                minStartTimeSchedule = courses.kt
                    .filter((e) => e.startTime != null)
                    .minBy((e) => ExtendedTimeOfDay.parse(e.startTime!));
              } catch (e) {}

              if (minStartTimeSchedule != null &&
                  ExtendedTimeOfDay.parse(minStartTimeSchedule.startTime!) !=
                      ExtendedTimeOfDay.parse(
                          SemesterSchedule.getTimeBySection(row + 1).$1)) {
                text = minStartTimeSchedule.startTime! + '^' + text;
              }

              final spanColor = viewModel.colorsMap[courses.first.courseNo];
              final cornerColor = viewModel.cornerColorMap[spanColor];

              return InkWell(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: spanColor,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 6),
                        child: Center(
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isLargeScreen ? 14 : 10,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      if (courses.length >= 2)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical:  isLargeScreen ? 6 : 3, horizontal:  isLargeScreen ? 8 : 4),
                            decoration: BoxDecoration(
                              color: cornerColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: Text(
                              '${courses.length}',
                              style:
                              TextStyle(color: Colors.white, fontSize: isLargeScreen ? 14 : 10),
                            ),
                          ),
                        ),
                      if (exam != null)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all( isLargeScreen ? 6 : 3),
                            decoration: BoxDecoration(
                              color: cornerColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: Text(
                              '考',
                              style:
                              TextStyle(color: Colors.white, fontSize: isLargeScreen ? 14 : 10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoute.courseDetailPage,
                      arguments: CourseDetailPageArgs(
                          schedules: courses,
                          scheduleTemplate: genScheduleTemplate(viewModel)));
                },
              );
            })
          ],
        ),
      ),
    );
  }

  SemesterSchedule genScheduleTemplate(ScheduleViewModel vm) {
    final term = vm.newSystemMode.isTrue
        ? viewModel.currentSemester.value?.id.toString()
        : viewModel.currentTerm.value?.term;
    final termName = vm.newSystemMode.isTrue
        ? viewModel.currentSemester.value?.name.toString()
        : viewModel.currentTerm.value?.termName;

    if (termName == null || term == null) {
      toastFailure0("学期信息为空，无法添加课程，请同步数据后重试");
      throw Exception("学期信息为空，无法添加课程，请同步数据后重试");
    }
    return SemesterSchedule.emptyInstance()
      ..weekday = column + 1
      ..section = row + 1
      ..term = term
      ..termName = termName
      ..startWeek = viewModel.scheduleDatetime.value!.week
      ..endWeek = viewModel.scheduleDatetime.value!.week
      ..startTime = SemesterSchedule.getTimeBySection(row + 1).$1
      ..endTime = SemesterSchedule.getTimeBySection(row + 1).$2;
  }
}

class SectionGridView extends StatelessWidget {
  const SectionGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final padding = constraints.maxHeight * 0.005;

          // 使用基于逻辑像素和 textScaler 的字体大小计算方法
          double fontSize =
          getFontSizeFromLogicalPixels(context, constraints.maxHeight);

          return Column(
            children: [
              for (var index = 0; index < 5; index++)
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomAutoSizeText(
                              text: newSectionMap[index + 1] ?? "",
                              fontSize: fontSize),
                          SizedBox(height: padding),
                          TimeSectionWidget(
                              times: getTimeBySection(index + 1),
                              padding: padding,
                              fontSize: fontSize),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          );
        });
  }

  // 通过逻辑像素和 textScaler 获取字体大小
  double getFontSizeFromLogicalPixels(BuildContext context,
      double containerHeight) {
    final textScaler = MediaQuery.textScalerOf(context); // 获取 textScaler
    final logicalPixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio; // 逻辑像素密度

    // 基于容器高度和逻辑像素密度计算字体大小
    double baseFontSize = containerHeight / logicalPixelRatio * 0.05;

    // 使用 textScaler 来调整字体大小
    return textScaler.scale(baseFontSize);
  }

  List<String> getTimeBySection(int section) {
    if (section == 1) return ["08:25", "09:10", "09:15", "10:00"];
    if (section == 2) return ["10:25", "11:10", "11:15", "12:00"];
    if (section == 3) return ["14:30", "15:15", "15:20", "16:05"];
    if (section == 4) return ["16:30", "17:15", "17:20", "18:05"];
    if (section == 5) return ["19:30", "20:15", "20:25", "21:10"];
    return [];
  }
}

final newSectionMap = {1: "1 2", 2: "3 4", 3: "5 6", 4: "7 8", 5: "9 10"};

class CustomAutoSizeText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomAutoSizeText(
      {Key? key, required this.text, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      // 设置 textScaleFactor 为 1
      child: AutoSizeText(
        text,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
        maxFontSize: 16,
        minFontSize: 6,
      ),
    );
  }
}

class TimeSectionWidget extends StatelessWidget {
  final List<String> times;
  final double padding;
  final double fontSize;

  const TimeSectionWidget({Key? key,
    required this.times,
    required this.padding,
    required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < times.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == 1 ? padding : 0),
            child: CustomAutoSizeText(text: times[i], fontSize: fontSize),
          ),
      ],
    );
  }
}
