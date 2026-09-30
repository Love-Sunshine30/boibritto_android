// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThreadSummary {

@JsonKey(name: 'request_id') int get requestId;@JsonKey(name: 'book_title') String get bookTitle;// NOT in openapi.yml's `required` list, unlike the other fields here —
// nullable to match.
@JsonKey(name: 'other_participant_name') String? get otherParticipantName;@JsonKey(name: 'last_message_preview') String get lastMessagePreview;@JsonKey(name: 'last_message_at') DateTime get lastMessageAt;
/// Create a copy of ThreadSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadSummaryCopyWith<ThreadSummary> get copyWith => _$ThreadSummaryCopyWithImpl<ThreadSummary>(this as ThreadSummary, _$identity);

  /// Serializes this ThreadSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadSummary&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.otherParticipantName, otherParticipantName) || other.otherParticipantName == otherParticipantName)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,bookTitle,otherParticipantName,lastMessagePreview,lastMessageAt);

@override
String toString() {
  return 'ThreadSummary(requestId: $requestId, bookTitle: $bookTitle, otherParticipantName: $otherParticipantName, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt)';
}


}

/// @nodoc
abstract mixin class $ThreadSummaryCopyWith<$Res>  {
  factory $ThreadSummaryCopyWith(ThreadSummary value, $Res Function(ThreadSummary) _then) = _$ThreadSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'book_title') String bookTitle,@JsonKey(name: 'other_participant_name') String? otherParticipantName,@JsonKey(name: 'last_message_preview') String lastMessagePreview,@JsonKey(name: 'last_message_at') DateTime lastMessageAt
});




}
/// @nodoc
class _$ThreadSummaryCopyWithImpl<$Res>
    implements $ThreadSummaryCopyWith<$Res> {
  _$ThreadSummaryCopyWithImpl(this._self, this._then);

  final ThreadSummary _self;
  final $Res Function(ThreadSummary) _then;

/// Create a copy of ThreadSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? bookTitle = null,Object? otherParticipantName = freezed,Object? lastMessagePreview = null,Object? lastMessageAt = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,otherParticipantName: freezed == otherParticipantName ? _self.otherParticipantName : otherParticipantName // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: null == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadSummary].
extension ThreadSummaryPatterns on ThreadSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadSummary value)  $default,){
final _that = this;
switch (_that) {
case _ThreadSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'other_participant_name')  String? otherParticipantName, @JsonKey(name: 'last_message_preview')  String lastMessagePreview, @JsonKey(name: 'last_message_at')  DateTime lastMessageAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadSummary() when $default != null:
return $default(_that.requestId,_that.bookTitle,_that.otherParticipantName,_that.lastMessagePreview,_that.lastMessageAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'other_participant_name')  String? otherParticipantName, @JsonKey(name: 'last_message_preview')  String lastMessagePreview, @JsonKey(name: 'last_message_at')  DateTime lastMessageAt)  $default,) {final _that = this;
switch (_that) {
case _ThreadSummary():
return $default(_that.requestId,_that.bookTitle,_that.otherParticipantName,_that.lastMessagePreview,_that.lastMessageAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  int requestId, @JsonKey(name: 'book_title')  String bookTitle, @JsonKey(name: 'other_participant_name')  String? otherParticipantName, @JsonKey(name: 'last_message_preview')  String lastMessagePreview, @JsonKey(name: 'last_message_at')  DateTime lastMessageAt)?  $default,) {final _that = this;
switch (_that) {
case _ThreadSummary() when $default != null:
return $default(_that.requestId,_that.bookTitle,_that.otherParticipantName,_that.lastMessagePreview,_that.lastMessageAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadSummary implements ThreadSummary {
  const _ThreadSummary({@JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'book_title') required this.bookTitle, @JsonKey(name: 'other_participant_name') this.otherParticipantName, @JsonKey(name: 'last_message_preview') required this.lastMessagePreview, @JsonKey(name: 'last_message_at') required this.lastMessageAt});
  factory _ThreadSummary.fromJson(Map<String, dynamic> json) => _$ThreadSummaryFromJson(json);

@override@JsonKey(name: 'request_id') final  int requestId;
@override@JsonKey(name: 'book_title') final  String bookTitle;
// NOT in openapi.yml's `required` list, unlike the other fields here —
// nullable to match.
@override@JsonKey(name: 'other_participant_name') final  String? otherParticipantName;
@override@JsonKey(name: 'last_message_preview') final  String lastMessagePreview;
@override@JsonKey(name: 'last_message_at') final  DateTime lastMessageAt;

/// Create a copy of ThreadSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadSummaryCopyWith<_ThreadSummary> get copyWith => __$ThreadSummaryCopyWithImpl<_ThreadSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadSummary&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.otherParticipantName, otherParticipantName) || other.otherParticipantName == otherParticipantName)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,bookTitle,otherParticipantName,lastMessagePreview,lastMessageAt);

@override
String toString() {
  return 'ThreadSummary(requestId: $requestId, bookTitle: $bookTitle, otherParticipantName: $otherParticipantName, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt)';
}


}

/// @nodoc
abstract mixin class _$ThreadSummaryCopyWith<$Res> implements $ThreadSummaryCopyWith<$Res> {
  factory _$ThreadSummaryCopyWith(_ThreadSummary value, $Res Function(_ThreadSummary) _then) = __$ThreadSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') int requestId,@JsonKey(name: 'book_title') String bookTitle,@JsonKey(name: 'other_participant_name') String? otherParticipantName,@JsonKey(name: 'last_message_preview') String lastMessagePreview,@JsonKey(name: 'last_message_at') DateTime lastMessageAt
});




}
/// @nodoc
class __$ThreadSummaryCopyWithImpl<$Res>
    implements _$ThreadSummaryCopyWith<$Res> {
  __$ThreadSummaryCopyWithImpl(this._self, this._then);

  final _ThreadSummary _self;
  final $Res Function(_ThreadSummary) _then;

/// Create a copy of ThreadSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? bookTitle = null,Object? otherParticipantName = freezed,Object? lastMessagePreview = null,Object? lastMessageAt = null,}) {
  return _then(_ThreadSummary(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,otherParticipantName: freezed == otherParticipantName ? _self.otherParticipantName : otherParticipantName // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: null == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
