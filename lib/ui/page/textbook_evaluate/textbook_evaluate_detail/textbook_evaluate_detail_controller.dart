import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_detail/textbook_evaluate_detail.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_save/textbook_evaluate_save.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_save_subjective_question/textbook_evaluate_save_subjective_question.dart';
import 'package:guethub/data/repository/textbook_evaluate.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:kt_dart/collection.dart';

import 'textbook_evaluate_detail.dart';
class TextbookEvaluateDetailController extends GetxController {
  final TextbookEvaluateDetailPageArgs args;
  final textbookEvaluateDetail = <TextbookEvaluateDetail>[].obs;

  var selectedOptions = <String, int?>{}.obs;
  var textControllers = <String, TextEditingController>{}.obs;

  var isLoading = false.obs; // 初始化为 true，表示正在加载
  var hasError = false.obs; // 初始化为 false，表示没有错误

  void updateSelectedOption(String questionId, int? value) {
    selectedOptions[questionId] = value;
  }

  GlobalKey formKey = GlobalKey<FormState>();

  TextbookEvaluateDetailController(this.args);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading(true);
      hasError(false);

      textbookEvaluateDetail.clear();
      selectedOptions.clear();
      textControllers.clear();
      final resp = await TextbookEvaluateRepository.get()
          .getTextbookEvaluateDetail(
          semesterId: args.semesterId,
          batchId: args.batchId,
          courseId: args.courseId,
          textbookId: args.textbookId);

      if (resp != null) {
        textbookEvaluateDetail(resp);

        for (final item in resp) {
          if (item.questionType.$name == "SINGLE_CHOICE") {
            updateSelectedOption(item.nameZh, item.score);
          } else if (item.questionType.$name == "SUBJECTIVE_QUESTION") {
            textControllers[item.nameZh] = TextEditingController();
          }
        }
      }
    } catch (e) {
      hasError(true);
      toastFailure0("加载失败: $e");
    } finally {
      isLoading(false);
    }
  }

  submit() async {
    if (!(formKey.currentState as FormState).validate()) {
      toastFailure0("请检查输入");
      return;
    }
    final studentId =
    await TextbookEvaluateRepository.get().getNewSystemStudentId();

    final singleChoice = textbookEvaluateDetail
        .where((question) => question.questionType.$name == "SINGLE_CHOICE")
        .map((question) => EvaluateDetail(
        questionType: question.questionType.$name,
        type: question.type,
        nameZh: question.nameZh,
        nameEn: question.nameEn ?? "null",
        score: question.score!,
        options: question.options!
            .map((option) => TextbookEvaluateSaveOptions(
            contentZh: option.contentZh,
            contentEn: option.contentEn,
            score: option.score,
            checked: selectedOptions[question.nameZh] == option.score
                ? 1
                : 0))
            .toList(),
        finalScore: selectedOptions[question.nameZh]!))
        .toList();

    final finalScore =
    singleChoice.kt.averageBy((question) => question.finalScore);

    final subjectiveQuestion = textbookEvaluateDetail
        .where(
            (question) => question.questionType.$name == "SUBJECTIVE_QUESTION")
        .map((question) => TextbookEvaluateSaveSubjectiveQuestion(
      questionType: question.questionType.$name,
      type: question.type,
      nameZh: question.nameZh,
      nameEn: question.nameEn ?? "null",
      required: question.required ?? false,
      maxSize: question.maxSize?.toString() ?? "",
      answer: textControllers[question.nameZh]!.text,
    ))
        .toList();

    final evaluateDetail = singleChoice.map((e) => e.toJson()).toList() +
        subjectiveQuestion.map((e) => e.toJson()).toList();

    final data = TextbookEvaluateSave(
        semesterAssoc: args.semesterId,
        courseAssoc: args.courseId,
        textbookEvaluateBatchAssoc: args.batchId,
        textbookAssoc: args.textbookId,
        studentAssoc: studentId,
        evaluateDetail: evaluateDetail,
        finalScore: finalScore);
    final resp =
    await TextbookEvaluateRepository.get().saveTextbookEvaluate(data: data);
    if (resp.success) {
      toastSuccess0("成功");
    } else {
      toastFailure0("失败", error: resp.content);
    }
  }
}