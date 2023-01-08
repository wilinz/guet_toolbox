import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/plan_course_detail_response.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection_vm.dart';
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

  var isNetworkOnly = false;

  final networkFilter = (PlanCourseDetail e) {
    return e.cname!.contains("网络");
  };

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
          children: [
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
                  Text(
                    "年级：${viewModel.studentInfo?.grade ?? ""}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 4,
                  ),
                  buildTermDropdownButton(viewModel),
                  buildAcademyDropdownButton(viewModel),
                  buildMajorDropDownTextField(viewModel),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getPlan(
                            term: viewModel.currentTerm!.term,
                            grade: viewModel.studentInfo!.grade,
                            dptno: viewModel.currentAcademy!.dptno,
                            spno: viewModel.currentMajor!.spno);
                      },
                      child: Text("查询")),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getPlan(
                            term: viewModel.currentTerm!.term,
                            grade: viewModel.studentInfo!.grade,
                            dptno: viewModel.currentAcademy!.dptno,
                            spno: viewModel.currentMajor!.spno,
                            networkCourseOnly: true);
                      },
                      child: Text("仅查询网课"))
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
                  CheckboxListTile(
                      title: Text("只看网络"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isNetworkOnly,
                      onChanged: (v) {
                        setState(() {
                          isNetworkOnly = v!;
                          if (isNetworkOnly) {
                            viewModel.filter(networkFilter);
                          } else {
                            viewModel.undoFilter(networkFilter);
                          }
                          viewModel.notify();
                        });
                      }),
                  // CheckboxListTile(
                  //     title: Text("只看网络"),
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     value: isNetworkOnly,
                  //     onChanged: (v) {
                  //       setState(() {
                  //         isNetworkOnly = v!;
                  //         if (isNetworkOnly) {
                  //           viewModel.filter(networkFilter);
                  //         } else {
                  //           viewModel.undoFilter(networkFilter);
                  //         }
                  //         viewModel.notify();
                  //       });
                  //     })
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
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: viewModel.list.length,
            //         itemBuilder: (c, i) {
            //           final item = viewModel.list[i];
            //           return Container(
            //               margin: EdgeInsets.all(8),
            //               child: SelectableText(
            //                   item));
            //         })),
          ],
        );
      }),
    );
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

  DropDownTextField buildMajorDropDownTextField(CourseSelectionViewModel viewModel) {
    return DropDownTextField(
      // initialValue: "name4",
      listSpace: 20,
      listPadding: ListPadding(top: 20),
      enableSearch: true,
      // validator: (value) {
      //   if (value == null) {
      //     return "Required field";
      //   } else {
      //     return null;
      //   }
      // },
      dropDownList: viewModel.major.map((major) {
        return DropDownValueModel(
            name: major.spno + " " + major.spname, value: major);
      }).toList(),
      // listTextStyle: const TextStyle(color: Colors.red),

      dropDownItemCount: viewModel.major.length,
      onChanged: (val) {
        val as DropDownValueModel;
        viewModel.currentMajor = val.value;
      },
    );
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
            padding: EdgeInsets.all(8),
            child: Center(child: Text(t.dptno + " " + t.dptname))),
        value: t.dptno,
      );
    }).toList();
  }

  DropdownButton<String> buildMajorDropdownButton(
      CourseSelectionViewModel viewModel) {
    return DropdownButton(
        items: createMajorItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择专业"))),
        value: viewModel.currentMajor?.spno,
        onChanged: (v) {
          v as String;
          viewModel.currentMajor =
              viewModel.major.firstWhere((e) => e.spno == v);
        });
  }

  createMajorItemList(CourseSelectionViewModel viewModel) {
    return viewModel.major.map((t) {
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: Text(t.spno + " " + t.spname))),
        value: t.spno,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    var vm = Provider.of<CourseSelectionViewModel>(context, listen: false);
    vm.getTermList();
    vm.getAcademy();
    vm.getMajors();
    vm.getStudentInfo();
  }
}
