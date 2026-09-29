import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'own_profile.freezed.dart';
part 'own_profile.g.dart';

@freezed
abstract class OwnProfile with _$OwnProfile {
  const factory OwnProfile({
    required User user,
    required List<UserBookSummary> books,
    @JsonKey(name: 'recent_activity') required List<ActivityItem> recentActivity,
  }) = _OwnProfile;

  factory OwnProfile.fromJson(Map<String, dynamic> json) =>
      _$OwnProfileFromJson(json);
}