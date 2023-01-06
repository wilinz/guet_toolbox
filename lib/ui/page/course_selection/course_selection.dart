import 'package:flutter/material.dart';
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

  var text="";
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
                alignment: WrapAlignment.center,
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
                  buildMajorDropdownButton(viewModel),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getPlan(
                            term: viewModel.currentTerm!.term,
                            grade: viewModel.studentInfo!.grade,
                            dptno: viewModel.currentAcademy!.dptno,
                            spno: viewModel.currentMajor!.spno).then((value) {
                              setState(() {
                                text=value;
                              });
                        });
                      },
                      child: Text("查询"))
                ]),
            Expanded(child: SingleChildScrollView(
              child: SelectableText(text),
            ))


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
