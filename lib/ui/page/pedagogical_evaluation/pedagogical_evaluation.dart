import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/page/pedagogical_evaluation/pedagogical_evaluation_vm.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:provider/provider.dart';

class PedagogicalEvaluationPage extends StatelessWidget {
  const PedagogicalEvaluationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PedagogicalEvaluationViewModel>(
      create: (context) => PedagogicalEvaluationViewModel(),
      child: _PedagogicalEvaluationPage(),
    );
  }
}

class _PedagogicalEvaluationPage extends StatefulWidget {
  const _PedagogicalEvaluationPage({Key? key}) : super(key: key);

  @override
  State<_PedagogicalEvaluationPage> createState() =>
      _PedagogicalEvaluationPageState();
}

class _PedagogicalEvaluationPageState
    extends State<_PedagogicalEvaluationPage> {
  // var isB
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评教"),
      ),
      body: Consumer<PedagogicalEvaluationViewModel>(
          builder: (context, viewModel, child) {
        return Container(
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
                      buildTermDropdownButton(viewModel),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.getList(viewModel.currentTerm!.term);
                          },
                          child: Text("查询")),
                    ]),
              ),
              Expanded(
                  child: ListView.builder(
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
                      }))
            ],
          ),
        );
      }),
    );
  }

  DropdownButton<String> buildTermDropdownButton(
      PedagogicalEvaluationViewModel viewModel) {
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

  createTermItemList(PedagogicalEvaluationViewModel viewModel) {
    return viewModel.terms.map((t) {
      return DropdownMenuItem(
        child: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text(t.termname))),
        value: t.term,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    var vm =
        Provider.of<PedagogicalEvaluationViewModel>(context, listen: false);
    vm.getTermList();
  }
}
