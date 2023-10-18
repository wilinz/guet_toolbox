import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/ui/page/exam_scores/exam_scores_controller.dart';

class ExamScoresPage extends StatelessWidget {
  const ExamScoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ExamScoresController());
    return Scaffold(
      appBar: AppBar(
        title: Text("成绩单"),
       /* actions: [
          IconButton(
              onPressed: () {
                c.toPrevious();
              },
              icon: Icon(Icons.navigate_before)),
          IconButton(
              onPressed: () {
                c.toNext();
              },
              icon: Icon(Icons.navigate_next)),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 8);
                  },
                  itemCount: c.examScores.length,
                  itemBuilder: (context, index) {
                    final item = c.examScores[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.courseName),
                        subtitle: Text(
                            "${item.term} | 考核：${item.examScore} | 平时：${item.regularScore} | 期中：${item.midtermScore} | 实验：${item.labScore}"),
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
                  }),
            ))
          ],
        ),
      ),
    );
  }
}



