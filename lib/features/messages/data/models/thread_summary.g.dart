// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThreadSummary _$ThreadSummaryFromJson(Map<String, dynamic> json) =>
    _ThreadSummary(
      requestId: (json['request_id'] as num).toInt(),
      bookTitle: json['book_title'] as String,
      otherParticipantName: json['other_participant_name'] as String?,
      lastMessagePreview: json['last_message_preview'] as String,
      lastMessageAt: DateTime.parse(json['last_message_at'] as String),
    );

Map<String, dynamic> _$ThreadSummaryToJson(_ThreadSummary instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'book_title': instance.bookTitle,
      'other_participant_name': instance.otherParticipantName,
      'last_message_preview': instance.lastMessagePreview,
      'last_message_at': instance.lastMessageAt.toIso8601String(),
    };
