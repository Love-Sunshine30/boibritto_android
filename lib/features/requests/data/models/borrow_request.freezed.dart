// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'borrow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BorrowRequest {

 int get id;@JsonKey(name: 'book_id') int get bookId;@JsonKey(name: 'book_title') String get bookTitle;@JsonKey(name: 'requester_id') int get requesterId;@JsonKey(name: 'requester_name') String get requesterName; String get message;@JsonKey(name: 'owner_id') int get ownerId; RequestStatus get status;@JsonKey(name: 'owner_confirmed') bool get ownerConfirmed;@JsonKey(name: 'borrower_confirmed') bool get borrowerConfirmed;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of BorrowRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BorrowRequestCopyWith<BorrowRequest> get copyWith => _$BorrowRequestCopyWithImpl<BorrowRequest>(this as BorrowRequest, _$identity);

  /// Serializes this BorrowRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BorrowRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.requesterName, requesterName) || other.requesterName == requesterName)&&(identical(other.message, message) || other.message == message)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerConfirmed, ownerConfirmed) || other.ownerConfirmed == ownerConfirmed)&&(identical(other.borrowerConfirmed, borrowerConfirmed) || other.borrowerConfirmed == borrowerConfirmed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,bookTitle,requesterId,requesterName,message,ownerId,status,ownerConfirmed,borrowerConfirmed,createdAt);

@override
String toString() {
  return 'BorrowRequest(id: $id, bookId: $bookId, bookTitle: $bookTitle, requesterId: $requesterId, requesterName: $requesterName, message: $message, ownerId: $ownerId, status: $status, ownerConfirmed: $ownerConfirmed, borrowerConfirmed: $borrowerConfirmed, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BorrowRequestCopyWith<$Res>  {
  factory $BorrowRequestCopyWith(BorrowRequest value, $Res Function(BorrowRequest) _then) = _$BorrowRequestCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'book_title') String bookTitle,@JsonKey(name: 'requester_id') int requesterId,@JsonKey(name: 'requester_name') String requesterName, String message,@JsonKey(name: 'owner_id') int ownerId, RequestStatus status,@JsonKey(name: 'owner_confirmed') bool ownerConfirmed,@JsonKey(name: 'borrower_confirmed') bool borrowerConfirmed,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$BorrowRequestCopyWithImpl<$Res>
    implements $BorrowRequestCopyWith<$Res> {
  _$BorrowRequestCopyWithImpl(this._self, this._then);

  final BorrowRequest _self;
  final $Res Function(BorrowRequest) _then;

/// Create a copy of BorrowRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? bookTitle = null,Object? requesterId = null,Object? requesterName = null,Object? message = null,Object? ownerId = null,Object? status = null,Object? ownerConfirmed = null,Object? borrowerConfirmed = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as int,requesterName: null == requesterName ? _self.requesterName : requesterName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,ownerConfirmed: null == ownerConfirmed ? _self.ownerConfirmed : ownerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,borrowerConfirmed: null == borrowerConfirmed ? _self.borrowerConfirmed : borrowerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BorrowRequest].
extension BorrowRequestPatterns on BorrowRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BorrowRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BorrowRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BorrowRequest value)  $default,){
final _that = this;
switch (_that) {
case _BorrowRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BorrowRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BorrowRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'requester_id')  int requesterId, @JsonKey(name: 'requester_name')  String requesterName,  String message, @JsonKey(name: 'owner_id')  int ownerId,  RequestStatus status, @JsonKey(name: 'owner_confirmed')  bool ownerConfirmed, @JsonKey(name: 'borrower_confirmed')  bool borrowerConfirmed, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BorrowRequest() when $default != null:
return $default(_that.id,_that.bookId,_that.bookTitle,_that.requesterId,_that.requesterName,_that.message,_that.ownerId,_that.status,_that.ownerConfirmed,_that.borrowerConfirmed,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'requester_id')  int requesterId, @JsonKey(name: 'requester_name')  String requesterName,  String message, @JsonKey(name: 'owner_id')  int ownerId,  RequestStatus status, @JsonKey(name: 'owner_confirmed')  bool ownerConfirmed, @JsonKey(name: 'borrower_confirmed')  bool borrowerConfirmed, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BorrowRequest():
return $default(_that.id,_that.bookId,_that.bookTitle,_that.requesterId,_that.requesterName,_that.message,_that.ownerId,_that.status,_that.ownerConfirmed,_that.borrowerConfirmed,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'requester_id')  int requesterId, @JsonKey(name: 'requester_name')  String requesterName,  String message, @JsonKey(name: 'owner_id')  int ownerId,  RequestStatus status, @JsonKey(name: 'owner_confirmed')  bool ownerConfirmed, @JsonKey(name: 'borrower_confirmed')  bool borrowerConfirmed, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BorrowRequest() when $default != null:
return $default(_that.id,_that.bookId,_that.bookTitle,_that.requesterId,_that.requesterName,_that.message,_that.ownerId,_that.status,_that.ownerConfirmed,_that.borrowerConfirmed,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BorrowRequest implements BorrowRequest {
  const _BorrowRequest({required this.id, @JsonKey(name: 'book_id') required this.bookId, @JsonKey(name: 'book_title') required this.bookTitle, @JsonKey(name: 'requester_id') required this.requesterId, @JsonKey(name: 'requester_name') required this.requesterName, required this.message, @JsonKey(name: 'owner_id') required this.ownerId, required this.status, @JsonKey(name: 'owner_confirmed') required this.ownerConfirmed, @JsonKey(name: 'borrower_confirmed') required this.borrowerConfirmed, @JsonKey(name: 'created_at') required this.createdAt});
  factory _BorrowRequest.fromJson(Map<String, dynamic> json) => _$BorrowRequestFromJson(json);

@override final  int id;
@override@JsonKey(name: 'book_id') final  int bookId;
@override@JsonKey(name: 'book_title') final  String bookTitle;
@override@JsonKey(name: 'requester_id') final  int requesterId;
@override@JsonKey(name: 'requester_name') final  String requesterName;
@override final  String message;
@override@JsonKey(name: 'owner_id') final  int ownerId;
@override final  RequestStatus status;
@override@JsonKey(name: 'owner_confirmed') final  bool ownerConfirmed;
@override@JsonKey(name: 'borrower_confirmed') final  bool borrowerConfirmed;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of BorrowRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BorrowRequestCopyWith<_BorrowRequest> get copyWith => __$BorrowRequestCopyWithImpl<_BorrowRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BorrowRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BorrowRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.requesterName, requesterName) || other.requesterName == requesterName)&&(identical(other.message, message) || other.message == message)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerConfirmed, ownerConfirmed) || other.ownerConfirmed == ownerConfirmed)&&(identical(other.borrowerConfirmed, borrowerConfirmed) || other.borrowerConfirmed == borrowerConfirmed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,bookTitle,requesterId,requesterName,message,ownerId,status,ownerConfirmed,borrowerConfirmed,createdAt);

