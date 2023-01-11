import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_questions_response.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_response.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'pedagogical_evaluation_edit_vm.dart';

class PedagogicalEvaluationEditPage extends StatelessWidget {
  final PedagogicalEvaluation pedagogicalEvaluation;

  PedagogicalEvaluationEditPage({Key? key, required this.pedagogicalEvaluation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PedagogicalEvaluationEditViewModel>(
      create: (context) =>
          PedagogicalEvaluationEditViewModel(this.pedagogicalEvaluation),
      child: _PedagogicalEvaluationEditPage(),
    );
  }
}

class _PedagogicalEvaluationEditPage extends StatefulWidget {
  const _PedagogicalEvaluationEditPage({Key? key}) : super(key: key);

  @override
  State<_PedagogicalEvaluationEditPage> createState() =>
      _PedagogicalEvaluationEditPageState();
}

class _PedagogicalEvaluationEditPageState
    extends State<_PedagogicalEvaluationEditPage> {
  GlobalKey _formKey = GlobalKey<FormState>();

  _submit(PedagogicalEvaluationEditViewModel viewModel, BuildContext context,
      bool isSaveOnly) {
    if (viewModel.questions.where((e) => e.score != null).length !=
        viewModel.questions.length) {
      _message(context, "还有选项未选择");
    } else {
      _asyncSubmit() async {
        bool success = false;
        String message = "操作失败";
        final resp1 = await viewModel.submitQuestions();
        message = resp1.msg;
        if (resp1.success) {
          final resp2 = await viewModel.submit(
              comment: viewModel.comment.text.trim(), isSaveOnly: isSaveOnly);
          success = resp1.success && resp2.success;
          message = resp2.msg;
        }
        if (!success) {
          throw Exception(message);
        }
      }

      _asyncSubmit().then((value) {
        _message(context, "成功");
        Navigator.of(context).pop();
      }).onError((Exception error, stackTrace) {
        _message(context, "失败：${error.toString()}");
        Logger().d(error);
        Logger().d(stackTrace);
      });
    }
  }

  _message(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        // action: SnackBarAction(label: '撤销', onPressed: Null),
        duration: Duration(milliseconds: 2000)));
  }

  // var isB
  @override
  Widget build(BuildContext context) {
    return Consumer<PedagogicalEvaluationEditViewModel>(
        builder: (context, viewModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: () {
              final data = viewModel.pedagogicalEvaluation;
              final sc = viewModel.data?.score ?? 100;
              return Text(
                "评教: 分数: ${sc} ${data.name}: ${data.cname}",
                style: TextStyle(fontSize: 20),
              );
            }(),
            actions: _isCanSubmit(viewModel)
                ? [
                    IconButton(
                        onPressed: () {
                          _submit(viewModel, context, true);
                        },
                        tooltip: "保存",
                        icon: Icon(Icons.save)),
                  ]
                : null,
          ),
          body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        itemCount: viewModel.questions.length + 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: _buildItems(index, viewModel, context),
                          );
                        }),
                  ),
                ],
              )));
    });
  }

  Widget _buildItems(int index, PedagogicalEvaluationEditViewModel viewModel, BuildContext context) {
    if (index == viewModel.questions.length) {
      return Column(children: [
        Container(
          margin: EdgeInsets.only(left: 4,right: 4),
          child: Form(
            key: _formKey,
            autovalidateMode:
                AutovalidateMode.onUserInteraction,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: viewModel.comment,
              onChanged: (v) {
                setState(() {});
              },
              autofocus: false,
              decoration: InputDecoration(hintText: "评价内容"),
              validator: (v) {
                return v!.trim().length > 0
                    ? null
                    : "评价不能为空";
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 32),
          child: ElevatedButton(
            onPressed: !_isCanSubmit(viewModel)
                ? null
                : () {
                    _submit(viewModel, context, false);
                  },
            style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 50)),
            child: _isCanSubmit(viewModel)
                ? Text("提交")
                : Text("已提交"),
          ),
        )
      ]);
    }
    final item = viewModel.questions[index];
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${index + 1}. ${item.zbnh}",
                style: TextStyle(fontSize: 18)),
            ...buildOptions(viewModel, item)
          ],
        ),
      ),
    );
  }

  bool _isCanSubmit(PedagogicalEvaluationEditViewModel viewModel) {
    return viewModel.comment.text.trim().isEmpty &&
        viewModel.pedagogicalEvaluation.chk == 0;
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
    var vm =
        Provider.of<PedagogicalEvaluationEditViewModel>(context, listen: false);
    vm.getOptions();
    vm.getCurrent();
  }
}
