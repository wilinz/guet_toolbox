import 'dart:io';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/credits_course_info/credits_course_info.dart';
import 'package:guethub/data/model/exam_scores/exam_scores.dart';
import 'package:guethub/data/model/exam_scores_new/exam_scores_new.dart';
import 'package:guethub/data/model/graduate_info/graduate_info.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/exam_scores.dart';
import 'package:guethub/data/repository/program_completion_info.dart';
import 'package:guethub/data/repository/user.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:kt_dart/kt.dart';

class ExamScoresController extends GetxController {
  final terms = <Term>[].obs;
  final term2TermNameMap = <String, String>{}.obs;
  final termName2TermMap = <String, String>{}.obs;
  final currentTerm = Rx<Term?>(null);
  final examScores = <ExamScore>[].obs;
  final examScoresNew = <ExamScoresNew>[].obs;
  final graduateInfo = Rxn<GraduateInfo>();
  final creditsCourseInfo = Rxn<CreditsCourseInfo>();
  final isShowGraduateInfo = false.obs;
  final isLoading = false.obs;
  final isLoadFailed = false.obs;
  final isLoadingOldScores = false.obs;
  final isLoadOldScoresFailed = false.obs;
  final isLoadingNewScores = false.obs;
  final isLoadNewScoresFailed = false.obs;

  Future<void> getGraduateInfo() async {
    final graduateInfoData =
        await ProgramCompletionInfoRepository.get().getGraduateInfo();
    // if(graduateInfoData!=null) {
    //   final creditsCourseInfo = await ProgramCompletionInfoRepository.get()
    //       .getCreditsCourseInfo1(programId: graduateInfoData.programId);
    // }
    graduateInfo(graduateInfoData);
  }

  getTermList() async {
    terms.value = (await CourseRepository.get().getTermList(isFlush: true))
        // .reversed
        .toList();
    term2TermNameMap.value = Map.fromEntries(
        terms.map((term) => MapEntry(term.term, term.termName)));
    termName2TermMap.value = Map.fromEntries(
        terms.map((term) => MapEntry(term.termName, term.term)));
    currentTerm.value = CourseRepository.get().getCurrentTerm(terms, false);
  }

  String convertSemester(String term) {
    return term2TermNameMap[term] ?? term;
  }

  String convertSemesterReverse(String termName) {
    return termName2TermMap[termName] ?? termName;
  }

  Future<void> getExamScores() async {
    final resp = await ExamScoresRepository.get().getExamScores();
    examScores.value = resp.data;
  }

  Future<void> getExamScoresNew() async {
    final resp = await ExamScoresRepository.get().getExamScoresNew();
    examScoresNew.value = await ExamScoresRepository.get()
        .mergeRemoteAndLocalData(resp, examScoresNew);
  }

  Future<void> getExamScoresCache() async {
    final cache = await ExamScoresRepository.get().getExamScoresCache();
    cache?.data.let((e) {
      examScores.value = e;
    });
  }

  Future<void> getExamScoresNewCache() async {
    final cache = await ExamScoresRepository.get().getExamScoresNewFormDB();
    cache.let((e) {
      examScoresNew.value = e;
    });
  }

  Future<void> updateUnread(List<ExamScoresNew> unreadScores) async {
    await Future.delayed(Duration(seconds: 5));
    for (final item in unreadScores) {
      item.unread = false;
      final i = examScoresNew.indexOf(item);
      examScoresNew[i] = item;
    }
    await ExamScoresRepository.get().updateExamScoresNewList(unreadScores);
  }

