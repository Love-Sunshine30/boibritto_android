// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  author: json['author'] as String,
  genre: json['genre'] as String,
  description: json['description'] as String,
  coverUrl: json['cover_url'] as String,
  available: json['available'] as bool,
  ownerId: (json['owner_id'] as num).toInt(),
  ownerName: json['owner_name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'genre': instance.genre,
  'description': instance.description,
  'cover_url': instance.coverUrl,
  'available': instance.available,
  'owner_id': instance.ownerId,
  'owner_name': instance.ownerName,
  'created_at': instance.createdAt.toIso8601String(),
};

_BookPage _$BookPageFromJson(Map<String, dynamic> json) => _BookPage(
  books: (json['books'] as List<dynamic>)
      .map((e) => Book.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['next_cursor'] == null
      ? null
      : DateTime.parse(json['next_cursor'] as String),
);

Map<String, dynamic> _$BookPageToJson(_BookPage instance) => <String, dynamic>{
  'books': instance.books,
  'next_cursor': instance.nextCursor?.toIso8601String(),
};
