import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_questions_response.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:logger/logger.dart';

import 'pedagogical_evaluation_edit_vm.dart';

class PedagogicalEvaluationEditPage extends StatefulWidget {
  const PedagogicalEvaluationEditPage(
      {Key? key, required this.pedagogicalEvaluation})
      : super(key: key);

  final PedagogicalEvaluation pedagogicalEvaluation;

  @override
  State<PedagogicalEvaluationEditPage> createState() =>
      _PedagogicalEvaluationEditPageState();
}

class _PedagogicalEvaluationEditPageState
    extends State<PedagogicalEvaluationEditPage> {
  GlobalKey _formKey = GlobalKey<FormState>();

  _submit(BuildContext context, bool isSaveOnly) {
    if (c.questions.where((e) => e.score != null).length !=
        c.questions.length) {
      Get.snackbar("还有选项未选择", "");
    } else {
      _asyncSubmit() async {
        bool success = false;
        String message = "操作失败";
        final resp1 = await c.submitQuestions();
        message = resp1.msg;
        if (resp1.success) {
          final resp2 = await c.submit(
              comment: c.comment.text.trim(), isSaveOnly: isSaveOnly);
          success = resp1.success && resp2.success;
          message = resp2.msg;
        }
        if (!success) {
          throw Exception(message);
        }
      }

      _asyncSubmit().then((value) {
        Get.snackbar("成功", "");
        Navigator.of(context).pop();
      }).onError((Exception error, stackTrace) {
        Get.snackbar("失败", error.toString());
        Logger().d(error);
        Logger().d(stackTrace);
      });
    }
  }

  late PedagogicalEvaluationEditViewModel c;

  // var isB
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Obx(
              () {
                final data = c.pedagogicalEvaluation;
                final sc = c.data.value?.score ?? 100;
                return Text(
                  "评教: 分数: ${sc} ${data.name}: ${data.cname}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            actions: [
              Obx(
                () => c.isCanSubmit.value
                    ? IconButton(
                        onPressed: () {
                          _submit(context, true);
                        },
                        tooltip: "保存",
                        icon: Icon(Icons.save))
                    : SizedBox(),
              )
            ]),
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  itemCount: c.questions.length + 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: _buildItems(index, context),
                    );
                  })),
            ),
          ],
        )));
  }

  Widget _buildItems(int index, BuildContext context) {
    return Obx(() {
      if (index == c.questions.length) {
        return Column(children: [
          Container(
            margin: EdgeInsets.only(left: 4, right: 4),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: c.comment,
                onChanged: (v) {
                  setState(() {});
                },
                autofocus: false,
                decoration: InputDecoration(hintText: "评价内容"),
                validator: (v) {
                  return v!.trim().length > 0 ? null : "评价不能为空";
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 32),
            child: ElevatedButton(
              onPressed: !c.isCanSubmit.value
                  ? null
                  : () {
                      _submit(context, false);
                    },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: c.isCanSubmit.value ? Text("提交") : Text("提交"),
            ),
          )
        ]);
      }
      final item = c.questions[index];
      return Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${index + 1}. ${item.zbnh}",
                  style: TextStyle(fontSize: 18)),
              ...buildOptions(c, item)
            ],
          ),
        ),
      );
    });
  }

  List<RadioListTile> buildOptions(PedagogicalEvaluationEditViewModel vm,
      PedagogicalEvaluationQuestion item) {
    return item.options.map((e) {
      return RadioListTile(
          title: Text("${e.name}(${e.score}分)"),
          value: e.score,
          groupValue: item.score,
          onChanged: (v) {
            setState(() {
              item.score = v;
              vm.calculateTheScore();
            });
          });
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    c = Get.put(
        PedagogicalEvaluationEditViewModel(widget.pedagogicalEvaluation));
    c.getOptions();
    c.getCurrent();
  }
}
