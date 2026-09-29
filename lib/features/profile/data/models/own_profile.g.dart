// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnProfile _$OwnProfileFromJson(Map<String, dynamic> json) => _OwnProfile(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  books: (json['books'] as List<dynamic>)
      .map((e) => UserBookSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  recentActivity: (json['recent_activity'] as List<dynamic>)
      .map((e) => ActivityItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OwnProfileToJson(_OwnProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
      'books': instance.books,
      'recent_activity': instance.recentActivity,
    };
