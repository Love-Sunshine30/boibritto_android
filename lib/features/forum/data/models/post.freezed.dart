// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {

 int get id;@JsonKey(name: 'book_id') int get bookId;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'user_name') String get userName; String get body; bool get edited;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.body, body) || other.body == body)&&(identical(other.edited, edited) || other.edited == edited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,userName,body,edited,createdAt);

@override
String toString() {
  return 'Post(id: $id, bookId: $bookId, userId: $userId, userName: $userName, body: $body, edited: $edited, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'user_name') String userName, String body, bool edited,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? userId = null,Object? userName = null,Object? body = null,Object? edited = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,edited: null == edited ? _self.edited : edited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Post value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Post value)  $default,){
final _that = this;
switch (_that) {
case _Post():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Post value)?  $default,){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'user_name')  String userName,  String body,  bool edited, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.bookId,_that.userId,_that.userName,_that.body,_that.edited,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'user_name')  String userName,  String body,  bool edited, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.id,_that.bookId,_that.userId,_that.userName,_that.body,_that.edited,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'user_name')  String userName,  String body,  bool edited, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.bookId,_that.userId,_that.userName,_that.body,_that.edited,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({required this.id, @JsonKey(name: 'book_id') required this.bookId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'user_name') required this.userName, required this.body, required this.edited, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override final  int id;
@override@JsonKey(name: 'book_id') final  int bookId;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'user_name') final  String userName;
@override final  String body;
@override final  bool edited;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.body, body) || other.body == body)&&(identical(other.edited, edited) || other.edited == edited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,userName,body,edited,createdAt);

@override
String toString() {
  return 'Post(id: $id, bookId: $bookId, userId: $userId, userName: $userName, body: $body, edited: $edited, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'user_name') String userName, String body, bool edited,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? userId = null,Object? userName = null,Object? body = null,Object? edited = null,Object? createdAt = null,}) {
  return _then(_Post(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,edited: null == edited ? _self.edited : edited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ForumPage {

 List<Post> get posts;@JsonKey(name: 'next_cursor') DateTime? get nextCursor;
/// Create a copy of ForumPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumPageCopyWith<ForumPage> get copyWith => _$ForumPageCopyWithImpl<ForumPage>(this as ForumPage, _$identity);

  /// Serializes this ForumPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumPage&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),nextCursor);

@override
String toString() {
  return 'ForumPage(posts: $posts, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $ForumPageCopyWith<$Res>  {
  factory $ForumPageCopyWith(ForumPage value, $Res Function(ForumPage) _then) = _$ForumPageCopyWithImpl;
@useResult
$Res call({
 List<Post> posts,@JsonKey(name: 'next_cursor') DateTime? nextCursor
});




}
/// @nodoc
class _$ForumPageCopyWithImpl<$Res>
    implements $ForumPageCopyWith<$Res> {
  _$ForumPageCopyWithImpl(this._self, this._then);

  final ForumPage _self;
  final $Res Function(ForumPage) _then;

/// Create a copy of ForumPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumPage].
extension ForumPagePatterns on ForumPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumPage value)  $default,){
final _that = this;
switch (_that) {
case _ForumPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumPage value)?  $default,){
final _that = this;
switch (_that) {
case _ForumPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Post> posts, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumPage() when $default != null:
return $default(_that.posts,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Post> posts, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _ForumPage():
return $default(_that.posts,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Post> posts, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _ForumPage() when $default != null:
return $default(_that.posts,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumPage implements ForumPage {
  const _ForumPage({required List<Post> posts, @JsonKey(name: 'next_cursor') this.nextCursor}): _posts = posts;
  factory _ForumPage.fromJson(Map<String, dynamic> json) => _$ForumPageFromJson(json);

 final  List<Post> _posts;
@override List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey(name: 'next_cursor') final  DateTime? nextCursor;

/// Create a copy of ForumPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumPageCopyWith<_ForumPage> get copyWith => __$ForumPageCopyWithImpl<_ForumPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumPage&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),nextCursor);

@override
String toString() {
  return 'ForumPage(posts: $posts, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$ForumPageCopyWith<$Res> implements $ForumPageCopyWith<$Res> {
  factory _$ForumPageCopyWith(_ForumPage value, $Res Function(_ForumPage) _then) = __$ForumPageCopyWithImpl;
@override @useResult
$Res call({
 List<Post> posts,@JsonKey(name: 'next_cursor') DateTime? nextCursor
});




}
/// @nodoc
class __$ForumPageCopyWithImpl<$Res>
    implements _$ForumPageCopyWith<$Res> {
  __$ForumPageCopyWithImpl(this._self, this._then);

  final _ForumPage _self;
  final $Res Function(_ForumPage) _then;

/// Create a copy of ForumPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? nextCursor = freezed,}) {
  return _then(_ForumPage(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
