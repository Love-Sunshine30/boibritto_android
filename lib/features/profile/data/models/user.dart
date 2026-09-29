import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    @JsonKey(name: 'last_active_at') DateTime? lastActiveAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class PublicUser with _$PublicUser {
  const factory PublicUser({
    required int id,
    required String name,
    @JsonKey(name: 'last_active_at') DateTime? lastActiveAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}

@freezed
abstract class UserBookSummary with _$UserBookSummary {
  const factory UserBookSummary({
    required int id,
    required String title,
    required String author,
    @JsonKey(name: 'cover_url') required String coverUrl,
    required bool available,
  }) = _UserBookSummary;

  factory UserBookSummary.fromJson(Map<String, dynamic> json) =>
      _$UserBookSummaryFromJson(json);
}

enum ActivityType {
  @JsonValue('book_listed')
  bookListed,
  @JsonValue('request_sent')
  requestSent,
  @JsonValue('request_accepted')
  requestAccepted,
}

@freezed
abstract class ActivityItem with _$ActivityItem {
  const factory ActivityItem({
    required ActivityType type,
    required String description,
    required DateTime timestamp,
  }) = _ActivityItem;

  factory ActivityItem.fromJson(Map<String, dynamic> json) =>
      _$ActivityItemFromJson(json);
}