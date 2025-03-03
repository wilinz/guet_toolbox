// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumPostsResponse _$ForumPostsResponseFromJson(Map<String, dynamic> json) =>
    ForumPostsResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ForumPost.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ForumPostsResponseToJson(ForumPostsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'verified': instance.verified,
    };

ForumPost _$ForumPostFromJson(Map<String, dynamic> json) => ForumPost(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      userId: json['user_id'] as String? ?? '',
      userProfile: json['user_profile'] == null
          ? UserProfile.emptyInstance()
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
      topic: json['Topic'] as List<dynamic>? ?? [],
      parentId: json['parent_id'] as String?,
      categoryId: json['category_id'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
      repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
      visibility: json['visibility'] as String? ?? '',
      allowReplies: json['allow_replies'] as bool? ?? false,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      address: json['address'] as String?,
      ipCity: json['ip_city'] as String?,
      ipCountry: json['ip_country'] as String?,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$ForumPostToJson(ForumPost instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'images': instance.images,
      'videos': instance.videos,
      'user_id': instance.userId,
      'user_profile': instance.userProfile.toJson(),
      'Topic': instance.topic,
      'parent_id': instance.parentId,
      'category_id': instance.categoryId,
      'category': instance.category?.toJson(),
      'priority': instance.priority,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      'views_count': instance.viewsCount,
      'replies_count': instance.repliesCount,
      'visibility': instance.visibility,
      'address': instance.address,
      'ip_city': instance.ipCity,
      'ip_country': instance.ipCountry,
      'allow_replies': instance.allowReplies,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isDefault: json['is_default'] as bool? ?? true,
      order: (json['order'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_default': instance.isDefault,
      'order': instance.order,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
