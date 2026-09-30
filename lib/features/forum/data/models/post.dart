import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required int id,
    @JsonKey(name: 'book_id') required int bookId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'user_name') required String userName,
    required String body,
    required bool edited,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
abstract class ForumPage with _$ForumPage {
  const factory ForumPage({
    required List<Post> posts,
    @JsonKey(name: 'next_cursor') DateTime? nextCursor,
  }) = _ForumPage;

  factory ForumPage.fromJson(Map<String, dynamic> json) => _$ForumPageFromJson(json);
}