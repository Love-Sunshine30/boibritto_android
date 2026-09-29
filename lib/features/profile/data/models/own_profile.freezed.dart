// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'own_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnProfile {

 User get user; List<UserBookSummary> get books;@JsonKey(name: 'recent_activity') List<ActivityItem> get recentActivity;
/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnProfileCopyWith<OwnProfile> get copyWith => _$OwnProfileCopyWithImpl<OwnProfile>(this as OwnProfile, _$identity);

  /// Serializes this OwnProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnProfile&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.books, books)&&const DeepCollectionEquality().equals(other.recentActivity, recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(books),const DeepCollectionEquality().hash(recentActivity));

@override
String toString() {
  return 'OwnProfile(user: $user, books: $books, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class $OwnProfileCopyWith<$Res>  {
  factory $OwnProfileCopyWith(OwnProfile value, $Res Function(OwnProfile) _then) = _$OwnProfileCopyWithImpl;
@useResult
$Res call({
 User user, List<UserBookSummary> books,@JsonKey(name: 'recent_activity') List<ActivityItem> recentActivity
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$OwnProfileCopyWithImpl<$Res>
    implements $OwnProfileCopyWith<$Res> {
  _$OwnProfileCopyWithImpl(this._self, this._then);

  final OwnProfile _self;
  final $Res Function(OwnProfile) _then;

/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? books = null,Object? recentActivity = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<UserBookSummary>,recentActivity: null == recentActivity ? _self.recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}
/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [OwnProfile].
extension OwnProfilePatterns on OwnProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnProfile value)  $default,){
final _that = this;
switch (_that) {
case _OwnProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnProfile value)?  $default,){
final _that = this;
switch (_that) {
case _OwnProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user,  List<UserBookSummary> books, @JsonKey(name: 'recent_activity')  List<ActivityItem> recentActivity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnProfile() when $default != null:
return $default(_that.user,_that.books,_that.recentActivity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user,  List<UserBookSummary> books, @JsonKey(name: 'recent_activity')  List<ActivityItem> recentActivity)  $default,) {final _that = this;
switch (_that) {
case _OwnProfile():
return $default(_that.user,_that.books,_that.recentActivity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user,  List<UserBookSummary> books, @JsonKey(name: 'recent_activity')  List<ActivityItem> recentActivity)?  $default,) {final _that = this;
switch (_that) {
case _OwnProfile() when $default != null:
return $default(_that.user,_that.books,_that.recentActivity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OwnProfile implements OwnProfile {
  const _OwnProfile({required this.user, required  List<UserBookSummary> books, @JsonKey(name: 'recent_activity') required List<ActivityItem> recentActivity}): _books = books,_recentActivity = recentActivity;
  factory _OwnProfile.fromJson(Map<String, dynamic> json) => _$OwnProfileFromJson(json);

@override final  User user;
 final  List<UserBookSummary> _books;
@override List<UserBookSummary> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

 final  List<ActivityItem> _recentActivity;
@override@JsonKey(name: 'recent_activity') List<ActivityItem> get recentActivity {
  if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivity);
}


/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnProfileCopyWith<_OwnProfile> get copyWith => __$OwnProfileCopyWithImpl<_OwnProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnProfile&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._books, _books)&&const DeepCollectionEquality().equals(other._recentActivity, _recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_books),const DeepCollectionEquality().hash(_recentActivity));

@override
String toString() {
  return 'OwnProfile(user: $user, books: $books, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class _$OwnProfileCopyWith<$Res> implements $OwnProfileCopyWith<$Res> {
  factory _$OwnProfileCopyWith(_OwnProfile value, $Res Function(_OwnProfile) _then) = __$OwnProfileCopyWithImpl;
@override @useResult
$Res call({
 User user, List<UserBookSummary> books,@JsonKey(name: 'recent_activity') List<ActivityItem> recentActivity
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$OwnProfileCopyWithImpl<$Res>
    implements _$OwnProfileCopyWith<$Res> {
  __$OwnProfileCopyWithImpl(this._self, this._then);

  final _OwnProfile _self;
  final $Res Function(_OwnProfile) _then;

/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? books = null,Object? recentActivity = null,}) {
  return _then(_OwnProfile(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<UserBookSummary>,recentActivity: null == recentActivity ? _self._recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}

/// Create a copy of OwnProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
