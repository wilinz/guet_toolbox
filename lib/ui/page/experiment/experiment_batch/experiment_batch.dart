import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'experiment_batch_controller.dart';

class ExperimentBatchPageArgs {
  final String taskId;
  final String subjectId;
  final String stuId;
  final String? selectItems;

  ExperimentBatchPageArgs(
      {required this.taskId,
      required this.subjectId,
      required this.stuId,
      required this.selectItems});
}

class ExperimentBatchPage extends StatelessWidget {
  const ExperimentBatchPage({super.key, required this.args});

  final ExperimentBatchPageArgs args;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExperimentBatchController(args: args));

    return Scaffold(
      appBar: AppBar(
        title: Text("实验课选课系统"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return Center(child: CircularProgressIndicator());
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
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
              itemCount: c.experimentBatch.length,
              itemBuilder: (context, index) {
                final batch = c.experimentBatch[index];
                return ExpansionTile(
                  title: Text("第${index + 1}批 ${batch.notBegin ? "未开始" : ""}"),
                  initiallyExpanded: true,
                  enabled: false,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          c.select(batch.list.map((e) => e.id).toList());
                        },
                        child: Text("选课"),
                      ),
                    ],
                  ),
                  children: List.generate(batch.list.length, (i) {
                    final item = batch.list[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("${item.subjectName}"),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                  "第 ${item.weekNum} 周 ${item.weekAndDate} 第${item.sectionString}节 已选人数：${item.selectCount}/${item.maxCount}，教师: ${item.tecName}"),
                            ),
                            Builder(builder: (context) {
                              final itemIsSelected = args.selectItems != null &&
                                  args.selectItems!.contains(item.id);
                              return Flexible(
                                child: Text(
                                  itemIsSelected ? "已选中" : "未选中",
                                  style: TextStyle(
                                      color: itemIsSelected
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              );
                            }),
                          ],
                        ),

                      ),
                    );
                  }),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
