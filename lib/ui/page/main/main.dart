import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/term.dart';
import 'package:guettoolbox/ui/page/main/main_viewmodel.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      child: _MainPage(),
    );
    ;
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  String? selected = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Consumer<MainViewModel>(builder: (context, viewModel, child) {
            return Column(
              children: [
                DropdownButton(
                    items: createDropItemList(viewModel),
                    hint: Container(
                        padding: EdgeInsets.all(8),
                        child: Center(child: Text("请选择"))),
                    value: viewModel.currentTerm?.term,
                    onChanged: (v) {
                      v as String;
                      viewModel.getCourseList(v);
                      setState(() {
                        viewModel.currentTerm =
                            viewModel.termList.firstWhere((e) => e.term == v);
                      });
                    }),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    child: GridView.builder(
                        itemCount: 7 * 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7, //横轴三个子widget
                            childAspectRatio:
                                getChildAspectRatio(context) //宽高比为1时，子widget
                            ),
                        itemBuilder: (context, i) {
                          var child = null;
                          if (viewModel.courseList.length > i) {
                            var course = viewModel.courseList[i];
                            if (course != null) {
                              child = Text((course.croomno ?? "") +
                                  "#" +
                                  course.cname +
                                  "@" +
                                  course.name);
                            }
                          }
                          return Container(
                            child: Center(
                              child: child,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  double getChildAspectRatio(BuildContext context) {
    // double cellWidth = ((MediaQuery.of(context).size.width - 1*8) / 7);
    // double desiredCellHeight = 200;
    var h = (MediaQuery.of(context).size.height) / 5;
    var w = (MediaQuery.of(context).size.width) / 7;
    return w / h;
  }

  List<DropdownMenuItem<Object?>> createDropItemList(MainViewModel viewModel) {
    // if (viewModel.termList.isEmpty) {
    //   return [
    //     DropdownMenuItem(
    //       child: Text("null"),
    //       value: "null",
    //     )
    //   ];
    // }
    return List.generate(viewModel.termList.length, (index) {
      var item = viewModel.termList[index];
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: Text(item.termname))),
        value: item.term,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    var vm = Provider.of<MainViewModel>(context, listen: false);
    vm.getTermList();
  }
}
