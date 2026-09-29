// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, BookRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
    'genre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverUrlMeta = const VerificationMeta(
    'coverUrl',
  );
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
    'cover_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availableMeta = const VerificationMeta(
    'available',
  );
  @override
  late final GeneratedColumn<bool> available = GeneratedColumn<bool>(
    'available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("available" IN (0, 1))',
    ),
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<int> ownerId = GeneratedColumn<int>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    author,
    genre,
    description,
    coverUrl,
    available,
    ownerId,
    ownerName,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
        _genreMeta,
        genre.isAcceptableOrUnknown(data['genre']!, _genreMeta),
      );
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cover_url')) {
      context.handle(
        _coverUrlMeta,
        coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_coverUrlMeta);
    }
    if (data.containsKey('available')) {
      context.handle(
        _availableMeta,
        available.isAcceptableOrUnknown(data['available']!, _availableMeta),
      );
    } else if (isInserting) {
      context.missing(_availableMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      genre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      coverUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_url'],
      )!,
      available: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}available'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}owner_id'],
      )!,
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class BookRow extends DataClass implements Insertable<BookRow> {
  final int id;
  final String title;
  final String author;
  final String genre;
  final String description;
  final String coverUrl;
  final bool available;
  final int ownerId;
  final String ownerName;
  final DateTime createdAt;
  const BookRow({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.coverUrl,
    required this.available,
    required this.ownerId,
    required this.ownerName,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['genre'] = Variable<String>(genre);
    map['description'] = Variable<String>(description);
    map['cover_url'] = Variable<String>(coverUrl);
    map['available'] = Variable<bool>(available);
    map['owner_id'] = Variable<int>(ownerId);
    map['owner_name'] = Variable<String>(ownerName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      author: Value(author),
      genre: Value(genre),
      description: Value(description),
      coverUrl: Value(coverUrl),
      available: Value(available),
      ownerId: Value(ownerId),
      ownerName: Value(ownerName),
      createdAt: Value(createdAt),
    );
  }

  factory BookRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookRow(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      genre: serializer.fromJson<String>(json['genre']),
      description: serializer.fromJson<String>(json['description']),
      coverUrl: serializer.fromJson<String>(json['coverUrl']),
      available: serializer.fromJson<bool>(json['available']),
      ownerId: serializer.fromJson<int>(json['ownerId']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'genre': serializer.toJson<String>(genre),
      'description': serializer.toJson<String>(description),
      'coverUrl': serializer.toJson<String>(coverUrl),
      'available': serializer.toJson<bool>(available),
      'ownerId': serializer.toJson<int>(ownerId),
      'ownerName': serializer.toJson<String>(ownerName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BookRow copyWith({
    int? id,
    String? title,
    String? author,
    String? genre,
    String? description,
    String? coverUrl,
    bool? available,
    int? ownerId,
    String? ownerName,
    DateTime? createdAt,
  }) => BookRow(
    id: id ?? this.id,
    title: title ?? this.title,
    author: author ?? this.author,
    genre: genre ?? this.genre,
    description: description ?? this.description,
    coverUrl: coverUrl ?? this.coverUrl,
    available: available ?? this.available,
    ownerId: ownerId ?? this.ownerId,
    ownerName: ownerName ?? this.ownerName,
    createdAt: createdAt ?? this.createdAt,
  );
  BookRow copyWithCompanion(BooksCompanion data) {
    return BookRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      author: data.author.present ? data.author.value : this.author,
      genre: data.genre.present ? data.genre.value : this.genre,
      description: data.description.present
          ? data.description.value
          : this.description,
      coverUrl: data.coverUrl.present ? data.coverUrl.value : this.coverUrl,
      available: data.available.present ? data.available.value : this.available,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('genre: $genre, ')
          ..write('description: $description, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('available: $available, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerName: $ownerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    author,
    genre,
    description,
    coverUrl,
    available,
    ownerId,
    ownerName,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.genre == this.genre &&
          other.description == this.description &&
          other.coverUrl == this.coverUrl &&
          other.available == this.available &&
          other.ownerId == this.ownerId &&
          other.ownerName == this.ownerName &&
          other.createdAt == this.createdAt);
}

class BooksCompanion extends UpdateCompanion<BookRow> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> author;
  final Value<String> genre;
  final Value<String> description;
  final Value<String> coverUrl;
  final Value<bool> available;
  final Value<int> ownerId;
  final Value<String> ownerName;
  final Value<DateTime> createdAt;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.genre = const Value.absent(),
    this.description = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.available = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String author,
    required String genre,
    required String description,
    required String coverUrl,
    required bool available,
    required int ownerId,
    required String ownerName,
    required DateTime createdAt,
  }) : title = Value(title),
       author = Value(author),
       genre = Value(genre),
       description = Value(description),
       coverUrl = Value(coverUrl),
       available = Value(available),
       ownerId = Value(ownerId),
       ownerName = Value(ownerName),
       createdAt = Value(createdAt);
  static Insertable<BookRow> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? author,
    Expression<String>? genre,
    Expression<String>? description,
    Expression<String>? coverUrl,
    Expression<bool>? available,
    Expression<int>? ownerId,
    Expression<String>? ownerName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (genre != null) 'genre': genre,
      if (description != null) 'description': description,
      if (coverUrl != null) 'cover_url': coverUrl,
      if (available != null) 'available': available,
      if (ownerId != null) 'owner_id': ownerId,
      if (ownerName != null) 'owner_name': ownerName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BooksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? author,
    Value<String>? genre,
    Value<String>? description,
    Value<String>? coverUrl,
    Value<bool>? available,
    Value<int>? ownerId,
    Value<String>? ownerName,
    Value<DateTime>? createdAt,
  }) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      coverUrl: coverUrl ?? this.coverUrl,
      available: available ?? this.available,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    if (available.present) {
      map['available'] = Variable<bool>(available.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('genre: $genre, ')
          ..write('description: $description, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('available: $available, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerName: $ownerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RequestsTable extends Requests
    with TableInfo<$RequestsTable, BorrowRequestRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<int> bookId = GeneratedColumn<int>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookTitleMeta = const VerificationMeta(
    'bookTitle',
  );
  @override
  late final GeneratedColumn<String> bookTitle = GeneratedColumn<String>(
    'book_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requesterIdMeta = const VerificationMeta(
    'requesterId',
  );
  @override
  late final GeneratedColumn<int> requesterId = GeneratedColumn<int>(
    'requester_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requesterNameMeta = const VerificationMeta(
    'requesterName',
  );
  @override
  late final GeneratedColumn<String> requesterName = GeneratedColumn<String>(
    'requester_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<int> ownerId = GeneratedColumn<int>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerConfirmedMeta = const VerificationMeta(
    'ownerConfirmed',
  );
  @override
  late final GeneratedColumn<bool> ownerConfirmed = GeneratedColumn<bool>(
    'owner_confirmed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("owner_confirmed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _borrowerConfirmedMeta = const VerificationMeta(
    'borrowerConfirmed',
  );
  @override
  late final GeneratedColumn<bool> borrowerConfirmed = GeneratedColumn<bool>(
    'borrower_confirmed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("borrower_confirmed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bookId,
    bookTitle,
    requesterId,
    requesterName,
    message,
    ownerId,
    status,
    ownerConfirmed,
    borrowerConfirmed,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<BorrowRequestRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('book_title')) {
      context.handle(
        _bookTitleMeta,
        bookTitle.isAcceptableOrUnknown(data['book_title']!, _bookTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_bookTitleMeta);
    }
    if (data.containsKey('requester_id')) {
      context.handle(
        _requesterIdMeta,
        requesterId.isAcceptableOrUnknown(
          data['requester_id']!,
          _requesterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requesterIdMeta);
    }
    if (data.containsKey('requester_name')) {
      context.handle(
        _requesterNameMeta,
        requesterName.isAcceptableOrUnknown(
          data['requester_name']!,
          _requesterNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requesterNameMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('owner_confirmed')) {
      context.handle(
        _ownerConfirmedMeta,
        ownerConfirmed.isAcceptableOrUnknown(
          data['owner_confirmed']!,
          _ownerConfirmedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerConfirmedMeta);
    }
    if (data.containsKey('borrower_confirmed')) {
      context.handle(
        _borrowerConfirmedMeta,
        borrowerConfirmed.isAcceptableOrUnknown(
          data['borrower_confirmed']!,
          _borrowerConfirmedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_borrowerConfirmedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BorrowRequestRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BorrowRequestRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}book_id'],
      )!,
      bookTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_title'],
      )!,
      requesterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}requester_id'],
      )!,
      requesterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}requester_name'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}owner_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      ownerConfirmed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}owner_confirmed'],
      )!,
      borrowerConfirmed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}borrower_confirmed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RequestsTable createAlias(String alias) {
    return $RequestsTable(attachedDatabase, alias);
  }
}

class BorrowRequestRow extends DataClass
    implements Insertable<BorrowRequestRow> {
  final int id;
  final int bookId;
  final String bookTitle;
  final int requesterId;
  final String requesterName;
  final String message;
  final int ownerId;
  final String status;
  final bool ownerConfirmed;
  final bool borrowerConfirmed;
  final DateTime createdAt;
  const BorrowRequestRow({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.requesterId,
    required this.requesterName,
    required this.message,
    required this.ownerId,
    required this.status,
    required this.ownerConfirmed,
    required this.borrowerConfirmed,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(bookId);
    map['book_title'] = Variable<String>(bookTitle);
    map['requester_id'] = Variable<int>(requesterId);
    map['requester_name'] = Variable<String>(requesterName);
    map['message'] = Variable<String>(message);
    map['owner_id'] = Variable<int>(ownerId);
    map['status'] = Variable<String>(status);
    map['owner_confirmed'] = Variable<bool>(ownerConfirmed);
    map['borrower_confirmed'] = Variable<bool>(borrowerConfirmed);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RequestsCompanion toCompanion(bool nullToAbsent) {
    return RequestsCompanion(
      id: Value(id),
      bookId: Value(bookId),
      bookTitle: Value(bookTitle),
      requesterId: Value(requesterId),
      requesterName: Value(requesterName),
      message: Value(message),
      ownerId: Value(ownerId),
      status: Value(status),
      ownerConfirmed: Value(ownerConfirmed),
      borrowerConfirmed: Value(borrowerConfirmed),
      createdAt: Value(createdAt),
    );
  }

  factory BorrowRequestRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BorrowRequestRow(
      id: serializer.fromJson<int>(json['id']),
      bookId: serializer.fromJson<int>(json['bookId']),
      bookTitle: serializer.fromJson<String>(json['bookTitle']),
      requesterId: serializer.fromJson<int>(json['requesterId']),
      requesterName: serializer.fromJson<String>(json['requesterName']),
      message: serializer.fromJson<String>(json['message']),
      ownerId: serializer.fromJson<int>(json['ownerId']),
      status: serializer.fromJson<String>(json['status']),
      ownerConfirmed: serializer.fromJson<bool>(json['ownerConfirmed']),
      borrowerConfirmed: serializer.fromJson<bool>(json['borrowerConfirmed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookId': serializer.toJson<int>(bookId),
      'bookTitle': serializer.toJson<String>(bookTitle),
      'requesterId': serializer.toJson<int>(requesterId),
      'requesterName': serializer.toJson<String>(requesterName),
      'message': serializer.toJson<String>(message),
      'ownerId': serializer.toJson<int>(ownerId),
      'status': serializer.toJson<String>(status),
      'ownerConfirmed': serializer.toJson<bool>(ownerConfirmed),
      'borrowerConfirmed': serializer.toJson<bool>(borrowerConfirmed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BorrowRequestRow copyWith({
    int? id,
    int? bookId,
    String? bookTitle,
    int? requesterId,
    String? requesterName,
    String? message,
    int? ownerId,
    String? status,
    bool? ownerConfirmed,
    bool? borrowerConfirmed,
    DateTime? createdAt,
  }) => BorrowRequestRow(
    id: id ?? this.id,
    bookId: bookId ?? this.bookId,
    bookTitle: bookTitle ?? this.bookTitle,
    requesterId: requesterId ?? this.requesterId,
    requesterName: requesterName ?? this.requesterName,
    message: message ?? this.message,
    ownerId: ownerId ?? this.ownerId,
    status: status ?? this.status,
    ownerConfirmed: ownerConfirmed ?? this.ownerConfirmed,
    borrowerConfirmed: borrowerConfirmed ?? this.borrowerConfirmed,
    createdAt: createdAt ?? this.createdAt,
  );
  BorrowRequestRow copyWithCompanion(RequestsCompanion data) {
    return BorrowRequestRow(
      id: data.id.present ? data.id.value : this.id,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      bookTitle: data.bookTitle.present ? data.bookTitle.value : this.bookTitle,
      requesterId: data.requesterId.present
          ? data.requesterId.value
          : this.requesterId,
      requesterName: data.requesterName.present
          ? data.requesterName.value
          : this.requesterName,
      message: data.message.present ? data.message.value : this.message,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      status: data.status.present ? data.status.value : this.status,
      ownerConfirmed: data.ownerConfirmed.present
          ? data.ownerConfirmed.value
          : this.ownerConfirmed,
      borrowerConfirmed: data.borrowerConfirmed.present
          ? data.borrowerConfirmed.value
          : this.borrowerConfirmed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BorrowRequestRow(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('requesterId: $requesterId, ')
          ..write('requesterName: $requesterName, ')
          ..write('message: $message, ')
          ..write('ownerId: $ownerId, ')
          ..write('status: $status, ')
          ..write('ownerConfirmed: $ownerConfirmed, ')
          ..write('borrowerConfirmed: $borrowerConfirmed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    bookId,
    bookTitle,
    requesterId,
    requesterName,
    message,
    ownerId,
    status,
    ownerConfirmed,
    borrowerConfirmed,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BorrowRequestRow &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.bookTitle == this.bookTitle &&
          other.requesterId == this.requesterId &&
          other.requesterName == this.requesterName &&
          other.message == this.message &&
          other.ownerId == this.ownerId &&
          other.status == this.status &&
          other.ownerConfirmed == this.ownerConfirmed &&
          other.borrowerConfirmed == this.borrowerConfirmed &&
          other.createdAt == this.createdAt);
}

class RequestsCompanion extends UpdateCompanion<BorrowRequestRow> {
  final Value<int> id;
  final Value<int> bookId;
  final Value<String> bookTitle;
  final Value<int> requesterId;
  final Value<String> requesterName;
  final Value<String> message;
  final Value<int> ownerId;
  final Value<String> status;
  final Value<bool> ownerConfirmed;
  final Value<bool> borrowerConfirmed;
  final Value<DateTime> createdAt;
  const RequestsCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.bookTitle = const Value.absent(),
    this.requesterId = const Value.absent(),
    this.requesterName = const Value.absent(),
    this.message = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.status = const Value.absent(),
    this.ownerConfirmed = const Value.absent(),
    this.borrowerConfirmed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RequestsCompanion.insert({
    this.id = const Value.absent(),
    required int bookId,
    required String bookTitle,
    required int requesterId,
    required String requesterName,
    required String message,
    required int ownerId,
    required String status,
    required bool ownerConfirmed,
    required bool borrowerConfirmed,
    required DateTime createdAt,
  }) : bookId = Value(bookId),
       bookTitle = Value(bookTitle),
       requesterId = Value(requesterId),
       requesterName = Value(requesterName),
       message = Value(message),
       ownerId = Value(ownerId),
       status = Value(status),
       ownerConfirmed = Value(ownerConfirmed),
       borrowerConfirmed = Value(borrowerConfirmed),
       createdAt = Value(createdAt);
  static Insertable<BorrowRequestRow> custom({
    Expression<int>? id,
    Expression<int>? bookId,
    Expression<String>? bookTitle,
    Expression<int>? requesterId,
    Expression<String>? requesterName,
    Expression<String>? message,
    Expression<int>? ownerId,
    Expression<String>? status,
    Expression<bool>? ownerConfirmed,
    Expression<bool>? borrowerConfirmed,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (bookTitle != null) 'book_title': bookTitle,
      if (requesterId != null) 'requester_id': requesterId,
      if (requesterName != null) 'requester_name': requesterName,
      if (message != null) 'message': message,
      if (ownerId != null) 'owner_id': ownerId,
      if (status != null) 'status': status,
      if (ownerConfirmed != null) 'owner_confirmed': ownerConfirmed,
      if (borrowerConfirmed != null) 'borrower_confirmed': borrowerConfirmed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RequestsCompanion copyWith({
    Value<int>? id,
    Value<int>? bookId,
    Value<String>? bookTitle,
    Value<int>? requesterId,
    Value<String>? requesterName,
    Value<String>? message,
    Value<int>? ownerId,
    Value<String>? status,
    Value<bool>? ownerConfirmed,
    Value<bool>? borrowerConfirmed,
    Value<DateTime>? createdAt,
  }) {
    return RequestsCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      bookTitle: bookTitle ?? this.bookTitle,
      requesterId: requesterId ?? this.requesterId,
      requesterName: requesterName ?? this.requesterName,
      message: message ?? this.message,
      ownerId: ownerId ?? this.ownerId,
      status: status ?? this.status,
      ownerConfirmed: ownerConfirmed ?? this.ownerConfirmed,
      borrowerConfirmed: borrowerConfirmed ?? this.borrowerConfirmed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (bookTitle.present) {
      map['book_title'] = Variable<String>(bookTitle.value);
    }
    if (requesterId.present) {
      map['requester_id'] = Variable<int>(requesterId.value);
    }
    if (requesterName.present) {
      map['requester_name'] = Variable<String>(requesterName.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (ownerConfirmed.present) {
      map['owner_confirmed'] = Variable<bool>(ownerConfirmed.value);
    }
    if (borrowerConfirmed.present) {
      map['borrower_confirmed'] = Variable<bool>(borrowerConfirmed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestsCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('requesterId: $requesterId, ')
          ..write('requesterName: $requesterName, ')
          ..write('message: $message, ')
          ..write('ownerId: $ownerId, ')
          ..write('status: $status, ')
          ..write('ownerConfirmed: $ownerConfirmed, ')
          ..write('borrowerConfirmed: $borrowerConfirmed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $RequestsTable requests = $RequestsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books, requests];
}

typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      Value<int> id,
      required String title,
      required String author,
      required String genre,
      required String description,
      required String coverUrl,
      required bool available,
      required int ownerId,
      required String ownerName,
      required DateTime createdAt,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> author,
      Value<String> genre,
      Value<String> description,
      Value<String> coverUrl,
      Value<bool> available,
      Value<int> ownerId,
      Value<String> ownerName,
      Value<DateTime> createdAt,
    });

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get genre =>
      $composableBuilder(column: $table.genre, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverUrl =>
      $composableBuilder(column: $table.coverUrl, builder: (column) => column);

  GeneratedColumn<bool> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumn<int> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          BookRow,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (BookRow, BaseReferences<_$AppDatabase, $BooksTable, BookRow>),
          BookRow,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> genre = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> coverUrl = const Value.absent(),
                Value<bool> available = const Value.absent(),
                Value<int> ownerId = const Value.absent(),
                Value<String> ownerName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BooksCompanion(
                id: id,
                title: title,
                author: author,
                genre: genre,
                description: description,
                coverUrl: coverUrl,
                available: available,
                ownerId: ownerId,
                ownerName: ownerName,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String author,
                required String genre,
                required String description,
                required String coverUrl,
                required bool available,
                required int ownerId,
                required String ownerName,
                required DateTime createdAt,
              }) => BooksCompanion.insert(
                id: id,
                title: title,
                author: author,
                genre: genre,
                description: description,
                coverUrl: coverUrl,
                available: available,
                ownerId: ownerId,
                ownerName: ownerName,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      BookRow,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (BookRow, BaseReferences<_$AppDatabase, $BooksTable, BookRow>),
      BookRow,
      PrefetchHooks Function()
    >;
typedef $$RequestsTableCreateCompanionBuilder =
    RequestsCompanion Function({
      Value<int> id,
      required int bookId,
      required String bookTitle,
      required int requesterId,
      required String requesterName,
      required String message,
      required int ownerId,
      required String status,
      required bool ownerConfirmed,
      required bool borrowerConfirmed,
      required DateTime createdAt,
    });
typedef $$RequestsTableUpdateCompanionBuilder =
    RequestsCompanion Function({
      Value<int> id,
      Value<int> bookId,
      Value<String> bookTitle,
      Value<int> requesterId,
      Value<String> requesterName,
      Value<String> message,
      Value<int> ownerId,
      Value<String> status,
      Value<bool> ownerConfirmed,
      Value<bool> borrowerConfirmed,
      Value<DateTime> createdAt,
    });

class $$RequestsTableFilterComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bookId => $composableBuilder(
    column: $table.bookId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookTitle => $composableBuilder(
    column: $table.bookTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requesterId => $composableBuilder(
    column: $table.requesterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requesterName => $composableBuilder(
    column: $table.requesterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ownerConfirmed => $composableBuilder(
    column: $table.ownerConfirmed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get borrowerConfirmed => $composableBuilder(
    column: $table.borrowerConfirmed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bookId => $composableBuilder(
    column: $table.bookId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookTitle => $composableBuilder(
    column: $table.bookTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requesterId => $composableBuilder(
    column: $table.requesterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requesterName => $composableBuilder(
    column: $table.requesterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ownerConfirmed => $composableBuilder(
    column: $table.ownerConfirmed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get borrowerConfirmed => $composableBuilder(
    column: $table.borrowerConfirmed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestsTable> {
  $$RequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get bookId =>
      $composableBuilder(column: $table.bookId, builder: (column) => column);

  GeneratedColumn<String> get bookTitle =>
      $composableBuilder(column: $table.bookTitle, builder: (column) => column);

  GeneratedColumn<int> get requesterId => $composableBuilder(
    column: $table.requesterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requesterName => $composableBuilder(
    column: $table.requesterName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<int> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get ownerConfirmed => $composableBuilder(
    column: $table.ownerConfirmed,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get borrowerConfirmed => $composableBuilder(
    column: $table.borrowerConfirmed,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestsTable,
          BorrowRequestRow,
          $$RequestsTableFilterComposer,
          $$RequestsTableOrderingComposer,
          $$RequestsTableAnnotationComposer,
          $$RequestsTableCreateCompanionBuilder,
          $$RequestsTableUpdateCompanionBuilder,
          (
            BorrowRequestRow,
            BaseReferences<_$AppDatabase, $RequestsTable, BorrowRequestRow>,
          ),
          BorrowRequestRow,
          PrefetchHooks Function()
        > {
  $$RequestsTableTableManager(_$AppDatabase db, $RequestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> bookId = const Value.absent(),
                Value<String> bookTitle = const Value.absent(),
                Value<int> requesterId = const Value.absent(),
                Value<String> requesterName = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<int> ownerId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> ownerConfirmed = const Value.absent(),
                Value<bool> borrowerConfirmed = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RequestsCompanion(
                id: id,
                bookId: bookId,
                bookTitle: bookTitle,
                requesterId: requesterId,
                requesterName: requesterName,
                message: message,
                ownerId: ownerId,
                status: status,
                ownerConfirmed: ownerConfirmed,
                borrowerConfirmed: borrowerConfirmed,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int bookId,
                required String bookTitle,
                required int requesterId,
                required String requesterName,
                required String message,
                required int ownerId,
                required String status,
                required bool ownerConfirmed,
                required bool borrowerConfirmed,
                required DateTime createdAt,
              }) => RequestsCompanion.insert(
                id: id,
                bookId: bookId,
                bookTitle: bookTitle,
                requesterId: requesterId,
                requesterName: requesterName,
                message: message,
                ownerId: ownerId,
                status: status,
                ownerConfirmed: ownerConfirmed,
                borrowerConfirmed: borrowerConfirmed,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestsTable,
      BorrowRequestRow,
      $$RequestsTableFilterComposer,
      $$RequestsTableOrderingComposer,
      $$RequestsTableAnnotationComposer,
      $$RequestsTableCreateCompanionBuilder,
      $$RequestsTableUpdateCompanionBuilder,
      (
        BorrowRequestRow,
        BaseReferences<_$AppDatabase, $RequestsTable, BorrowRequestRow>,
      ),
      BorrowRequestRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$RequestsTableTableManager get requests =>
      $$RequestsTableTableManager(_db, _db.requests);
}
