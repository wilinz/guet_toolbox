import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/teaching_evaluation/teaching_evaluation.dart';
import 'package:guethub/data/model/teaching_evaluation_submit/teaching_evaluation_submit.dart';

import 'teaching_evaluation_content_controller.dart';

class TeachingEvaluationContentPageArgs{
  final Task task;
  final Teachers teacher;

  TeachingEvaluationContentPageArgs({required this.task, required this.teacher});
}

class TeachingEvaluationContentPage extends StatelessWidget {
  const TeachingEvaluationContentPage(
      {super.key, required this.args});

  final TeachingEvaluationContentPageArgs args;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(TeachingEvaluationContentController(args.task, args.teacher));
    return Scaffold(
      appBar: AppBar(
        title: Text("评教"),
      ),
      body: Obx(() => Form(
            key: c.formKey,
            child: ListView.builder(
                itemCount: c.questions.length + 1,
                itemBuilder: (context, index) {
                  if (index == c.questions.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  c.submit(false);
                                },
                                child: Text("提交")),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  c.submit(true);
                                },
                                child: Text("匿名提交")),
                          ),
                        ],
                      ),
                    );
                  }
                  final item = c.questions[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(item.chineseNum + ". " + item.attribute.name),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              for (final content in item.contents)
                                Builder(builder: (context) {
                                  if (content.scoreing != null) {
                                    return Column(
                                      children: [
                                        SelectableText(
                                            content.scoreing!.attribute.name),
                                        Obx(
                                          () {
                                            final answer =
                                                c.questionsAndAnswers[
                                                    content.id]!;
                                            return Slider(
                                              value: answer.answer.score
                                                  .toDouble(),
                                              onChanged: (newValue) {
                                                c.questionsAndAnswers[
                                                        content.id] =
                                                    answer.copyWith(
                                                        answer: answer.answer
                                                            .copyWith(
                                                                score: newValue
                                                                    .toInt()));
                                              },
                                              min: content.scoreing!
                                                  .optionSetting.minScore
                                                  .toDouble(),
                                              max: content.scoreing!
                                                  .optionSetting.maxScore
                                                  .toDouble(),
                                              divisions: content.scoreing!
                                                      .optionSetting.iconNum -
                                                  1,
                                              label:
                                                  '分数: ${answer.answer.score}',
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  } else if (content.fillBlank != null) {
                                    return Obx(() {
                                      final answer =
                                          c.questionsAndAnswers[content.id]!;
                                      return Column(
                                        children: [
                                          SelectableText(content
                                              .fillBlank!.attribute.name),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: TextFormField(
                                              controller: c.getTextEditingController(answer.questionnaireId, content.id.toString()),
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                labelText: "评价内容",
                                                hintText: "评价内容",
                                                // helperText: '用户名',
                                                border:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16))),
                                              ),
                                              maxLength: 200,
                                              maxLines: 10,
                                              minLines: 1,
                                              validator: (v) {
                                                return v!.trim().length > 50
                                                    ? null
                                                    : "不少于50字";
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                  } else if (content.radio != null) {
                                    return Obx(() {
                                      final answer =
                                          c.questionsAndAnswers[content.id]!;
                                      return Column(children: [
                                        SelectableText(
                                            content.radio!.attribute.name),
                                        SizedBox(height: 16),
                                        ...content.radio!.options
                                            .map<Widget>((option) {
                                          return RadioListTile<int>(
                                            title: Text(option.value),
                                            value: option.optionId,
                                            groupValue: answer
                                                .answer
                                                .questionAnsExpSave
                                                .first
                                                .optionId
                                                .toIntOrNull(),
                                            onChanged: (int? value) {
                                              if (value != null) {
                                                c.questionsAndAnswers[
                                                    content
                                                        .id] = answer.copyWith(
                                                    answer: answer.answer.copyWith(
                                                        questionAnsExpSave: answer
                                                            .answer
                                                            .questionAnsExpSave
                                                          ..first.optionId =
                                                              value
                                                                  .toString()));
                                              }
                                            },
                                          );
                                        }).toList()
                                      ]);
                                    });
                                  } else {
                                    return Container();
                                  }
                                })
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