  String removeHtmlTags(String htmlString) {
    // 使用正则表达式去除HTML标签
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  Future<void> fetchData({bool isShowToast = false}) async {
    final user = await UserRepository.get().getActiveUser();
    if (user == null) {
      return;
    }

    // Initialize states
    isLoadingOldScores.value = true;
    isLoadingNewScores.value = true;
    isLoadOldScoresFailed.value = false;
    isLoadNewScoresFailed.value = false;

    logger.d("获取数据");
    await getTermList();
    await Future.wait([getExamScoresCache(), getExamScoresNewCache()]);

    try {
      if (user.isOnlyUseOldSystem) {
        // Load only old system scores
        isShowGraduateInfo.value = false;
        await getExamScores();
        isLoadingOldScores.value = false;
      } else if (user.isOnlyUseNewSystem()) {
        isShowGraduateInfo.value = true;
        // Load only new system scores
        await Future.wait([getExamScoresNew(), getGraduateInfo()]);
        isLoadingNewScores.value = false;
      } else {
        isShowGraduateInfo.value = true;
        // Load both old and new system scores
        await Future.wait([
          getExamScores().then((_) {
            isLoadingOldScores.value = false;
          }).catchError((error) {
            isLoadOldScoresFailed.value = true;
          }),
          getExamScoresNew().then((_) {
            isLoadingNewScores.value = false;
          }).catchError((error) {
            isLoadNewScoresFailed.value = true;
          }),
          getGraduateInfo().catchError((error) {
            isLoadNewScoresFailed.value = true;
          })
        ]);
      }
      isLoadFailed.value = false; // Reset general load failed state
    } catch (e) {
      isLoadFailed.value = true;
      if (isShowToast) toastFailure(message: "加载数据失败", error: e);
      rethrow;
    } finally {
      isLoadingOldScores.value = false;
      isLoadingNewScores.value = false;
    }
  }

  Rx<DateTime?> updateTime = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    examScoresNew.listen((e) {
      updateTime.value = e.firstOrNull?.updateTime;
    });
    final user = await UserRepository.get().getActiveUser();
    if (user != null) {
      fetchData(isShowToast: true);
    }
  }

  Map<String, List<ExamScore>> groupScoresByTerm(List<ExamScore> scores) {
    final groupedOldScores = <String, List<ExamScore>>{};
    for (var score in scores) {
      if (!groupedOldScores.containsKey(score.term)) {
        groupedOldScores[score.term] = [];
      }
      groupedOldScores[score.term]?.add(score);
    }
    return groupedOldScores;
  }

  Map<String, List<ExamScoresNew>> groupNewScoresBySemester(
      List<ExamScoresNew> scores) {
    final groupedNewScores = <String, List<ExamScoresNew>>{};
    for (var score in scores) {
      if (!groupedNewScores.containsKey(score.semesterName)) {
        groupedNewScores[score.semesterName] = [];
      }
      groupedNewScores[score.semesterName]?.add(score);
    }
    return groupedNewScores;
  }

  List<String> sortTerms(List<String> terms) {
    terms.sort((a, b) => b.compareTo(a));
    return terms;
  }

  List<String> sortTermsNew(List<String> terms) {
    terms.sort((a, b) =>
        convertSemesterReverse(b).compareTo(convertSemesterReverse(a)));
    return terms;
  }

  List<ExamScore> getMaxScores(List<ExamScore> scores) {
    final Map<String, ExamScore> maxScores = {};
    for (var score in scores) {
      if (!maxScores.containsKey(score.courseNumber) ||
          maxScores[score.courseNumber]!.overallScore < score.overallScore) {
        maxScores[score.courseNumber] = score;
      }
    }
    return maxScores.values.toList();
  }

  List<ExamScoresNew> getMaxScoresNew(List<ExamScoresNew> scores) {
    final Map<String, ExamScoresNew> maxScores = {};
    for (var score in scores) {
      if (!maxScores.containsKey(score.courseCode) ||
          (maxScores[score.courseCode]!.gaGrade.toDoubleOrNull() ?? 0) <
              (score.gaGrade.toDoubleOrNull() ?? -1)) {
        maxScores[score.courseCode] = score;
      }
    }
    return maxScores.values.toList();
  }

  double getCorrectOverallScore(ExamScore scores) {
    if (scores.typeNo == "BS") {
      switch (scores.overallScoreAlias) {
        case "优":
          return 95;
        case "良":
          return 85;
        case "中":
          return 75;
        case "及格":
          return 65;
        case "不及格":
          return 40;
        default:
      }
    } else if (!scores.typeNo.startsWith("B") || scores.credit <= 0) {
      return 0;
    }
    return scores.overallScore;
  }

