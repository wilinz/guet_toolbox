import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/model/plan_course_response.dart';
import 'package:guettoolbox/data/service/course.dart';
import 'package:guettoolbox/main.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection_vm.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  var _refreshController = RefreshController();

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
            buildCourses(viewModel, context),
          ],
        );
      }),
    );
  }

  Expanded buildCourses(
      CourseSelectionViewModel viewModel, BuildContext context) {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: false,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: () {},
        onLoading: () {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDropdownButtons(viewModel),
                  buildButtons(viewModel),
                  buildCheckboxs(viewModel),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                //列表项高度固定
                delegate: SliverChildBuilderDelegate(
                  (_, i) {
                    final item = viewModel.planCourses[i];
                    return GestureDetector(
                      onTap: () {
                        if (!item.isExpand && item.details.isEmpty) {
                          showSnackBar(context, "第${i + 1}个课程正在加载", 500);
                          viewModel.getDetail(item).then((value) {
                            showSnackBar(context, "第${i + 1}个课程加载成功", 500);
                          }).onError((error, stackTrace) {
                            showSnackBar(context, "第${i + 1}个课程加载失败", 500);
                          });
                        } else {
                          setState(() {
                            item.isExpand = !item.isExpand;
                          });
                        }
                      },
                      child: Card(
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                              "${i + 1}. ${item.tname}: ${item.cname}: ${item.xf}学分")),
                                      // if (item.details.isEmpty)
                                      Text(
                                        !item.isExpand ? "点击加载详情" : "点击收起",
                                        style: TextStyle(color: Colors.green),
                                      )
                                    ],
                                  ),
                                  if (item.isExpand)
                                    buildCourseDetails(item, viewModel, context)
                                ],
                              ))),
                    );
                  },
                  childCount: viewModel.planCourses.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCourseDetails(PlanCourse item,
      CourseSelectionViewModel viewModel, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(left: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: item.details.toImmutableList().mapIndexed((i, detail) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                      "(${i + 1}) ${detail.sctcnt}/${detail.maxstu} ${detail.name}: ${detail.ap}"),
                ),
                TextButton(
                    onPressed: () {
                      viewModel.select(detail).then((value) {
                        showSnackBar(context, value.msg, 2000);
                      }).onError((error, stackTrace) {
                        showSnackBar(context, "失败：$error", 2000);
                      });
                    },
                    child: Text("选课")),
              ],
            );
          }).asList()),
    );
  }

  Wrap buildCheckboxs(CourseSelectionViewModel viewModel) {
    return Wrap(
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
          if (_isGeneralStudiesClass(viewModel))
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: CheckboxListTile(
                  title: Text("只看网课"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isNetworkOnly,
                  onChanged: (v) {
                    setState(() {
                      isNetworkOnly = v!;
                      if (isNetworkOnly) {
                        viewModel.filter("networkFilter", (e) {
                          return e.cname.contains("网络");
                        });
                      } else {
                        viewModel.undoFilter("networkFilter");
                      }
                    });
                  }),
            ),
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxWidth: 200),
          //   child: CheckboxListTile(
          //       title: Text("只看剩余"),
          //       controlAffinity: ListTileControlAffinity.leading,
          //       value: isRemainderOnly,
          //       onChanged: (v) {
          //         setState(() {
          //           isRemainderOnly = v!;
          //           if (isRemainderOnly) {
          //             viewModel.filter("remainderFilter", (v) {
          //               return v.maxstu - v.sctcnt > 0;
          //             });
          //           } else {
          //             viewModel.undoFilter("remainderFilter");
          //           }
          //         });
          //       }),
          // ),
        ]);
  }

  Container buildButtons(CourseSelectionViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Wrap(
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
                        .firstWhereOrNull(
                            (e) => e.dptno == viewModel.studentInfo?.dptno);
                    viewModel.currentMajor = viewModel.major.firstWhereOrNull(
                        (e) => e.spno == viewModel.studentInfo?.spno);
                    viewModel.studentInfo?.grade.let((it) {
                      viewModel.currentGrade = int.parse(it);
                    });
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
                    if (viewModel.studentInfo?.grade == "2022") {
                      viewModel.currentGrade = 2021;
                    }
                  });
                },
                child: Text("选择通识课")),
            ElevatedButton(
                onPressed: !_isCanQuery(viewModel)
                    ? null
                    : () {
                        viewModel.getPlan(
                            term: viewModel.currentTerm!.term,
                            grade: viewModel.currentGrade!.toString(),
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
                                  grade: viewModel.currentGrade!.toString(),
                                  dptno: viewModel.currentAcademy!.dptno,
                                  spno: viewModel.currentMajor!.spno,
                                  networkCourseOnly: true);
                            },
                      child: Text("仅查询网课"))
                  : Container();
            })
          ]),
    );
  }

  Container buildDropdownButtons(CourseSelectionViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Wrap(
          spacing: 8.0,
          // 主轴(水平)方向间距
          runSpacing: 4.0,
          // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start,
          //沿主轴方向居中
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            buildGradeDropdownButton(viewModel),
            buildTermDropdownButton(viewModel),
            buildAcademyDropdownButton(viewModel),
            buildMajorDropdownButton(viewModel),
          ]),
    );
  }

  bool _isCanQuery(CourseSelectionViewModel vm) {
    return vm.currentTerm != null &&
        vm.currentMajor != null &&
        vm.currentAcademy != null &&
        vm.currentGrade != null;
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
            padding: EdgeInsets.all(8), child: Center(child: Text(t.termName))),
        value: t.term,
      );
    }).toList();
  }

  DropdownButton buildGradeDropdownButton(CourseSelectionViewModel viewModel) {
    return DropdownButton<int?>(
        items: createGradeItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择年级"))),
        value: viewModel.currentGrade,
        onChanged: (v) {
          viewModel.currentGrade = v;
        });
  }

  createGradeItemList(CourseSelectionViewModel viewModel) {
    return viewModel.grades.map((t) {
      return DropdownMenuItem<int?>(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: Text(t.toString()))),
        value: t,
      );
    }).toList();
  }

  Widget buildAcademyDropdownButton(CourseSelectionViewModel viewModel) {
    return DropdownButton(
        items: createAcademyItemList(viewModel),
        hint: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: SizedBox(width: 200,child: Text("请选择学院")))),
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
          padding: EdgeInsets.all(8),
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
    CourseService.selectPage().then((value) {
      print(value);

      Future.wait([
        vm.getTermList(),
        vm.getAcademy(),
        vm.getMajors(),
      ]).then((value) {
        vm.getStudentInfo();
      });
      return value;
    });

  }
}
