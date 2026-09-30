import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_summary.freezed.dart';
part 'thread_summary.g.dart';

@freezed
abstract class ThreadSummary with _$ThreadSummary {
  const factory ThreadSummary({
    @JsonKey(name: 'request_id') required int requestId,
    @JsonKey(name: 'book_title') required String bookTitle,
    // NOT in openapi.yml's `required` list, unlike the other fields here —
    // nullable to match.
    @JsonKey(name: 'other_participant_name') String? otherParticipantName,
    @JsonKey(name: 'last_message_preview') required String lastMessagePreview,
    @JsonKey(name: 'last_message_at') required DateTime lastMessageAt,
  }) = _ThreadSummary;

  factory ThreadSummary.fromJson(Map<String, dynamic> json) =>
      _$ThreadSummaryFromJson(json);
}