  double calculateGPA(List<ExamScore> scores) {
    final maxScores = getMaxScores(scores);
    double totalPoints = 0;
    double totalCredits = 0;
    for (var score in maxScores) {
      // if (!examScoreBean2.getScore().equals("旷考") && !examScoreBean2.getScore().equals("取消") && (cnos1.contains(examScoreBean2.getCno()) || examScoreBean2.getType().equals("XZ"))) {
      if (determineIncludeInGPA(score)) {
        totalPoints += getCorrectOverallScore(score) * score.credit;
        totalCredits += score.credit;
      }
    }
    return totalCredits == 0 ? 0 : totalPoints / totalCredits;
  }

  bool determineIncludeInGPA(ExamScore score) {
    return score.credit > 0 &&
        !["旷考", "取消"].contains(score.overallScoreAlias) &&
        score.typeNo.startsWith('B');
  }

  double calculateGPA5Scale(List<ExamScore> scores) {
    final maxScores = getMaxScores(scores);
    double totalPoints = 0;
    double totalCredits = 0;
    for (var score in maxScores) {
      if (determineIncludeInGPA(score)) {
        double gpa5 = 0;
        if (getCorrectOverallScore(score) >= 80) {
          gpa5 = 4;
        } else if (getCorrectOverallScore(score) >= 70) {
          gpa5 = 3;
        } else if (getCorrectOverallScore(score) >= 60) {
          gpa5 = 2;
        } else if (getCorrectOverallScore(score) >= 50) {
          gpa5 = 1;
        } else {
          gpa5 = 0;
        }
        totalPoints += gpa5 * score.credit;
        totalCredits += score.credit;
      }
    }
    return totalCredits == 0 ? 0 : totalPoints / totalCredits;
  }

  double calculateCredits(List<ExamScore> scores) {
    final maxScores = getMaxScores(scores);
    return maxScores.fold(0, (sum, score) => sum + score.credit);
  }

  bool determineIncludeInNewGPA(ExamScoresNew score) {
    return (score.credits > 0 &&
        (score.gaGrade.toDoubleOrNull() ?? -1) > 0 &&
        !["旷考", "取消"].contains(score.gaGrade) &&
        !["通识教育", "专业任选"].contains(score.courseProperty));
  }

  double calculateNewGPA(List<ExamScoresNew> scores) {
    final maxScores = getMaxScoresNew(scores);
    double totalPoints = 0;
    double totalCredits = 0;
    for (var score in maxScores) {
      if (determineIncludeInNewGPA(score)) {
        totalPoints += (double.tryParse(score.gaGrade) ?? 0) * score.credits;
        totalCredits += score.credits;
      }
    }
    return totalCredits == 0 ? 0 : totalPoints / totalCredits;
  }

  double calculateNewGPA5Scale(List<ExamScoresNew> scores) {
    final maxScores = getMaxScoresNew(scores);
    double totalPoints = 0;
    double totalCredits = 0;
    for (var score in maxScores) {
      if (determineIncludeInNewGPA(score)) {
        double gpa5 = 0;
        final grade = double.tryParse(score.gaGrade) ?? 0;
        if (grade >= 80) {
          gpa5 = 4;
        } else if (grade >= 70) {
          gpa5 = 3;
        } else if (grade >= 60) {
          gpa5 = 2;
        } else if (grade >= 50) {
          gpa5 = 1;
        } else {
          gpa5 = 0;
        }
        totalPoints += gpa5 * score.credits;
        totalCredits += score.credits;
      }
    }
    return totalCredits == 0 ? 0 : totalPoints / totalCredits;
  }

  double calculateNewCredits(List<ExamScoresNew> scores) {
    final maxScores = getMaxScoresNew(scores);
    return maxScores.fold(0, (sum, score) => sum + score.credits);
  }
}
