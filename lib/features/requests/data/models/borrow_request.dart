import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow_request.freezed.dart';
part 'borrow_request.g.dart';

enum RequestStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('active')
  active,
  @JsonValue('rejected')
  rejected,
  @JsonValue('returned')
  returned,
}

@freezed
abstract class BorrowRequest with _$BorrowRequest {
  const factory BorrowRequest({
    required int id,
    @JsonKey(name: 'book_id') required int bookId,
    @JsonKey(name: 'book_title') required String bookTitle,
    @JsonKey(name: 'requester_id') required int requesterId,
    @JsonKey(name: 'requester_name') required String requesterName,
    required String message,
    @JsonKey(name: 'owner_id') required int ownerId,
    required RequestStatus status,
    @JsonKey(name: 'owner_confirmed') required bool ownerConfirmed,
    @JsonKey(name: 'borrower_confirmed') required bool borrowerConfirmed,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BorrowRequest;

  factory BorrowRequest.fromJson(Map<String, dynamic> json) =>
      _$BorrowRequestFromJson(json);
}