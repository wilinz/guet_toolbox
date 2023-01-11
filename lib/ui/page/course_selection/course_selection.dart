import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/model/plan_course_detail_response.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection_vm.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:provider/provider.dart';

class CourseSelectionPage extends StatelessWidget {
  const CourseSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseSelectionViewModel>(
      create: (context) => CourseSelectionViewModel(),
      child: _CourseSelectionPage(),
    );
  }
}

class _CourseSelectionPage extends StatefulWidget {
  const _CourseSelectionPage({Key? key}) : super(key: key);

  @override
  State<_CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<_CourseSelectionPage> {
  var text = "";
  final _controller = TextEditingController(text: "");
  var isNetworkOnly = false;
  var isRemainderOnly = false;

  // var isB
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选课"),
      ),
      body: Consumer<CourseSelectionViewModel>(
          builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
                spacing: 8.0,
                // 主轴(水平)方向间距
                runSpacing: 4.0,
                // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start,
                //沿主轴方向居中
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Container(
                  //   width: 4,
                  // ),
                  // Text(
                  //   "年级：${viewModel.studentInfo?.grade ?? ""}",
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  Container(
                    width: 4,
                  ),
                  buildTermDropdownButton(viewModel),
                  buildAcademyDropdownButton(viewModel),
                  buildMajorDropdownButton(viewModel),
                ]),
            Wrap(
                spacing: 8.0,
                // 主轴(水平)方向间距
                runSpacing: 4.0,
                // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start,
                //沿主轴方向居中
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          viewModel.currentAcademy = viewModel.academy
                              .firstWhereOrNull((e) =>
                                  e.dptno == viewModel.studentInfo?.dptno);
                          viewModel.currentMajor = viewModel.major
                              .firstWhereOrNull(
                                  (e) => e.spno == viewModel.studentInfo?.spno);
                        });
                      },
                      child: Text("选择所在学院及专业")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          viewModel.currentAcademy = viewModel.academy
                              .firstWhereOrNull((e) => e.dptno == "0");
                          viewModel.currentMajor = viewModel.major
                              .firstWhereOrNull((e) => e.spno == "000000");
                        });
                      },
                      child: Text("选择通识课")),
                  ElevatedButton(
                      onPressed: !_isCanQuery(viewModel)
                          ? null
                          : () {
                              viewModel.getPlan(
                                  term: viewModel.currentTerm!.term,
                                  grade: viewModel.studentInfo!.grade,
                                  dptno: viewModel.currentAcademy!.dptno,
                                  spno: viewModel.currentMajor!.spno);
                            },
                      child: Text("查询")),
                  Builder(builder: (context) {
                    return _isGeneralStudiesClass(viewModel)
                        ? ElevatedButton(
                            onPressed: !_isCanQuery(viewModel)
                                ? null
                                : () {
                                    viewModel.getPlan(
                                        term: viewModel.currentTerm!.term,
                                        grade: viewModel.studentInfo!.grade,
                                        dptno: viewModel.currentAcademy!.dptno,
                                        spno: viewModel.currentMajor!.spno,
                                        networkCourseOnly: true);
                                  },
                            child: Text("仅查询网课"))
                        : Container();
                  })
                ]),
            Wrap(
                spacing: 8.0,
                // 主轴(水平)方向间距
                runSpacing: 4.0,
                // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start,
                //沿主轴方向居中
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Container(
                    width: 4,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: CheckboxListTile(
                        title: Text("只看网络"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isNetworkOnly,
                        onChanged: (v) {
                          setState(() {
                            isNetworkOnly = v!;
                            if (isNetworkOnly) {
                              viewModel.filter("networkFilter",
                                  (PlanCourseDetail e) {
                                return e.cname!.contains("网络");
                              });
                            } else {
                              viewModel.undoFilter("networkFilter");
                            }
                            viewModel.notify();
                          });
                        }),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: CheckboxListTile(
                        title: Text("只看剩余"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isRemainderOnly,
                        onChanged: (v) {
                          setState(() {
                            isRemainderOnly = v!;
                            if (isRemainderOnly) {
                              viewModel.filter("remainderFilter", (v) {
                                return v.maxstu-v.sctcnt > 0;
                              });
                            } else {
                              viewModel.undoFilter("remainderFilter");
                            }
                          });
                        }),
                  ),
                ]),
            Expanded(
                child: ListView.builder(
                    itemCount: viewModel.details.length,
                    itemBuilder: (c, i) {
                      final item = viewModel.details[i];
                      return Container(
                          margin: EdgeInsets.all(8),
                          child: SelectableText(
                              "${item.sctcnt}/${item.maxstu}: ${item.tname}: ${item.cname}: ${item.xf}: ${item.name}"));
                    })),
          ],
        );
      }),
    );
  }

  bool _isCanQuery(CourseSelectionViewModel vm) {
    return vm.currentTerm != null &&
        vm.currentMajor != null &&
        vm.currentAcademy != null;
  }

  bool _isGeneralStudiesClass(CourseSelectionViewModel vm) {
    return vm.currentMajor?.spno == "000000" && vm.currentAcademy?.dptno == "0";
  }

  DropdownButton<String> buildTermDropdownButton(
      CourseSelectionViewModel viewModel) {
    return DropdownButton(
        items: createTermItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择学期"))),
        value: viewModel.currentTerm?.term,
        onChanged: (v) {
          v as String;
          viewModel.currentTerm =
              viewModel.terms.firstWhere((e) => e.term == v);
        });
  }

  createTermItemList(CourseSelectionViewModel viewModel) {
    return viewModel.terms.map((t) {
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text(t.termname))),
        value: t.term,
      );
    }).toList();
  }

  DropdownButton<String> buildAcademyDropdownButton(
      CourseSelectionViewModel viewModel) {
    return DropdownButton(
        items: createAcademyItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择学院"))),
        value: viewModel.currentAcademy?.dptno,
        onChanged: (v) {
          v as String;
          viewModel.currentAcademy =
              viewModel.academy.firstWhere((e) => e.dptno == v);
        });
  }

  createAcademyItemList(CourseSelectionViewModel viewModel) {
    return viewModel.academy.map((t) {
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8), child: Text(t.dptno + " " + t.dptname)),
        value: t.dptno,
      );
    }).toList();
  }

  DropdownButton<Major> buildMajorDropdownButton(
      CourseSelectionViewModel viewModel) {
    return DropdownButton<Major>(
        items: createMajorItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择专业"))),
        value: viewModel.currentMajor,
        onChanged: (v) {
          viewModel.currentMajor = v;
        });
  }

  createMajorItemList(CourseSelectionViewModel viewModel) {
    var flag = false;
    var lastChar = "";
    return viewModel.major.map((t) {
      if (lastChar != t.firstPinyin) {
        flag = !flag;
      }
      lastChar = t.firstPinyin;
      return DropdownMenuItem<Major>(
        child: Container(
          padding: EdgeInsets.all(0),
          child: SizedBox(
            width: 200,
            child: AutoSizeText(
              t.firstPinyin + " " + t.spname + " " + t.spno,
              style: TextStyle(
                fontSize: 12,
                color: flag ? Colors.green : Colors.blue,
              ),
              maxLines: 2,
              minFontSize: 10,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        value: t,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    var vm = Provider.of<CourseSelectionViewModel>(context, listen: false);
    Future.wait([
      vm.getTermList(),
      vm.getAcademy(),
      vm.getMajors(),
    ]).then((value) {
      vm.getStudentInfo();
    });
  }
}
