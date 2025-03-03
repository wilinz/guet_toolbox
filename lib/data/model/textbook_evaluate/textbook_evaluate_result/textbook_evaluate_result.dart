import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_result.g.dart';

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateResult {

  TextbookEvaluateResult(
      {required this.data});

  @JsonKey(name: "data", defaultValue: [])
  List<TextbookEvaluateResultData> data;


  factory TextbookEvaluateResult.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateResultToJson(this);
  
  factory TextbookEvaluateResult.emptyInstance() => TextbookEvaluateResult(data: []);
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
      {required this.nameZh,
      this.nameEn,
      required this.author,
      required this.isbn,
      required this.press});

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
  
  factory Textbook.emptyInstance() => Textbook(nameZh: "", author: "", isbn: "", press: Press.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Course {

  Course(
      {required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.credits});

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
  
  factory Course.emptyInstance() => Course(nameZh: "", nameEn: "", code: "", credits: 0);
}

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateIndex {

  TextbookEvaluateIndex(
      {required this.nameZh,
      this.nameEn});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;


  factory TextbookEvaluateIndex.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateIndexFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateIndexToJson(this);
  
  factory TextbookEvaluateIndex.emptyInstance() => TextbookEvaluateIndex(nameZh: "");
}

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateResultData {

  TextbookEvaluateResultData(
      {required this.id,
      required this.evaluateDateTime,
      required this.textbook,
      required this.course,
      required this.textbookEvaluateIndex});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "evaluateDateTime", defaultValue: "")
  String evaluateDateTime;

  @JsonKey(name: "textbook", defaultValue: Textbook.emptyInstance)
  Textbook textbook;

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "textbookEvaluateIndex", defaultValue: TextbookEvaluateIndex.emptyInstance)
  TextbookEvaluateIndex textbookEvaluateIndex;


  factory TextbookEvaluateResultData.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateResultDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateResultDataToJson(this);
  
  factory TextbookEvaluateResultData.emptyInstance() => TextbookEvaluateResultData(id: 0, evaluateDateTime: "", textbook: Textbook.emptyInstance(), course: Course.emptyInstance(), textbookEvaluateIndex: TextbookEvaluateIndex.emptyInstance());
}