@override
String toString() {
  return 'BorrowRequest(id: $id, bookId: $bookId, bookTitle: $bookTitle, requesterId: $requesterId, requesterName: $requesterName, message: $message, ownerId: $ownerId, status: $status, ownerConfirmed: $ownerConfirmed, borrowerConfirmed: $borrowerConfirmed, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BorrowRequestCopyWith<$Res> implements $BorrowRequestCopyWith<$Res> {
  factory _$BorrowRequestCopyWith(_BorrowRequest value, $Res Function(_BorrowRequest) _then) = __$BorrowRequestCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'book_title') String bookTitle,@JsonKey(name: 'requester_id') int requesterId,@JsonKey(name: 'requester_name') String requesterName, String message,@JsonKey(name: 'owner_id') int ownerId, RequestStatus status,@JsonKey(name: 'owner_confirmed') bool ownerConfirmed,@JsonKey(name: 'borrower_confirmed') bool borrowerConfirmed,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$BorrowRequestCopyWithImpl<$Res>
    implements _$BorrowRequestCopyWith<$Res> {
  __$BorrowRequestCopyWithImpl(this._self, this._then);

  final _BorrowRequest _self;
  final $Res Function(_BorrowRequest) _then;

/// Create a copy of BorrowRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? bookTitle = null,Object? requesterId = null,Object? requesterName = null,Object? message = null,Object? ownerId = null,Object? status = null,Object? ownerConfirmed = null,Object? borrowerConfirmed = null,Object? createdAt = null,}) {
  return _then(_BorrowRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as int,requesterName: null == requesterName ? _self.requesterName : requesterName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,ownerConfirmed: null == ownerConfirmed ? _self.ownerConfirmed : ownerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,borrowerConfirmed: null == borrowerConfirmed ? _self.borrowerConfirmed : borrowerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
