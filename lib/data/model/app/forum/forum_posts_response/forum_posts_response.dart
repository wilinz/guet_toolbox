import 'package:json_annotation/json_annotation.dart';

part 'forum_posts_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ForumPostsResponse {
  ForumPostsResponse(
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
  List<ForumPost> data;

  factory ForumPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForumPostsResponseToJson(this);

  factory ForumPostsResponse.emptyInstance() =>
      ForumPostsResponse(code: 0, success: false, msg: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class UserProfile {
  UserProfile({
    required this.id,
    required this.userId,
    required this.nickname,
    required this.avatar,
    this.verified = false,
  });

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "user_id", defaultValue: "")
  String userId;

  @JsonKey(name: "nickname", defaultValue: "")
  String nickname;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "verified", defaultValue: false)
  bool verified;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  factory UserProfile.emptyInstance() =>
      UserProfile(id: "", userId: "", nickname: "", avatar: "");
}

@JsonSerializable(explicitToJson: true)
class ForumPost {
  ForumPost(
      {required this.id,
      required this.text,
      required this.images,
      required this.videos,
      required this.userId,
      required this.userProfile,
      required this.topic,
      this.parentId,
      this.categoryId,
      required this.priority,
      required this.likesCount,
      required this.isLiked,
      required this.viewsCount,
      required this.repliesCount,
      required this.visibility,
      required this.allowReplies,
      this.category,
      this.address,
      this.ipCity,
      this.ipCountry,
      required this.createdAt,
      required this.updatedAt});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  @JsonKey(name: "images", defaultValue: [])
  List<String> images;

  @JsonKey(name: "videos", defaultValue: [])
  List<String> videos;

  @JsonKey(name: "user_id", defaultValue: "")
  String userId;

  @JsonKey(name: "user_profile", defaultValue: UserProfile.emptyInstance)
  UserProfile userProfile;

  @JsonKey(name: "Topic", defaultValue: [])
  List topic;

  @JsonKey(name: "parent_id")
  String? parentId;

  @JsonKey(name: "category_id")
  String? categoryId;

  @JsonKey(name: "category")
  Category? category;

  @JsonKey(name: "priority", defaultValue: 0)
  int priority;

  @JsonKey(name: "likes_count", defaultValue: 0)
  int likesCount;

  @JsonKey(name: "is_liked", defaultValue: false)
  bool isLiked;

  @JsonKey(name: "views_count", defaultValue: 0)
  int viewsCount;

  @JsonKey(name: "replies_count", defaultValue: 0)
  int repliesCount;

  @JsonKey(name: "visibility", defaultValue: "")
  String visibility;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "ip_city")
  String? ipCity;

  @JsonKey(name: "ip_country")
  String? ipCountry;

  @JsonKey(name: "allow_replies", defaultValue: false)
  bool allowReplies;

  @JsonKey(name: "created_at", defaultValue: "")
  String createdAt;

  @JsonKey(name: "updated_at", defaultValue: "")
  String updatedAt;

  factory ForumPost.fromJson(Map<String, dynamic> json) =>
      _$ForumPostFromJson(json);

  Map<String, dynamic> toJson() => _$ForumPostToJson(this);

  factory ForumPost.emptyInstance() => ForumPost(
      id: "",
      text: "",
      images: [],
      videos: [],
      userId: "",
      userProfile: UserProfile.emptyInstance(),
      topic: [],
      priority: 0,
      likesCount: 0,
      isLiked: false,
      viewsCount: 0,
      repliesCount: 0,
      visibility: "",
      allowReplies: false,
      createdAt: "",
      updatedAt: "");
}

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    required this.id,
    required this.name,
    required this.isDefault,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "is_default", defaultValue: true)
  bool isDefault;

  @JsonKey(name: "order", defaultValue: 0)
  int order;

  @JsonKey(name: "created_at", defaultValue: "")
  String createdAt;

  @JsonKey(name: "updated_at", defaultValue: "")
  String updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  factory Category.emptyInstance() => Category(
    id: "",
    name: "",
    isDefault: true,
    order: 0,
    createdAt: "",
    updatedAt: "",
  );
}

