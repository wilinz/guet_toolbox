// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumCategoriesResponse _$ForumCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    ForumCategoriesResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ForumCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ForumCategoriesResponseToJson(
        ForumCategoriesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ForumCategory _$ForumCategoryFromJson(Map<String, dynamic> json) =>
    ForumCategory(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isDefault: json['is_default'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$ForumCategoryToJson(ForumCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
