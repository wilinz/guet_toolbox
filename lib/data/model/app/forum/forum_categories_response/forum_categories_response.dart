import 'package:json_annotation/json_annotation.dart';

part 'forum_categories_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ForumCategoriesResponse {

  ForumCategoriesResponse(
      {required this.code,
      required this.success,
      required this.msg,
      required this.data});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<ForumCategory> data;


  factory ForumCategoriesResponse.fromJson(Map<String, dynamic> json) => _$ForumCategoriesResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ForumCategoriesResponseToJson(this);
  
  factory ForumCategoriesResponse.emptyInstance() => ForumCategoriesResponse(code: 0, success: false, msg: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class ForumCategory {

  ForumCategory(
      {required this.id,
      required this.name,
      required this.isDefault,
      required this.createdAt,
      required this.updatedAt});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "is_default", defaultValue: false)
  bool isDefault;

  @JsonKey(name: "created_at", defaultValue: "")
  String createdAt;

  @JsonKey(name: "updated_at", defaultValue: "")
  String updatedAt;


  factory ForumCategory.fromJson(Map<String, dynamic> json) => _$ForumCategoryFromJson(json);
  
  Map<String, dynamic> toJson() => _$ForumCategoryToJson(this);
  
  factory ForumCategory.emptyInstance() => ForumCategory(id: "", name: "", isDefault: false, createdAt: "", updatedAt: "");
}


