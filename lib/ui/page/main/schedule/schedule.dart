import 'package:flutter/material.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:provider/provider.dart';

import 'schedule_viewmodel.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScheduleViewModel>(
      create: (context) => ScheduleViewModel(),
      child: _SchedulePage(),
    );
    ;
  }
}

class _SchedulePage extends StatefulWidget {
  const _SchedulePage({Key? key}) : super(key: key);

  @override
  State<_SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<_SchedulePage>
    with AutomaticKeepAliveClientMixin {
  var weekdayList = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];


  @override
  void initState() {
    super.initState();


    var vm = Provider.of<ScheduleViewModel>(context, listen: false);
    vm.getWeekday(DateTime.now());
    vm.toToday();

    // print('Recent monday '+DateTime.now().day.toString());
  }

  _getDateString(DateTime dateTime) {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(child:
        Consumer<ScheduleViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              "${_getDateString(viewModel.scheduleDatetime?.dateTime ?? DateTime.now())} 第${viewModel.scheduleDatetime?.week ?? 1}周"),
          actions: [
            IconButton(
                onPressed: () {
                  viewModel.toPreviousWeek();
                },
                icon: Icon(Icons.navigate_before)),
            IconButton(
                onPressed: () {
                  viewModel.toNextWeek();
                },
                icon: Icon(Icons.navigate_next)),
            buildTermIconButton(context, viewModel),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                buildWeekGridView(viewModel),
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildSectionGridView(),
                        ),
                        Expanded(
                          flex: 7,
                          child: buildContentGridView(viewModel),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }

  IconButton buildTermIconButton(
      BuildContext context, ScheduleViewModel viewModel) {
    return IconButton(
        onPressed: () async {
          if (viewModel.termList.isEmpty)
            viewModel.getTerms();
          else
            showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("请选择学期"),
                    children: viewModel.termList.map((term) {
                      return SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                          viewModel.currentTerm = term;
                          viewModel.toTerm(term);
                        },
                        child: Text(
                          term.termName,
                        ),
                      );
                    }).toList(),
                  );
                });
        },
        icon: Icon(Icons.date_range));
  }

  GridView buildContentGridView(ScheduleViewModel viewModel) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 35,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 3),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black12, width: 0.5),
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 0.5),
                              right:
                                  BorderSide(color: Colors.black12, width: 0.5),
                            ),
                          )),
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  if (viewModel.courseList.length - 1 < index ||
                      viewModel.courseList[index].isEmpty) {
                    return Container();
                  }
                  final courses = viewModel.courseList[index];
                  final course = courses.first;
                  return Container(
                    margin: EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: viewModel.colorsMap[courses.first.courseNo],
                    ),
                    child: Center(
                      child: Text(
                        // infoList[index % 2],
                        course.classroom +
                            "#" +
                            course.name +
                            "@" +
                            course.teacher,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        });
  }

  GridView buildSectionGridView() {
    return GridView.builder(
        shrinkWrap: true,
        // physics:ClampingScrollPhysics(),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1 / 3),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              // width: 25,
              // height:s 80,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  (index + 1).toString() + "\n\n" + getTimeBySection(index + 1),
                  style: TextStyle(fontSize: 10),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff5ff5),
                // border: Border.all(color: Colors.black12, width: 0.5),
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                  right: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ));
        });
  }

  GridView buildWeekGridView(ScheduleViewModel vm) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8, childAspectRatio: 1 / 1),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: index == vm.currentWeekdayIndex ? Color(0xf7f7f7) : null,
            child: Center(
              child: index == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("星期", style: TextStyle(fontSize: 14)),
                        // SpaceWidget(height: 5),
                        Text("日期", style: TextStyle(fontSize: 12)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weekdayList[index - 1],
                            style: TextStyle(
                                fontSize: 14,
                                color: index == vm.weekday
                                    ? Colors.lightBlue
                                    : null)),
                        // SpaceWidget(height: 5),
                        Text(vm.dateList[index - 1],
                            style: TextStyle(
                                fontSize: 12,
                                color: index == vm.weekday
                                    ? Colors.lightBlue
                                    : null)),
                      ],
                    ),
            ),
          );
        });
  }

  String getTimeBySection(int section) {
    if (section == 1) return "08:25\n9:10\n\n9:15\n10:00";
    if (section == 2) return "10:25\n11:00\n\n11:15\n12:00";
    if (section == 3) return "14:30\n15:15\n\n15:20\n16:05";
    if (section == 4) return "16:30\n17:15\n\n17:20\n18:05";
    if (section == 5) return "19:30\n20:15\n\n20:25\n21:10";
    return "";
  }

  double getChildAspectRatio(BuildContext context) {
    // double cellWidth = ((MediaQuery.of(context).size.width - 1*8) / 7);
    // double desiredCellHeight = 200;
    var h = (MediaQuery.of(context).size.height) / 5;
    var w = (MediaQuery.of(context).size.width) / 7;
    return w / h;
  }

  List<DropdownMenuItem<Object?>> createDropItemList(
      ScheduleViewModel viewModel) {
    return List.generate(viewModel.termList.length, (index) {
      var item = viewModel.termList[index];
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: Text(item.termName))),
        value: item.term,
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
