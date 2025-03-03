import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/ui/page/pedagogical_evaluation/pedagogical_evaluation_vm.dart';
import 'package:guethub/ui/route.dart';

class PedagogicalEvaluationPage extends StatefulWidget {
  const PedagogicalEvaluationPage({Key? key}) : super(key: key);

  @override
  State<PedagogicalEvaluationPage> createState() =>
      _PedagogicalEvaluationPageState();
}

class _PedagogicalEvaluationPageState extends State<PedagogicalEvaluationPage> {
  final c = Get.put(PedagogicalEvaluationViewModel());

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
              child: Row(
                  children: <Widget>[
                    Expanded(child: buildTermDropdownButton()),
                    SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          c.getList(c.currentTerm.value!.term);
                        },
                        child: Text("查询")),
                  ]),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    itemCount: c.pedagogicalEvaluations.length,
                    itemBuilder: (context, index) {
                      final item = c.pedagogicalEvaluations[index];
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
                                          Text(
                                              item.courseno + " " + item.cname),
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
    return Obx(() => DropdownButton<Term>(
        borderRadius: BorderRadius.circular(16),
        items: createTermItemList(),
        hint: Container(
            padding: EdgeInsets.all(8), child: Center(child: Text("请选择学期"))),
        value: c.currentTerm.value,
        onChanged: (v) {
          c.currentTerm.value = c.terms.firstWhere((e) => e == v);
        }));
  }

  createTermItemList() {
    return c.terms.map((t) {
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
    c.getTermList().then((value) {
      c.getList(c.currentTerm.value!.term);
    });
  }
}
