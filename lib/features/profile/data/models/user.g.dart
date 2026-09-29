// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  whatsappNumber: json['whatsapp_number'] as String?,
  lastActiveAt: json['last_active_at'] == null
      ? null
      : DateTime.parse(json['last_active_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'whatsapp_number': instance.whatsappNumber,
  'last_active_at': instance.lastActiveAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};

_PublicUser _$PublicUserFromJson(Map<String, dynamic> json) => _PublicUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  lastActiveAt: json['last_active_at'] == null
      ? null
      : DateTime.parse(json['last_active_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PublicUserToJson(_PublicUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_active_at': instance.lastActiveAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

_UserBookSummary _$UserBookSummaryFromJson(Map<String, dynamic> json) =>
    _UserBookSummary(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['cover_url'] as String,
      available: json['available'] as bool,
    );

Map<String, dynamic> _$UserBookSummaryToJson(_UserBookSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'cover_url': instance.coverUrl,
      'available': instance.available,
    };

_ActivityItem _$ActivityItemFromJson(Map<String, dynamic> json) =>
    _ActivityItem(
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ActivityItemToJson(_ActivityItem instance) =>
    <String, dynamic>{
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$ActivityTypeEnumMap = {
  ActivityType.bookListed: 'book_listed',
  ActivityType.requestSent: 'request_sent',
  ActivityType.requestAccepted: 'request_accepted',
};
