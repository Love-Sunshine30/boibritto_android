// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  id: (json['id'] as num).toInt(),
  bookId: (json['book_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  userName: json['user_name'] as String,
  body: json['body'] as String,
  edited: json['edited'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'book_id': instance.bookId,
  'user_id': instance.userId,
  'user_name': instance.userName,
  'body': instance.body,
  'edited': instance.edited,
  'created_at': instance.createdAt.toIso8601String(),
};

_ForumPage _$ForumPageFromJson(Map<String, dynamic> json) => _ForumPage(
  posts: (json['posts'] as List<dynamic>)
      .map((e) => Post.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['next_cursor'] == null
      ? null
      : DateTime.parse(json['next_cursor'] as String),
);

Map<String, dynamic> _$ForumPageToJson(_ForumPage instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'next_cursor': instance.nextCursor?.toIso8601String(),
    };
