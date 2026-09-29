// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

 int get id; String get title; String get author; String get genre; String get description;@JsonKey(name: 'cover_url') String get coverUrl; bool get available;@JsonKey(name: 'owner_id') int get ownerId;@JsonKey(name: 'owner_name') String get ownerName;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.available, available) || other.available == available)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,genre,description,coverUrl,available,ownerId,ownerName,createdAt);

@override
String toString() {
  return 'Book(id: $id, title: $title, author: $author, genre: $genre, description: $description, coverUrl: $coverUrl, available: $available, ownerId: $ownerId, ownerName: $ownerName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 int id, String title, String author, String genre, String description,@JsonKey(name: 'cover_url') String coverUrl, bool available,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'owner_name') String ownerName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? genre = null,Object? description = null,Object? coverUrl = null,Object? available = null,Object? ownerId = null,Object? ownerName = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String author,  String genre,  String description, @JsonKey(name: 'cover_url')  String coverUrl,  bool available, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'owner_name')  String ownerName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.genre,_that.description,_that.coverUrl,_that.available,_that.ownerId,_that.ownerName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String author,  String genre,  String description, @JsonKey(name: 'cover_url')  String coverUrl,  bool available, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'owner_name')  String ownerName, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.author,_that.genre,_that.description,_that.coverUrl,_that.available,_that.ownerId,_that.ownerName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String author,  String genre,  String description, @JsonKey(name: 'cover_url')  String coverUrl,  bool available, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'owner_name')  String ownerName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.genre,_that.description,_that.coverUrl,_that.available,_that.ownerId,_that.ownerName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book implements Book {
  const _Book({required this.id, required this.title, required this.author, required this.genre, required this.description, @JsonKey(name: 'cover_url') required this.coverUrl, required this.available, @JsonKey(name: 'owner_id') required this.ownerId, @JsonKey(name: 'owner_name') required this.ownerName, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  int id;
@override final  String title;
@override final  String author;
@override final  String genre;
@override final  String description;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override final  bool available;
@override@JsonKey(name: 'owner_id') final  int ownerId;
@override@JsonKey(name: 'owner_name') final  String ownerName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.available, available) || other.available == available)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,genre,description,coverUrl,available,ownerId,ownerName,createdAt);

@override
String toString() {
  return 'Book(id: $id, title: $title, author: $author, genre: $genre, description: $description, coverUrl: $coverUrl, available: $available, ownerId: $ownerId, ownerName: $ownerName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String author, String genre, String description,@JsonKey(name: 'cover_url') String coverUrl, bool available,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'owner_name') String ownerName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? genre = null,Object? description = null,Object? coverUrl = null,Object? available = null,Object? ownerId = null,Object? ownerName = null,Object? createdAt = null,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$BookPage {

 List<Book> get books;@JsonKey(name: 'next_cursor') DateTime? get nextCursor;
/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookPageCopyWith<BookPage> get copyWith => _$BookPageCopyWithImpl<BookPage>(this as BookPage, _$identity);

  /// Serializes this BookPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookPage&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(books),nextCursor);

@override
String toString() {
  return 'BookPage(books: $books, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $BookPageCopyWith<$Res>  {
  factory $BookPageCopyWith(BookPage value, $Res Function(BookPage) _then) = _$BookPageCopyWithImpl;
@useResult
$Res call({
 List<Book> books,@JsonKey(name: 'next_cursor') DateTime? nextCursor
});




}
/// @nodoc
class _$BookPageCopyWithImpl<$Res>
    implements $BookPageCopyWith<$Res> {
  _$BookPageCopyWithImpl(this._self, this._then);

  final BookPage _self;
  final $Res Function(BookPage) _then;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? books = null,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookPage].
extension BookPagePatterns on BookPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookPage value)  $default,){
final _that = this;
switch (_that) {
case _BookPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookPage value)?  $default,){
final _that = this;
switch (_that) {
case _BookPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Book> books, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookPage() when $default != null:
return $default(_that.books,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Book> books, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _BookPage():
return $default(_that.books,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Book> books, @JsonKey(name: 'next_cursor')  DateTime? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _BookPage() when $default != null:
return $default(_that.books,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookPage implements BookPage {
  const _BookPage({required  List<Book> books, @JsonKey(name: 'next_cursor') this.nextCursor}): _books = books;
  factory _BookPage.fromJson(Map<String, dynamic> json) => _$BookPageFromJson(json);

 final  List<Book> _books;
@override List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override@JsonKey(name: 'next_cursor') final  DateTime? nextCursor;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookPageCopyWith<_BookPage> get copyWith => __$BookPageCopyWithImpl<_BookPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookPage&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books),nextCursor);

@override
String toString() {
  return 'BookPage(books: $books, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$BookPageCopyWith<$Res> implements $BookPageCopyWith<$Res> {
  factory _$BookPageCopyWith(_BookPage value, $Res Function(_BookPage) _then) = __$BookPageCopyWithImpl;
@override @useResult
$Res call({
 List<Book> books,@JsonKey(name: 'next_cursor') DateTime? nextCursor
});




}
/// @nodoc
class __$BookPageCopyWithImpl<$Res>
    implements _$BookPageCopyWith<$Res> {
  __$BookPageCopyWithImpl(this._self, this._then);

  final _BookPage _self;
  final $Res Function(_BookPage) _then;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? books = null,Object? nextCursor = freezed,}) {
  return _then(_BookPage(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
