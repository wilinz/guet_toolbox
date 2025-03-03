import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'textbook_evaluate_detail_controller.dart';

class TextbookEvaluateDetailPageArgs {
  final int semesterId;
  final int batchId;
  final int courseId;
  final int textbookId;

  TextbookEvaluateDetailPageArgs({
    required this.semesterId,
    required this.batchId,
    required this.courseId,
    required this.textbookId,
  });
}
class TextbookEvaluateDetailPage extends StatelessWidget {
  const TextbookEvaluateDetailPage({super.key, required this.args});

  final TextbookEvaluateDetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(TextbookEvaluateDetailController(args));

    return Scaffold(
      appBar: AppBar(
        title: Text("教材评价"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (c.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(  onPressed: () {
                  c.onInit(); // 重试加载数据
                },child: Text("加载失败，点击重试", style: TextStyle(color: Colors.red))),

              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await c.onInit(); // 下拉刷新时重新加载数据
          },
          child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final (i, item) in c.textbookEvaluateDetail.indexed)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            "${i + 1}. ${item.nameZh}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          if (item.questionType.$name == "SINGLE_CHOICE")
                            Column(
                              children: item.options!.map((option) {
                                return RadioListTile<int>(
                                  title: Text(option.contentZh),
                                  value: option.score,
                                  groupValue: c.selectedOptions[item.nameZh],
                                  onChanged: (int? value) {
                                    c.updateSelectedOption(item.nameZh, value);
                                  },
                                );
                              }).toList(),
                            )
                          else if (item.questionType.$name == "SUBJECTIVE_QUESTION")
                            TextFormField(
                              controller: c.textControllers[item.nameZh],
                              autovalidateMode: AutovalidateMode.disabled,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: "可选",
                                hintText: "可选",
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                              maxLength: 200,
                              maxLines: 10,
                              minLines: 1,
                            ),
                          SizedBox(height: 16),
                        ],
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            c.submit();
                          },
                          child: Text("提交")),
                    ),
                    SizedBox(height: 32,)
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}