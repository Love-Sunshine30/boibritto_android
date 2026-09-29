// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BorrowRequest _$BorrowRequestFromJson(Map<String, dynamic> json) =>
    _BorrowRequest(
      id: (json['id'] as num).toInt(),
      bookId: (json['book_id'] as num).toInt(),
      bookTitle: json['book_title'] as String,
      requesterId: (json['requester_id'] as num).toInt(),
      requesterName: json['requester_name'] as String,
      message: json['message'] as String,
      ownerId: (json['owner_id'] as num).toInt(),
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      ownerConfirmed: json['owner_confirmed'] as bool,
      borrowerConfirmed: json['borrower_confirmed'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BorrowRequestToJson(_BorrowRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'book_title': instance.bookTitle,
      'requester_id': instance.requesterId,
      'requester_name': instance.requesterName,
      'message': instance.message,
      'owner_id': instance.ownerId,
      'status': _$RequestStatusEnumMap[instance.status]!,
      'owner_confirmed': instance.ownerConfirmed,
      'borrower_confirmed': instance.borrowerConfirmed,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.accepted: 'accepted',
  RequestStatus.active: 'active',
  RequestStatus.rejected: 'rejected',
  RequestStatus.returned: 'returned',
};
