import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/ui/page/exam_scores/exam_scores_controller.dart';
import 'package:guethub/util/ext.dart';

class ExamScoresPage extends StatelessWidget {
  const ExamScoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExamScoresController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text("成绩单"),
                ),
                if (c.updateTime.value != null)
                  InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      c.fetchData(isShowToast: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2),
                      child: Obx(() =>
                          Text(
                            "同步于" +
                                (c.updateTime.value?.timeAgoString(
                                    suffix: "前") ??
                                    "") + ", 点击同步",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall,
                          )),
                    ),
                  )
              ],
            )),
        actions: [],
      ),
      body: Body(c: c),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.c,
  });

  final ExamScoresController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        if (c.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // 分组数据
        final groupedOldScores = c.groupScoresByTerm(c.examScores);
        final groupedNewScores = c.groupNewScoresBySemester(c.examScoresNew);

        // 按学期排序
        final sortedOldTerms = c.sortTerms(groupedOldScores.keys.toList());
        final sortedNewTerms = c.sortTermsNew(groupedNewScores.keys.toList());

        final overallNewGPA = c.calculateNewGPA(c.examScoresNew);
        final overallNewGPA5Scale = c.calculateNewGPA5Scale(c.examScoresNew);
        final totalNewCredits = c.calculateNewCredits(c.examScoresNew);

        final overallGPA = (totalNewCredits) == 0
            ? 0
            : (overallNewGPA * totalNewCredits) / totalNewCredits;

        final overallGPA5Scale = (totalNewCredits) == 0
            ? 0
            : (overallNewGPA5Scale * totalNewCredits) / totalNewCredits;

        final totalCredits = totalNewCredits;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(c.isShowGraduateInfo.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "教务系统学分绩（总）：${c.graduateInfo.value?.gpa ??  "正在查询..."}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 12,),
                    Text(
                      "注意：下面绩点由本地自行计算，仅供参考，请谨慎用于综测等用途",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "总学分：${totalCredits.toStringAsFixed(
                          2)} | 总绩点（100分制）：${overallGPA.toStringAsFixed(
                          2)} | 总绩点（5分制）：${overallGPA5Scale
                          .toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
            ),
            Expanded(
              child: ListView(
                children: [
                  // New system header with loading/retry indicator
                  SizedBox(
                    height: 48,
                    child: Obx(() =>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "新系统成绩",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            if (c.isLoadingNewScores.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    )),
                              ),
                            if (c.isLoadNewScoresFailed.value)
                              TextButton(
                                onPressed: () {
                                  c.fetchData(isShowToast: true);
                                },
                                child: Text("点击重试"),
                              ),
                          ],
                        )),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sortedNewTerms.length,
                    itemBuilder: (context, index) {
                      final term = sortedNewTerms[index];
                      final allScores = groupedNewScores[term]!;
                      final gpa = c.calculateNewGPA(allScores);
                      final gpa5Scale = c.calculateNewGPA5Scale(allScores);
                      final termCredits = c.calculateNewCredits(allScores);
                      final unreadScores =
                      allScores.where((item) => item.unread).toList();

                      return ExpansionTile(
                        title: Row(
                          children: [
                            Text(term),
                            if (unreadScores.isNotEmpty)
                              Container(
                                margin: EdgeInsets.only(left: 8.0),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        onExpansionChanged: (bool) {
                          if (unreadScores.isNotEmpty) {
                            c.updateUnread(unreadScores);
                          }
                        },
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "总学分：${termCredits.toStringAsFixed(
                                  2)} | GPA（100分制）：${gpa.toStringAsFixed(
                                  2)} | GPA（5分制）：${gpa5Scale.toStringAsFixed(
                                  2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ...allScores.map((item) {
                            return Card(
                              child: ListTile(
                                title: Text(item.courseName),
                                subtitle: Text(
                                    "成绩：${item.gaGrade} | 学分：${item
                                        .credits} | 详细：${item
                                        .gradeDetail} | 课程类型：${item
                                        .courseType} | 课程属性：${item
                                        .courseProperty} | 是否算绩点：${c
                                        .determineIncludeInNewGPA(item)
                                        ? "是"
                                        : "否"} "),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: 80),
                                      child: Text(
                                        "成绩：${item.gaGrade}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: (double.tryParse(
                                                item.gaGrade) ??
                                                0) >=
                                                60
                                                ? Colors.green
                                                : Colors.red),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    if (item.unread)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    },
                  ),

                  // Old system header with loading/retry indicator
                  Obx(() =>
                      SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "旧系统成绩",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            if (c.isLoadingOldScores.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    )),
                              ),
                            if (c.isLoadOldScoresFailed.value)
                              TextButton(
                                onPressed: () {
                                  c.fetchData(isShowToast: true);
                                },
                                child: Text("点击重试"),
                              ),
                          ],
                        ),
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sortedOldTerms.length,
                    itemBuilder: (context, index) {
                      final term = sortedOldTerms[index];
                      final allScores = groupedOldScores[term]!;
                      final gpa = c.calculateGPA(allScores);
                      final gpa5Scale = c.calculateGPA5Scale(allScores);
                      final termCredits = c.calculateCredits(allScores);

                      return ExpansionTile(
                        title: Text(c.convertSemester(term)),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "总学分：${termCredits.toStringAsFixed(
                                  2)} | GPA（100分制）：${gpa.toStringAsFixed(
                                  2)} | GPA（5分制）：${gpa5Scale.toStringAsFixed(
                                  2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ...allScores.map((item) {
                            return Card(
                              child: ListTile(
                                title: Text(item.courseName),
                                subtitle: Text(
                                    "考核：${item.examScore} | 平时：${item
                                        .regularScore} | 期中：${item
                                        .midtermScore} | 实验：${item
                                        .labScore} | 学分：${item
                                        .credit} | 类别：${item
                                        .typeNo} | 是否算绩点：${c
                                        .determineIncludeInGPA(item)
                                        ? "是"
                                        : "否"} | 算入绩点成绩：${c
                                        .getCorrectOverallScore(item)}"),
                                trailing: Text(
                                  "成绩：${item.overallScore}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: item.overallScore >= 60
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
