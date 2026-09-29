import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String author,
    required String genre,
    required String description,
    @JsonKey(name: 'cover_url') required String coverUrl,
    required bool available,
    @JsonKey(name: 'owner_id') required int ownerId,
    @JsonKey(name: 'owner_name') required String ownerName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

/// A page of books plus the cursor for the next page (null = end of list).
@freezed
abstract class BookPage with _$BookPage {
  const factory BookPage({
    required List<Book> books,
    @JsonKey(name: 'next_cursor') DateTime? nextCursor,
  }) = _BookPage;

  factory BookPage.fromJson(Map<String, dynamic> json) => _$BookPageFromJson(json);
}