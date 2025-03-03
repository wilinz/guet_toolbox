import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/ui/page/textbook_evaluate/textbook_evaluate_detail/textbook_evaluate_detail.dart';
import 'package:guethub/ui/route.dart';
import 'package:guethub/ui/util/toast.dart';
import 'textbook_evaluate_controller.dart';

class TextbookEvaluatePage extends StatefulWidget {
  const TextbookEvaluatePage({super.key});

  @override
  State<TextbookEvaluatePage> createState() => _TextbookEvaluatePageState();
}

class _TextbookEvaluatePageState extends State<TextbookEvaluatePage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(TextbookEvaluateController());

    return Scaffold(
      appBar: AppBar(
        title: Text("教材评价"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return Center(child: CircularProgressIndicator()); // 显示加载指示器
        } else if (c.hasError.value) {
          return Center(
            child: TextButton(
              onPressed: () {
                c.refreshData();
              },
              child: Text(
                "加载失败，点击重试",
                style: GoogleFonts.longCang(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await c.refreshData();
            },
            child: Column(
              children: [
                // 学期选择下拉菜单
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("选择学期: "),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(8),
                            value: c.currentSemester.value,
                            items: c.semester.map((semester) {
                              return DropdownMenuItem(
                                value: semester,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(semester.name),
                                ), // Assuming semester has a `name` field
                              );
                            }).toList(),
                            onChanged: (selectedSemester) {
                              if (selectedSemester != null) {
                                c.changeCurrentSemester(
                                    selectedSemester); // Update the current semester
                              }
                            },
                            hint: Text("请选择学期"),
                          ),
                        ],
                      ),
                      if (c.textbookEvaluateInfo.value != null && c.textbookEvaluateInfo.value!.evaluateBatch.startTime.isNotBlank)
                        Text(
                            "开始时间：${c.textbookEvaluateInfo.value!.evaluateBatch.startTime}\n结束时间：${c.textbookEvaluateInfo.value!.evaluateBatch.endTime}"),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Text("Tip: 点击即可进行评价哦",
                //       style: TextStyle(color: Colors.grey)),
                // ),
                Expanded(
                  child: c.textbookEvaluateItems.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "当前学期暂时没有教材评价信息，您可以尝试切换学期",
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 8);
                          },
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
                          itemCount: c.textbookEvaluateItems.length,
                          itemBuilder: (context, index) {
                            final item = c.textbookEvaluateItems[index];
                            return Card(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                onTap: () {
                                  if (item.isEvaluated) {
                                    toast("您已经评价过这本书");
                                  } else {
                                    Get.toNamed(
                                        AppRoute.textbookEvaluateDetailPage,
                                        arguments:
                                            TextbookEvaluateDetailPageArgs(
                                                semesterId:
                                                    c.currentSemester.value!.id,
                                                batchId: c.textbookEvaluateInfo
                                                    .value!.evaluateBatch.id,
                                                courseId: item.course.id!,
                                                textbookId: item.textbook.id!));
                                  }
                                },
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: Builder(builder: (context) {
                                          return SelectableText(
                                              "《${item.textbook.nameZh}》");
                                        }),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text("作者：${item.textbook.author}\n出版社：${item.textbook.press.nameZh}\nISBN: ${item.textbook.isbn}\n课程：${item.course.nameZh}-${item.course.credits}学分-课号${item.course.code}"),
                                  trailing: Text(
                                    item.isEvaluated ? "已评价" : "去评价",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: item.isEvaluated
                                            ? Colors.grey
                                            : Colors.red),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
