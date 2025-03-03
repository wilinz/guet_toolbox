import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_info.g.dart';

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateInfo {

  TextbookEvaluateInfo(
      {required this.batchOpen,
      required this.data,
      required this.evaluateBatch});

  @JsonKey(name: "batchOpen", defaultValue: false)
  bool batchOpen;

  @JsonKey(name: "data", defaultValue: [])
  List<TextbookEvaluateInfoData> data;

  @JsonKey(name: "evaluateBatch", defaultValue: EvaluateBatch.emptyInstance)
  EvaluateBatch evaluateBatch;


  factory TextbookEvaluateInfo.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateInfoToJson(this);
  
  factory TextbookEvaluateInfo.emptyInstance() => TextbookEvaluateInfo(batchOpen: false, data: [], evaluateBatch: EvaluateBatch.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Course {

  Course(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.credits});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "credits", defaultValue: 0)
  int credits;


  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseToJson(this);
  
  factory Course.emptyInstance() => Course(id: 0, nameZh: "", nameEn: "", code: "", credits: 0);
}

@JsonSerializable(explicitToJson: true)
class Press {

  Press(
      {required this.nameZh,
      this.nameEn});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;


  factory Press.fromJson(Map<String, dynamic> json) => _$PressFromJson(json);
  
  Map<String, dynamic> toJson() => _$PressToJson(this);
  
  factory Press.emptyInstance() => Press(nameZh: "");
}

@JsonSerializable(explicitToJson: true)
class Textbook {

  Textbook(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.author,
      required this.isbn,
      required this.press});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "author", defaultValue: "")
  String author;

  @JsonKey(name: "isbn", defaultValue: "")
  String isbn;

  @JsonKey(name: "press", defaultValue: Press.emptyInstance)
  Press press;


  factory Textbook.fromJson(Map<String, dynamic> json) => _$TextbookFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookToJson(this);
  
  factory Textbook.emptyInstance() => Textbook(id: 0, nameZh: "", author: "", isbn: "", press: Press.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class EvaluateIndex {

  EvaluateIndex(
      {required this.nameZh,
      this.nameEn});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;


  factory EvaluateIndex.fromJson(Map<String, dynamic> json) => _$EvaluateIndexFromJson(json);
  
  Map<String, dynamic> toJson() => _$EvaluateIndexToJson(this);
  
  factory EvaluateIndex.emptyInstance() => EvaluateIndex(nameZh: "");
}

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateInfoData {

  TextbookEvaluateInfoData(
      {required this.course,
      required this.textbook,
      required this.evaluateIndex});

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "textbook", defaultValue: Textbook.emptyInstance)
  Textbook textbook;

  @JsonKey(name: "evaluateIndex", defaultValue: EvaluateIndex.emptyInstance)
  EvaluateIndex evaluateIndex;


  factory TextbookEvaluateInfoData.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateInfoDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateInfoDataToJson(this);
  
  factory TextbookEvaluateInfoData.emptyInstance() => TextbookEvaluateInfoData(course: Course.emptyInstance(), textbook: Textbook.emptyInstance(), evaluateIndex: EvaluateIndex.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class EvaluateBatch {

  EvaluateBatch(
      {required this.id,
      required this.startTime,
      required this.endTime,
      this.bulletin});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "startTime", defaultValue: "")
  String startTime;

  @JsonKey(name: "endTime", defaultValue: "")
  String endTime;

  @JsonKey(name: "bulletin")
  dynamic bulletin;


  factory EvaluateBatch.fromJson(Map<String, dynamic> json) => _$EvaluateBatchFromJson(json);
  
  Map<String, dynamic> toJson() => _$EvaluateBatchToJson(this);
  
  factory EvaluateBatch.emptyInstance() => EvaluateBatch(id: 0, startTime: "", endTime: "");
}


