import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'public_profile.freezed.dart';
part 'public_profile.g.dart';

@freezed
abstract class PublicProfile with _$PublicProfile {
  const factory PublicProfile({
    required PublicUser user,
    required List<UserBookSummary> books,
    @JsonKey(name: 'recent_activity') required List<ActivityItem> recentActivity,
  }) = _PublicProfile;

  factory PublicProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicProfileFromJson(json);
}