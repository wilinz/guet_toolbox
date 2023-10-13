import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/ui/page/pedagogical_evaluation/pedagogical_evaluation_vm.dart';
import 'package:guettoolbox/ui/route.dart';

class PedagogicalEvaluationPage extends StatefulWidget {
  const PedagogicalEvaluationPage({Key? key}) : super(key: key);

  @override
  State<PedagogicalEvaluationPage> createState() =>
      _PedagogicalEvaluationPageState();
}

class _PedagogicalEvaluationPageState extends State<PedagogicalEvaluationPage> {

  final viewModel = Get.put(PedagogicalEvaluationViewModel());

  // var isB
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评教"),
      ),
      body: Container(
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Wrap(
                  spacing: 8.0,
                  // 主轴(水平)方向间距
                  runSpacing: 4.0,
                  // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.start,
                  //沿主轴方向居中
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    buildTermDropdownButton(),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getList(viewModel.currentTerm.value!.term);
                        },
                        child: Text("查询")),
                  ]),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      itemCount: viewModel.pedagogicalEvaluations.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.pedagogicalEvaluations[index];
                        return Container(
                          margin: EdgeInsets.only(top: 4, bottom: 4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoute.pedagogicalEvaluationEditPage,
                                  arguments: item);
                            },
                            child: Card(
                              child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(item.courseno +
                                                " " +
                                                item.cname),
                                            Text(item.name)
                                          ],
                                        ),
                                        flex: 1,
                                      ),
                                      Text(
                                        item.chk == 0 ? "点击评教" : "已评教",
                                        style: TextStyle(
                                            color: item.chk == 0
                                                ? Colors.green
                                                : Colors.red),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      })))
          ],
        ),
      ),
    );
  }

  Widget buildTermDropdownButton() {
    return Obx(() =>
        DropdownButton<Term>(
            items: createTermItemList(viewModel),
            hint: Container(
                padding: EdgeInsets.all(8),
                child: Center(child: Text("请选择学期"))),
            value: viewModel.currentTerm.value,
            onChanged: (v) {
              viewModel.currentTerm.value =
                  viewModel.terms.firstWhere((e) => e == v);
            }));
  }

  createTermItemList(PedagogicalEvaluationViewModel viewModel) {
    return viewModel.terms.map((t) {
      return DropdownMenuItem<Term>(
        child: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text(t.termName))),
        value: t,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    viewModel.getTermList().then((value) {
      viewModel.getList(viewModel.currentTerm.value!.term);
    });
  }
}
