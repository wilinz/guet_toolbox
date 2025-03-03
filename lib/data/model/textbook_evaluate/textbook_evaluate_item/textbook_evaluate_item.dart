import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_info/textbook_evaluate_info.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_result/textbook_evaluate_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_item.g.dart';

List<TextbookEvaluateItem> textbookEvaluateItemListFormJson(List json) =>
    json.map((e) => TextbookEvaluateItem.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> textbookEvaluateItemListToJson(List<TextbookEvaluateItem> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateItem {

  TextbookEvaluateItem(
      {this.id,
      this.evaluateDateTime,
      required this.textbook,
      required this.course,
      required this.textbookEvaluateIndex});

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "evaluateDateTime")
  String? evaluateDateTime;

  @JsonKey(name: "textbook", defaultValue: Textbook.emptyInstance)
  Textbook textbook;

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "textbookEvaluateIndex", defaultValue: TextbookEvaluateIndex.emptyInstance)
  TextbookEvaluateIndex textbookEvaluateIndex;


  factory TextbookEvaluateItem.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateItemToJson(this);
  
  factory TextbookEvaluateItem.emptyInstance() => TextbookEvaluateItem(textbook: Textbook.emptyInstance(), course: Course.emptyInstance(), textbookEvaluateIndex: TextbookEvaluateIndex.emptyInstance());

  factory TextbookEvaluateItem.formTextbookEvaluateInfoData(TextbookEvaluateInfoData data){
    return TextbookEvaluateItem.fromJson(data.toJson());
  }

  factory TextbookEvaluateItem.formTextbookEvaluateResultData(TextbookEvaluateResultData data){
    return TextbookEvaluateItem.fromJson(data.toJson());
  }

  bool get isEvaluated => id != null;
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
  int? id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  String? nameEn;

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
class Course {

  Course(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.credits});

  @JsonKey(name: "id", defaultValue: 0)
  int? id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String? nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "credits", defaultValue: 0)
  int credits;


  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseToJson(this);
  
  factory Course.emptyInstance() => Course(id: 0, nameZh: "", nameEn: "", code: "", credits: 0);
}

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateIndex {

  TextbookEvaluateIndex(
      {required this.nameZh,
      this.nameEn});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  String? nameEn;


  factory TextbookEvaluateIndex.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateIndexFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateIndexToJson(this);
  
  factory TextbookEvaluateIndex.emptyInstance() => TextbookEvaluateIndex(nameZh: "");
}


