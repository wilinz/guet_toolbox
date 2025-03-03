import 'dart:convert';

import 'package:guethub/data/model/teaching_evaluation_questions/teaching_evaluation_questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teaching_evaluation_content.g.dart';

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationContentResponse {
  TeachingEvaluationContentResponse(
      {required this.code,
      required this.msg,
      required this.data,
      required this.ok});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: TeachingEvaluationContent.emptyInstance)
  TeachingEvaluationContent data;

  @JsonKey(name: "ok", defaultValue: false)
  bool ok;

  factory TeachingEvaluationContentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TeachingEvaluationContentResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TeachingEvaluationContentResponseToJson(this);

  factory TeachingEvaluationContentResponse.emptyInstance() =>
      TeachingEvaluationContentResponse(
          code: 0,
          msg: "",
          data: TeachingEvaluationContent.emptyInstance(),
          ok: false);
}

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationContent {
  TeachingEvaluationContent(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      this.introduction,
      this.remark,
      required this.status,
      required this.questions,
      required this.enable,
      required this.needScoring,
      required this.totalScore,
      required this.questionNum,
      required this.evaluateTypeId,
      required this.evaluateTypeNameZh,
      required this.evaluateTypeNameEn,
      required this.departmentId,
      required this.departmentNameZh,
      this.departmentNameEn,
      this.copyFrom,
      required this.gmtCreate,
      required this.gmtModify,
      required this.createdByLoginname,
      required this.createdByPersonid,
      required this.identityStr,
      required this.quote,
      this.teacherId,
      required this.name});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "introduction")
  dynamic introduction;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "status", defaultValue: false)
  bool status;

  @JsonKey(name: "questions", defaultValue: [], fromJson: _parseQuestions)
  List<TeachingEvaluationQuestionChapter> questions;

  @JsonKey(name: "enable", defaultValue: false)
  bool enable;

  @JsonKey(name: "needScoring", defaultValue: false)
  bool needScoring;

  @JsonKey(name: "totalScore", defaultValue: 0.0)
  double totalScore;

  @JsonKey(name: "questionNum", defaultValue: "")
  String questionNum;

  @JsonKey(name: "evaluateTypeId", defaultValue: "")
  String evaluateTypeId;

  @JsonKey(name: "evaluateTypeNameZh", defaultValue: "")
  String evaluateTypeNameZh;

  @JsonKey(name: "evaluateTypeNameEn", defaultValue: "")
  String evaluateTypeNameEn;

  @JsonKey(name: "departmentId", defaultValue: "")
  String departmentId;

  @JsonKey(name: "departmentNameZh", defaultValue: "")
  String departmentNameZh;

  @JsonKey(name: "departmentNameEn")
  dynamic departmentNameEn;

  @JsonKey(name: "copyFrom")
  dynamic copyFrom;

  @JsonKey(name: "gmtCreate", defaultValue: "")
  String gmtCreate;

  @JsonKey(name: "gmtModify", defaultValue: "")
  String gmtModify;

  @JsonKey(name: "createdByLoginname", defaultValue: "")
  String createdByLoginname;

  @JsonKey(name: "createdByPersonid", defaultValue: "")
  String createdByPersonid;

  @JsonKey(name: "identityStr", defaultValue: "")
  String identityStr;

  @JsonKey(name: "quote", defaultValue: "")
  String quote;

  @JsonKey(name: "teacherId")
  dynamic teacherId;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory TeachingEvaluationContent.fromJson(Map<String, dynamic> json) =>
      _$TeachingEvaluationContentFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingEvaluationContentToJson(this);

  factory TeachingEvaluationContent.emptyInstance() =>
      TeachingEvaluationContent(
          id: "",
          nameZh: "",
          status: false,
          questions: [],
          enable: false,
          needScoring: false,
          totalScore: 0,
          questionNum: "",
          evaluateTypeId: "",
          evaluateTypeNameZh: "",
          evaluateTypeNameEn: "",
          departmentId: "",
          departmentNameZh: "",
          gmtCreate: "",
          gmtModify: "",
          createdByLoginname: "",
          createdByPersonid: "",
          identityStr: "",
          quote: "",
          name: "");
}

_parseQuestions(String questions) => teachingEvaluationQuestionsListFormJsonWithHandle(jsonDecode(questions));
