// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id; String get name; String get email;@JsonKey(name: 'whatsapp_number') String? get whatsappNumber;@JsonKey(name: 'last_active_at') DateTime? get lastActiveAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,whatsappNumber,lastActiveAt,createdAt);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, whatsappNumber: $whatsappNumber, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email,@JsonKey(name: 'whatsapp_number') String? whatsappNumber,@JsonKey(name: 'last_active_at') DateTime? lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? whatsappNumber = freezed,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.whatsappNumber,_that.lastActiveAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.email,_that.whatsappNumber,_that.lastActiveAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.whatsappNumber,_that.lastActiveAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.name, required this.email, @JsonKey(name: 'whatsapp_number') this.whatsappNumber, @JsonKey(name: 'last_active_at') this.lastActiveAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;
@override@JsonKey(name: 'whatsapp_number') final  String? whatsappNumber;
@override@JsonKey(name: 'last_active_at') final  DateTime? lastActiveAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,whatsappNumber,lastActiveAt,createdAt);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, whatsappNumber: $whatsappNumber, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email,@JsonKey(name: 'whatsapp_number') String? whatsappNumber,@JsonKey(name: 'last_active_at') DateTime? lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? whatsappNumber = freezed,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$PublicUser {

 int get id; String get name;@JsonKey(name: 'last_active_at') DateTime? get lastActiveAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of PublicUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicUserCopyWith<PublicUser> get copyWith => _$PublicUserCopyWithImpl<PublicUser>(this as PublicUser, _$identity);

  /// Serializes this PublicUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastActiveAt,createdAt);

@override
String toString() {
  return 'PublicUser(id: $id, name: $name, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PublicUserCopyWith<$Res>  {
  factory $PublicUserCopyWith(PublicUser value, $Res Function(PublicUser) _then) = _$PublicUserCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'last_active_at') DateTime? lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$PublicUserCopyWithImpl<$Res>
    implements $PublicUserCopyWith<$Res> {
  _$PublicUserCopyWithImpl(this._self, this._then);

  final PublicUser _self;
  final $Res Function(PublicUser) _then;

/// Create a copy of PublicUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicUser].
extension PublicUserPatterns on PublicUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicUser value)  $default,){
final _that = this;
switch (_that) {
case _PublicUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicUser value)?  $default,){
final _that = this;
switch (_that) {
case _PublicUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicUser() when $default != null:
return $default(_that.id,_that.name,_that.lastActiveAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PublicUser():
return $default(_that.id,_that.name,_that.lastActiveAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'last_active_at')  DateTime? lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PublicUser() when $default != null:
return $default(_that.id,_that.name,_that.lastActiveAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicUser implements PublicUser {
  const _PublicUser({required this.id, required this.name, @JsonKey(name: 'last_active_at') this.lastActiveAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _PublicUser.fromJson(Map<String, dynamic> json) => _$PublicUserFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'last_active_at') final  DateTime? lastActiveAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of PublicUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicUserCopyWith<_PublicUser> get copyWith => __$PublicUserCopyWithImpl<_PublicUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,lastActiveAt,createdAt);

@override
String toString() {
  return 'PublicUser(id: $id, name: $name, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PublicUserCopyWith<$Res> implements $PublicUserCopyWith<$Res> {
  factory _$PublicUserCopyWith(_PublicUser value, $Res Function(_PublicUser) _then) = __$PublicUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'last_active_at') DateTime? lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$PublicUserCopyWithImpl<$Res>
    implements _$PublicUserCopyWith<$Res> {
  __$PublicUserCopyWithImpl(this._self, this._then);

  final _PublicUser _self;
  final $Res Function(_PublicUser) _then;

/// Create a copy of PublicUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_PublicUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$UserBookSummary {

 int get id; String get title; String get author;@JsonKey(name: 'cover_url') String get coverUrl; bool get available;
/// Create a copy of UserBookSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBookSummaryCopyWith<UserBookSummary> get copyWith => _$UserBookSummaryCopyWithImpl<UserBookSummary>(this as UserBookSummary, _$identity);

  /// Serializes this UserBookSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBookSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,coverUrl,available);

@override
String toString() {
  return 'UserBookSummary(id: $id, title: $title, author: $author, coverUrl: $coverUrl, available: $available)';
}


}

/// @nodoc
abstract mixin class $UserBookSummaryCopyWith<$Res>  {
  factory $UserBookSummaryCopyWith(UserBookSummary value, $Res Function(UserBookSummary) _then) = _$UserBookSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String title, String author,@JsonKey(name: 'cover_url') String coverUrl, bool available
});




}
/// @nodoc
class _$UserBookSummaryCopyWithImpl<$Res>
    implements $UserBookSummaryCopyWith<$Res> {
  _$UserBookSummaryCopyWithImpl(this._self, this._then);

  final UserBookSummary _self;
  final $Res Function(UserBookSummary) _then;

/// Create a copy of UserBookSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? coverUrl = null,Object? available = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBookSummary].
extension UserBookSummaryPatterns on UserBookSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBookSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBookSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBookSummary value)  $default,){
final _that = this;
switch (_that) {
case _UserBookSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBookSummary value)?  $default,){
final _that = this;
switch (_that) {
case _UserBookSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String author, @JsonKey(name: 'cover_url')  String coverUrl,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBookSummary() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.coverUrl,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String author, @JsonKey(name: 'cover_url')  String coverUrl,  bool available)  $default,) {final _that = this;
switch (_that) {
case _UserBookSummary():
return $default(_that.id,_that.title,_that.author,_that.coverUrl,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String author, @JsonKey(name: 'cover_url')  String coverUrl,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _UserBookSummary() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.coverUrl,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBookSummary implements UserBookSummary {
  const _UserBookSummary({required this.id, required this.title, required this.author, @JsonKey(name: 'cover_url') required this.coverUrl, required this.available});
  factory _UserBookSummary.fromJson(Map<String, dynamic> json) => _$UserBookSummaryFromJson(json);

@override final  int id;
@override final  String title;
@override final  String author;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override final  bool available;

/// Create a copy of UserBookSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBookSummaryCopyWith<_UserBookSummary> get copyWith => __$UserBookSummaryCopyWithImpl<_UserBookSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBookSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBookSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,coverUrl,available);

@override
String toString() {
  return 'UserBookSummary(id: $id, title: $title, author: $author, coverUrl: $coverUrl, available: $available)';
}


}

/// @nodoc
abstract mixin class _$UserBookSummaryCopyWith<$Res> implements $UserBookSummaryCopyWith<$Res> {
  factory _$UserBookSummaryCopyWith(_UserBookSummary value, $Res Function(_UserBookSummary) _then) = __$UserBookSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String author,@JsonKey(name: 'cover_url') String coverUrl, bool available
});




}
/// @nodoc
class __$UserBookSummaryCopyWithImpl<$Res>
    implements _$UserBookSummaryCopyWith<$Res> {
  __$UserBookSummaryCopyWithImpl(this._self, this._then);

  final _UserBookSummary _self;
  final $Res Function(_UserBookSummary) _then;

/// Create a copy of UserBookSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? coverUrl = null,Object? available = null,}) {
  return _then(_UserBookSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ActivityItem {

 ActivityType get type; String get description; DateTime get timestamp;
/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityItemCopyWith<ActivityItem> get copyWith => _$ActivityItemCopyWithImpl<ActivityItem>(this as ActivityItem, _$identity);

  /// Serializes this ActivityItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityItem&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,description,timestamp);

@override
String toString() {
  return 'ActivityItem(type: $type, description: $description, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $ActivityItemCopyWith<$Res>  {
  factory $ActivityItemCopyWith(ActivityItem value, $Res Function(ActivityItem) _then) = _$ActivityItemCopyWithImpl;
@useResult
$Res call({
 ActivityType type, String description, DateTime timestamp
});




}
/// @nodoc
class _$ActivityItemCopyWithImpl<$Res>
    implements $ActivityItemCopyWith<$Res> {
  _$ActivityItemCopyWithImpl(this._self, this._then);

  final ActivityItem _self;
  final $Res Function(ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? description = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityItem].
extension ActivityItemPatterns on ActivityItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityItem value)  $default,){
final _that = this;
switch (_that) {
case _ActivityItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityItem value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityType type,  String description,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.type,_that.description,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityType type,  String description,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _ActivityItem():
return $default(_that.type,_that.description,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityType type,  String description,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.type,_that.description,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityItem implements ActivityItem {
  const _ActivityItem({required this.type, required this.description, required this.timestamp});
  factory _ActivityItem.fromJson(Map<String, dynamic> json) => _$ActivityItemFromJson(json);

@override final  ActivityType type;
@override final  String description;
@override final  DateTime timestamp;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityItemCopyWith<_ActivityItem> get copyWith => __$ActivityItemCopyWithImpl<_ActivityItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityItem&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,description,timestamp);

@override
String toString() {
  return 'ActivityItem(type: $type, description: $description, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ActivityItemCopyWith<$Res> implements $ActivityItemCopyWith<$Res> {
  factory _$ActivityItemCopyWith(_ActivityItem value, $Res Function(_ActivityItem) _then) = __$ActivityItemCopyWithImpl;
@override @useResult
$Res call({
 ActivityType type, String description, DateTime timestamp
});




}
/// @nodoc
class __$ActivityItemCopyWithImpl<$Res>
    implements _$ActivityItemCopyWith<$Res> {
  __$ActivityItemCopyWithImpl(this._self, this._then);

  final _ActivityItem _self;
  final $Res Function(_ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? description = null,Object? timestamp = null,}) {
  return _then(_ActivityItem(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
