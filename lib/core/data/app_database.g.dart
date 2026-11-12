// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _openingBalanceMinorMeta =
      const VerificationMeta('openingBalanceMinor');
  @override
  late final GeneratedColumn<int> openingBalanceMinor = GeneratedColumn<int>(
    'opening_balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    kind,
    currencyCode,
    openingBalanceMinor,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('opening_balance_minor')) {
      context.handle(
        _openingBalanceMinorMeta,
        openingBalanceMinor.isAcceptableOrUnknown(
          data['opening_balance_minor']!,
          _openingBalanceMinorMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      openingBalanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance_minor'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final String id;
  final String name;
  final String kind;
  final String currencyCode;
  final int openingBalanceMinor;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Account({
    required this.id,
    required this.name,
    required this.kind,
    required this.currencyCode,
    required this.openingBalanceMinor,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['kind'] = Variable<String>(kind);
    map['currency_code'] = Variable<String>(currencyCode);
    map['opening_balance_minor'] = Variable<int>(openingBalanceMinor);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      kind: Value(kind),
      currencyCode: Value(currencyCode),
      openingBalanceMinor: Value(openingBalanceMinor),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kind: serializer.fromJson<String>(json['kind']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      openingBalanceMinor: serializer.fromJson<int>(
        json['openingBalanceMinor'],
      ),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<String>(kind),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'openingBalanceMinor': serializer.toJson<int>(openingBalanceMinor),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Account copyWith({
    String? id,
    String? name,
    String? kind,
    String? currencyCode,
    int? openingBalanceMinor,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Account(
    id: id ?? this.id,
    name: name ?? this.name,
    kind: kind ?? this.kind,
    currencyCode: currencyCode ?? this.currencyCode,
    openingBalanceMinor: openingBalanceMinor ?? this.openingBalanceMinor,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      openingBalanceMinor: data.openingBalanceMinor.present
          ? data.openingBalanceMinor.value
          : this.openingBalanceMinor,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('openingBalanceMinor: $openingBalanceMinor, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    kind,
    currencyCode,
    openingBalanceMinor,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.currencyCode == this.currencyCode &&
          other.openingBalanceMinor == this.openingBalanceMinor &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> kind;
  final Value<String> currencyCode;
  final Value<int> openingBalanceMinor;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.openingBalanceMinor = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String name,
    required String kind,
    this.currencyCode = const Value.absent(),
    this.openingBalanceMinor = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       kind = Value(kind),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Account> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<String>? currencyCode,
    Expression<int>? openingBalanceMinor,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (openingBalanceMinor != null)
        'opening_balance_minor': openingBalanceMinor,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? kind,
    Value<String>? currencyCode,
    Value<int>? openingBalanceMinor,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      currencyCode: currencyCode ?? this.currencyCode,
      openingBalanceMinor: openingBalanceMinor ?? this.openingBalanceMinor,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (openingBalanceMinor.present) {
      map['opening_balance_minor'] = Variable<int>(openingBalanceMinor.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('openingBalanceMinor: $openingBalanceMinor, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('expense'),
  );
  static const VerificationMeta _parentCategoryIdMeta = const VerificationMeta(
    'parentCategoryId',
  );
  @override
  late final GeneratedColumn<String> parentCategoryId = GeneratedColumn<String>(
    'parent_category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _isBuiltinMeta = const VerificationMeta(
    'isBuiltin',
  );
  @override
  late final GeneratedColumn<bool> isBuiltin = GeneratedColumn<bool>(
    'is_builtin',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_builtin" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    kind,
    parentCategoryId,
    isBuiltin,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('parent_category_id')) {
      context.handle(
        _parentCategoryIdMeta,
        parentCategoryId.isAcceptableOrUnknown(
          data['parent_category_id']!,
          _parentCategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('is_builtin')) {
      context.handle(
        _isBuiltinMeta,
        isBuiltin.isAcceptableOrUnknown(data['is_builtin']!, _isBuiltinMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      parentCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_category_id'],
      ),
      isBuiltin: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_builtin'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String name;
  final String kind;
  final String? parentCategoryId;
  final bool isBuiltin;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Category({
    required this.id,
    required this.name,
    required this.kind,
    this.parentCategoryId,
    required this.isBuiltin,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['kind'] = Variable<String>(kind);
    if (!nullToAbsent || parentCategoryId != null) {
      map['parent_category_id'] = Variable<String>(parentCategoryId);
    }
    map['is_builtin'] = Variable<bool>(isBuiltin);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      kind: Value(kind),
      parentCategoryId: parentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCategoryId),
      isBuiltin: Value(isBuiltin),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kind: serializer.fromJson<String>(json['kind']),
      parentCategoryId: serializer.fromJson<String?>(json['parentCategoryId']),
      isBuiltin: serializer.fromJson<bool>(json['isBuiltin']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<String>(kind),
      'parentCategoryId': serializer.toJson<String?>(parentCategoryId),
      'isBuiltin': serializer.toJson<bool>(isBuiltin),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Category copyWith({
    String? id,
    String? name,
    String? kind,
    Value<String?> parentCategoryId = const Value.absent(),
    bool? isBuiltin,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    kind: kind ?? this.kind,
    parentCategoryId: parentCategoryId.present
        ? parentCategoryId.value
        : this.parentCategoryId,
    isBuiltin: isBuiltin ?? this.isBuiltin,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      parentCategoryId: data.parentCategoryId.present
          ? data.parentCategoryId.value
          : this.parentCategoryId,
      isBuiltin: data.isBuiltin.present ? data.isBuiltin.value : this.isBuiltin,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('isBuiltin: $isBuiltin, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    kind,
    parentCategoryId,
    isBuiltin,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.parentCategoryId == this.parentCategoryId &&
          other.isBuiltin == this.isBuiltin &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> kind;
  final Value<String?> parentCategoryId;
  final Value<bool> isBuiltin;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.isBuiltin = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.kind = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.isBuiltin = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<String>? parentCategoryId,
    Expression<bool>? isBuiltin,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      if (isBuiltin != null) 'is_builtin': isBuiltin,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? kind,
    Value<String?>? parentCategoryId,
    Value<bool>? isBuiltin,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      isBuiltin: isBuiltin ?? this.isBuiltin,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (parentCategoryId.present) {
      map['parent_category_id'] = Variable<String>(parentCategoryId.value);
    }
    if (isBuiltin.present) {
      map['is_builtin'] = Variable<bool>(isBuiltin.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('isBuiltin: $isBuiltin, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubcategoriesTable extends Subcategories
    with TableInfo<$SubcategoriesTable, Subcategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubcategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    name,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subcategories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subcategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subcategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subcategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SubcategoriesTable createAlias(String alias) {
    return $SubcategoriesTable(attachedDatabase, alias);
  }
}

class Subcategory extends DataClass implements Insertable<Subcategory> {
  final String id;
  final String categoryId;
  final String name;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Subcategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category_id'] = Variable<String>(categoryId);
    map['name'] = Variable<String>(name);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubcategoriesCompanion toCompanion(bool nullToAbsent) {
    return SubcategoriesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Subcategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subcategory(
      id: serializer.fromJson<String>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categoryId': serializer.toJson<String>(categoryId),
      'name': serializer.toJson<String>(name),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Subcategory copyWith({
    String? id,
    String? categoryId,
    String? name,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Subcategory(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Subcategory copyWithCompanion(SubcategoriesCompanion data) {
    return Subcategory(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subcategory(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, name, isArchived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subcategory &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubcategoriesCompanion extends UpdateCompanion<Subcategory> {
  final Value<String> id;
  final Value<String> categoryId;
  final Value<String> name;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SubcategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubcategoriesCompanion.insert({
    required String id,
    required String categoryId,
    required String name,
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       categoryId = Value(categoryId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Subcategory> custom({
    Expression<String>? id,
    Expression<String>? categoryId,
    Expression<String>? name,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubcategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? categoryId,
    Value<String>? name,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SubcategoriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubcategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentMethodsTable extends PaymentMethods
    with TableInfo<$PaymentMethodsTable, PaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 80,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    accountId,
    isActive,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_methods';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentMethod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentMethod(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PaymentMethodsTable createAlias(String alias) {
    return $PaymentMethodsTable(attachedDatabase, alias);
  }
}

class PaymentMethod extends DataClass implements Insertable<PaymentMethod> {
  final String id;
  final String name;
  final String? accountId;
  final bool isActive;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PaymentMethod({
    required this.id,
    required this.name,
    this.accountId,
    required this.isActive,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PaymentMethodsCompanion toCompanion(bool nullToAbsent) {
    return PaymentMethodsCompanion(
      id: Value(id),
      name: Value(name),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      isActive: Value(isActive),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PaymentMethod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentMethod(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'accountId': serializer.toJson<String?>(accountId),
      'isActive': serializer.toJson<bool>(isActive),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PaymentMethod copyWith({
    String? id,
    String? name,
    Value<String?> accountId = const Value.absent(),
    bool? isActive,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PaymentMethod(
    id: id ?? this.id,
    name: name ?? this.name,
    accountId: accountId.present ? accountId.value : this.accountId,
    isActive: isActive ?? this.isActive,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PaymentMethod copyWithCompanion(PaymentMethodsCompanion data) {
    return PaymentMethod(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethod(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('accountId: $accountId, ')
          ..write('isActive: $isActive, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    accountId,
    isActive,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentMethod &&
          other.id == this.id &&
          other.name == this.name &&
          other.accountId == this.accountId &&
          other.isActive == this.isActive &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PaymentMethodsCompanion extends UpdateCompanion<PaymentMethod> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> accountId;
  final Value<bool> isActive;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaymentMethodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.accountId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentMethodsCompanion.insert({
    required String id,
    required String name,
    this.accountId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PaymentMethod> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? accountId,
    Expression<bool>? isActive,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (accountId != null) 'account_id': accountId,
      if (isActive != null) 'is_active': isActive,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentMethodsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? accountId,
    Value<bool>? isActive,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PaymentMethodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      accountId: accountId ?? this.accountId,
      isActive: isActive ?? this.isActive,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentMethodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('accountId: $accountId, ')
          ..write('isActive: $isActive, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredLocalOffsetMinutesMeta =
      const VerificationMeta('occurredLocalOffsetMinutes');
  @override
  late final GeneratedColumn<int> occurredLocalOffsetMinutes =
      GeneratedColumn<int>(
        'occurred_local_offset_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _occurredTimezoneIdMeta =
      const VerificationMeta('occurredTimezoneId');
  @override
  late final GeneratedColumn<String> occurredTimezoneId =
      GeneratedColumn<String>(
        'occurred_timezone_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _localDateKeyMeta = const VerificationMeta(
    'localDateKey',
  );
  @override
  late final GeneratedColumn<String> localDateKey = GeneratedColumn<String>(
    'local_date_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
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
  static const VerificationMeta _verificationMeta = const VerificationMeta(
    'verification',
  );
  @override
  late final GeneratedColumn<String> verification = GeneratedColumn<String>(
    'verification',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('confirmed'),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _sourceAccountIdMeta = const VerificationMeta(
    'sourceAccountId',
  );
  @override
  late final GeneratedColumn<String> sourceAccountId = GeneratedColumn<String>(
    'source_account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _destinationAccountIdMeta =
      const VerificationMeta('destinationAccountId');
  @override
  late final GeneratedColumn<String> destinationAccountId =
      GeneratedColumn<String>(
        'destination_account_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _subcategoryIdMeta = const VerificationMeta(
    'subcategoryId',
  );
  @override
  late final GeneratedColumn<String> subcategoryId = GeneratedColumn<String>(
    'subcategory_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subcategories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _paymentMethodIdMeta = const VerificationMeta(
    'paymentMethodId',
  );
  @override
  late final GeneratedColumn<String> paymentMethodId = GeneratedColumn<String>(
    'payment_method_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payment_methods (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _externalReferenceMeta = const VerificationMeta(
    'externalReference',
  );
  @override
  late final GeneratedColumn<String> externalReference =
      GeneratedColumn<String>(
        'external_reference',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalSourceIdMeta = const VerificationMeta(
    'originalSourceId',
  );
  @override
  late final GeneratedColumn<String> originalSourceId = GeneratedColumn<String>(
    'original_source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMetadataJsonMeta =
      const VerificationMeta('sourceMetadataJson');
  @override
  late final GeneratedColumn<String> sourceMetadataJson =
      GeneratedColumn<String>(
        'source_metadata_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _expenseBehaviorMeta = const VerificationMeta(
    'expenseBehavior',
  );
  @override
  late final GeneratedColumn<String> expenseBehavior = GeneratedColumn<String>(
    'expense_behavior',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allocationGroupMeta = const VerificationMeta(
    'allocationGroup',
  );
  @override
  late final GeneratedColumn<String> allocationGroup = GeneratedColumn<String>(
    'allocation_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allocationGroupNameMeta =
      const VerificationMeta('allocationGroupName');
  @override
  late final GeneratedColumn<String> allocationGroupName =
      GeneratedColumn<String>(
        'allocation_group_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    amountMinor,
    currencyCode,
    occurredAt,
    occurredLocalOffsetMinutes,
    occurredTimezoneId,
    localDateKey,
    status,
    verification,
    source,
    accountId,
    sourceAccountId,
    destinationAccountId,
    categoryId,
    subcategoryId,
    paymentMethodId,
    description,
    externalReference,
    createdAt,
    updatedAt,
    deletedAt,
    originalSourceId,
    sourceMetadataJson,
    expenseBehavior,
    allocationGroup,
    allocationGroupName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('occurred_local_offset_minutes')) {
      context.handle(
        _occurredLocalOffsetMinutesMeta,
        occurredLocalOffsetMinutes.isAcceptableOrUnknown(
          data['occurred_local_offset_minutes']!,
          _occurredLocalOffsetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('occurred_timezone_id')) {
      context.handle(
        _occurredTimezoneIdMeta,
        occurredTimezoneId.isAcceptableOrUnknown(
          data['occurred_timezone_id']!,
          _occurredTimezoneIdMeta,
        ),
      );
    }
    if (data.containsKey('local_date_key')) {
      context.handle(
        _localDateKeyMeta,
        localDateKey.isAcceptableOrUnknown(
          data['local_date_key']!,
          _localDateKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localDateKeyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('verification')) {
      context.handle(
        _verificationMeta,
        verification.isAcceptableOrUnknown(
          data['verification']!,
          _verificationMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('source_account_id')) {
      context.handle(
        _sourceAccountIdMeta,
        sourceAccountId.isAcceptableOrUnknown(
          data['source_account_id']!,
          _sourceAccountIdMeta,
        ),
      );
    }
    if (data.containsKey('destination_account_id')) {
      context.handle(
        _destinationAccountIdMeta,
        destinationAccountId.isAcceptableOrUnknown(
          data['destination_account_id']!,
          _destinationAccountIdMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('subcategory_id')) {
      context.handle(
        _subcategoryIdMeta,
        subcategoryId.isAcceptableOrUnknown(
          data['subcategory_id']!,
          _subcategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('payment_method_id')) {
      context.handle(
        _paymentMethodIdMeta,
        paymentMethodId.isAcceptableOrUnknown(
          data['payment_method_id']!,
          _paymentMethodIdMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('external_reference')) {
      context.handle(
        _externalReferenceMeta,
        externalReference.isAcceptableOrUnknown(
          data['external_reference']!,
          _externalReferenceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('original_source_id')) {
      context.handle(
        _originalSourceIdMeta,
        originalSourceId.isAcceptableOrUnknown(
          data['original_source_id']!,
          _originalSourceIdMeta,
        ),
      );
    }
    if (data.containsKey('source_metadata_json')) {
      context.handle(
        _sourceMetadataJsonMeta,
        sourceMetadataJson.isAcceptableOrUnknown(
          data['source_metadata_json']!,
          _sourceMetadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('expense_behavior')) {
      context.handle(
        _expenseBehaviorMeta,
        expenseBehavior.isAcceptableOrUnknown(
          data['expense_behavior']!,
          _expenseBehaviorMeta,
        ),
      );
    }
    if (data.containsKey('allocation_group')) {
      context.handle(
        _allocationGroupMeta,
        allocationGroup.isAcceptableOrUnknown(
          data['allocation_group']!,
          _allocationGroupMeta,
        ),
      );
    }
    if (data.containsKey('allocation_group_name')) {
      context.handle(
        _allocationGroupNameMeta,
        allocationGroupName.isAcceptableOrUnknown(
          data['allocation_group_name']!,
          _allocationGroupNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      occurredLocalOffsetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occurred_local_offset_minutes'],
      ),
      occurredTimezoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occurred_timezone_id'],
      ),
      localDateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_date_key'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      verification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verification'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      sourceAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_account_id'],
      ),
      destinationAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination_account_id'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      subcategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subcategory_id'],
      ),
      paymentMethodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      externalReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_reference'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      originalSourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_source_id'],
      ),
      sourceMetadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_metadata_json'],
      ),
      expenseBehavior: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_behavior'],
      ),
      allocationGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocation_group'],
      ),
      allocationGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocation_group_name'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String kind;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAt;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final String localDateKey;
  final String status;
  final String verification;
  final String source;
  final String? accountId;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? subcategoryId;
  final String? paymentMethodId;
  final String? description;
  final String? externalReference;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? originalSourceId;
  final String? sourceMetadataJson;
  final String? expenseBehavior;
  final String? allocationGroup;
  final String? allocationGroupName;
  const Transaction({
    required this.id,
    required this.kind,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAt,
    this.occurredLocalOffsetMinutes,
    this.occurredTimezoneId,
    required this.localDateKey,
    required this.status,
    required this.verification,
    required this.source,
    this.accountId,
    this.sourceAccountId,
    this.destinationAccountId,
    this.categoryId,
    this.subcategoryId,
    this.paymentMethodId,
    this.description,
    this.externalReference,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.originalSourceId,
    this.sourceMetadataJson,
    this.expenseBehavior,
    this.allocationGroup,
    this.allocationGroupName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || occurredLocalOffsetMinutes != null) {
      map['occurred_local_offset_minutes'] = Variable<int>(
        occurredLocalOffsetMinutes,
      );
    }
    if (!nullToAbsent || occurredTimezoneId != null) {
      map['occurred_timezone_id'] = Variable<String>(occurredTimezoneId);
    }
    map['local_date_key'] = Variable<String>(localDateKey);
    map['status'] = Variable<String>(status);
    map['verification'] = Variable<String>(verification);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    if (!nullToAbsent || sourceAccountId != null) {
      map['source_account_id'] = Variable<String>(sourceAccountId);
    }
    if (!nullToAbsent || destinationAccountId != null) {
      map['destination_account_id'] = Variable<String>(destinationAccountId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || subcategoryId != null) {
      map['subcategory_id'] = Variable<String>(subcategoryId);
    }
    if (!nullToAbsent || paymentMethodId != null) {
      map['payment_method_id'] = Variable<String>(paymentMethodId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || externalReference != null) {
      map['external_reference'] = Variable<String>(externalReference);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || originalSourceId != null) {
      map['original_source_id'] = Variable<String>(originalSourceId);
    }
    if (!nullToAbsent || sourceMetadataJson != null) {
      map['source_metadata_json'] = Variable<String>(sourceMetadataJson);
    }
    if (!nullToAbsent || expenseBehavior != null) {
      map['expense_behavior'] = Variable<String>(expenseBehavior);
    }
    if (!nullToAbsent || allocationGroup != null) {
      map['allocation_group'] = Variable<String>(allocationGroup);
    }
    if (!nullToAbsent || allocationGroupName != null) {
      map['allocation_group_name'] = Variable<String>(allocationGroupName);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      kind: Value(kind),
      amountMinor: Value(amountMinor),
      currencyCode: Value(currencyCode),
      occurredAt: Value(occurredAt),
      occurredLocalOffsetMinutes:
          occurredLocalOffsetMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredLocalOffsetMinutes),
      occurredTimezoneId: occurredTimezoneId == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredTimezoneId),
      localDateKey: Value(localDateKey),
      status: Value(status),
      verification: Value(verification),
      source: Value(source),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      sourceAccountId: sourceAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceAccountId),
      destinationAccountId: destinationAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(destinationAccountId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      subcategoryId: subcategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategoryId),
      paymentMethodId: paymentMethodId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethodId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      externalReference: externalReference == null && nullToAbsent
          ? const Value.absent()
          : Value(externalReference),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      originalSourceId: originalSourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(originalSourceId),
      sourceMetadataJson: sourceMetadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceMetadataJson),
      expenseBehavior: expenseBehavior == null && nullToAbsent
          ? const Value.absent()
          : Value(expenseBehavior),
      allocationGroup: allocationGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationGroup),
      allocationGroupName: allocationGroupName == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationGroupName),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      occurredLocalOffsetMinutes: serializer.fromJson<int?>(
        json['occurredLocalOffsetMinutes'],
      ),
      occurredTimezoneId: serializer.fromJson<String?>(
        json['occurredTimezoneId'],
      ),
      localDateKey: serializer.fromJson<String>(json['localDateKey']),
      status: serializer.fromJson<String>(json['status']),
      verification: serializer.fromJson<String>(json['verification']),
      source: serializer.fromJson<String>(json['source']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      sourceAccountId: serializer.fromJson<String?>(json['sourceAccountId']),
      destinationAccountId: serializer.fromJson<String?>(
        json['destinationAccountId'],
      ),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      subcategoryId: serializer.fromJson<String?>(json['subcategoryId']),
      paymentMethodId: serializer.fromJson<String?>(json['paymentMethodId']),
      description: serializer.fromJson<String?>(json['description']),
      externalReference: serializer.fromJson<String?>(
        json['externalReference'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      originalSourceId: serializer.fromJson<String?>(json['originalSourceId']),
      sourceMetadataJson: serializer.fromJson<String?>(
        json['sourceMetadataJson'],
      ),
      expenseBehavior: serializer.fromJson<String?>(json['expenseBehavior']),
      allocationGroup: serializer.fromJson<String?>(json['allocationGroup']),
      allocationGroupName: serializer.fromJson<String?>(
        json['allocationGroupName'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'occurredLocalOffsetMinutes': serializer.toJson<int?>(
        occurredLocalOffsetMinutes,
      ),
      'occurredTimezoneId': serializer.toJson<String?>(occurredTimezoneId),
      'localDateKey': serializer.toJson<String>(localDateKey),
      'status': serializer.toJson<String>(status),
      'verification': serializer.toJson<String>(verification),
      'source': serializer.toJson<String>(source),
      'accountId': serializer.toJson<String?>(accountId),
      'sourceAccountId': serializer.toJson<String?>(sourceAccountId),
      'destinationAccountId': serializer.toJson<String?>(destinationAccountId),
      'categoryId': serializer.toJson<String?>(categoryId),
      'subcategoryId': serializer.toJson<String?>(subcategoryId),
      'paymentMethodId': serializer.toJson<String?>(paymentMethodId),
      'description': serializer.toJson<String?>(description),
      'externalReference': serializer.toJson<String?>(externalReference),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'originalSourceId': serializer.toJson<String?>(originalSourceId),
      'sourceMetadataJson': serializer.toJson<String?>(sourceMetadataJson),
      'expenseBehavior': serializer.toJson<String?>(expenseBehavior),
      'allocationGroup': serializer.toJson<String?>(allocationGroup),
      'allocationGroupName': serializer.toJson<String?>(allocationGroupName),
    };
  }

  Transaction copyWith({
    String? id,
    String? kind,
    int? amountMinor,
    String? currencyCode,
    DateTime? occurredAt,
    Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
    Value<String?> occurredTimezoneId = const Value.absent(),
    String? localDateKey,
    String? status,
    String? verification,
    String? source,
    Value<String?> accountId = const Value.absent(),
    Value<String?> sourceAccountId = const Value.absent(),
    Value<String?> destinationAccountId = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    Value<String?> subcategoryId = const Value.absent(),
    Value<String?> paymentMethodId = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> externalReference = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> originalSourceId = const Value.absent(),
    Value<String?> sourceMetadataJson = const Value.absent(),
    Value<String?> expenseBehavior = const Value.absent(),
    Value<String?> allocationGroup = const Value.absent(),
    Value<String?> allocationGroupName = const Value.absent(),
  }) => Transaction(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    amountMinor: amountMinor ?? this.amountMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    occurredAt: occurredAt ?? this.occurredAt,
    occurredLocalOffsetMinutes: occurredLocalOffsetMinutes.present
        ? occurredLocalOffsetMinutes.value
        : this.occurredLocalOffsetMinutes,
    occurredTimezoneId: occurredTimezoneId.present
        ? occurredTimezoneId.value
        : this.occurredTimezoneId,
    localDateKey: localDateKey ?? this.localDateKey,
    status: status ?? this.status,
    verification: verification ?? this.verification,
    source: source ?? this.source,
    accountId: accountId.present ? accountId.value : this.accountId,
    sourceAccountId: sourceAccountId.present
        ? sourceAccountId.value
        : this.sourceAccountId,
    destinationAccountId: destinationAccountId.present
        ? destinationAccountId.value
        : this.destinationAccountId,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    subcategoryId: subcategoryId.present
        ? subcategoryId.value
        : this.subcategoryId,
    paymentMethodId: paymentMethodId.present
        ? paymentMethodId.value
        : this.paymentMethodId,
    description: description.present ? description.value : this.description,
    externalReference: externalReference.present
        ? externalReference.value
        : this.externalReference,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    originalSourceId: originalSourceId.present
        ? originalSourceId.value
        : this.originalSourceId,
    sourceMetadataJson: sourceMetadataJson.present
        ? sourceMetadataJson.value
        : this.sourceMetadataJson,
    expenseBehavior: expenseBehavior.present
        ? expenseBehavior.value
        : this.expenseBehavior,
    allocationGroup: allocationGroup.present
        ? allocationGroup.value
        : this.allocationGroup,
    allocationGroupName: allocationGroupName.present
        ? allocationGroupName.value
        : this.allocationGroupName,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      occurredLocalOffsetMinutes: data.occurredLocalOffsetMinutes.present
          ? data.occurredLocalOffsetMinutes.value
          : this.occurredLocalOffsetMinutes,
      occurredTimezoneId: data.occurredTimezoneId.present
          ? data.occurredTimezoneId.value
          : this.occurredTimezoneId,
      localDateKey: data.localDateKey.present
          ? data.localDateKey.value
          : this.localDateKey,
      status: data.status.present ? data.status.value : this.status,
      verification: data.verification.present
          ? data.verification.value
          : this.verification,
      source: data.source.present ? data.source.value : this.source,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      sourceAccountId: data.sourceAccountId.present
          ? data.sourceAccountId.value
          : this.sourceAccountId,
      destinationAccountId: data.destinationAccountId.present
          ? data.destinationAccountId.value
          : this.destinationAccountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      subcategoryId: data.subcategoryId.present
          ? data.subcategoryId.value
          : this.subcategoryId,
      paymentMethodId: data.paymentMethodId.present
          ? data.paymentMethodId.value
          : this.paymentMethodId,
      description: data.description.present
          ? data.description.value
          : this.description,
      externalReference: data.externalReference.present
          ? data.externalReference.value
          : this.externalReference,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      originalSourceId: data.originalSourceId.present
          ? data.originalSourceId.value
          : this.originalSourceId,
      sourceMetadataJson: data.sourceMetadataJson.present
          ? data.sourceMetadataJson.value
          : this.sourceMetadataJson,
      expenseBehavior: data.expenseBehavior.present
          ? data.expenseBehavior.value
          : this.expenseBehavior,
      allocationGroup: data.allocationGroup.present
          ? data.allocationGroup.value
          : this.allocationGroup,
      allocationGroupName: data.allocationGroupName.present
          ? data.allocationGroupName.value
          : this.allocationGroupName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('occurredLocalOffsetMinutes: $occurredLocalOffsetMinutes, ')
          ..write('occurredTimezoneId: $occurredTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('status: $status, ')
          ..write('verification: $verification, ')
          ..write('source: $source, ')
          ..write('accountId: $accountId, ')
          ..write('sourceAccountId: $sourceAccountId, ')
          ..write('destinationAccountId: $destinationAccountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('subcategoryId: $subcategoryId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('description: $description, ')
          ..write('externalReference: $externalReference, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('originalSourceId: $originalSourceId, ')
          ..write('sourceMetadataJson: $sourceMetadataJson, ')
          ..write('expenseBehavior: $expenseBehavior, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationGroupName: $allocationGroupName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    kind,
    amountMinor,
    currencyCode,
    occurredAt,
    occurredLocalOffsetMinutes,
    occurredTimezoneId,
    localDateKey,
    status,
    verification,
    source,
    accountId,
    sourceAccountId,
    destinationAccountId,
    categoryId,
    subcategoryId,
    paymentMethodId,
    description,
    externalReference,
    createdAt,
    updatedAt,
    deletedAt,
    originalSourceId,
    sourceMetadataJson,
    expenseBehavior,
    allocationGroup,
    allocationGroupName,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.amountMinor == this.amountMinor &&
          other.currencyCode == this.currencyCode &&
          other.occurredAt == this.occurredAt &&
          other.occurredLocalOffsetMinutes == this.occurredLocalOffsetMinutes &&
          other.occurredTimezoneId == this.occurredTimezoneId &&
          other.localDateKey == this.localDateKey &&
          other.status == this.status &&
          other.verification == this.verification &&
          other.source == this.source &&
          other.accountId == this.accountId &&
          other.sourceAccountId == this.sourceAccountId &&
          other.destinationAccountId == this.destinationAccountId &&
          other.categoryId == this.categoryId &&
          other.subcategoryId == this.subcategoryId &&
          other.paymentMethodId == this.paymentMethodId &&
          other.description == this.description &&
          other.externalReference == this.externalReference &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.originalSourceId == this.originalSourceId &&
          other.sourceMetadataJson == this.sourceMetadataJson &&
          other.expenseBehavior == this.expenseBehavior &&
          other.allocationGroup == this.allocationGroup &&
          other.allocationGroupName == this.allocationGroupName);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> kind;
  final Value<int> amountMinor;
  final Value<String> currencyCode;
  final Value<DateTime> occurredAt;
  final Value<int?> occurredLocalOffsetMinutes;
  final Value<String?> occurredTimezoneId;
  final Value<String> localDateKey;
  final Value<String> status;
  final Value<String> verification;
  final Value<String> source;
  final Value<String?> accountId;
  final Value<String?> sourceAccountId;
  final Value<String?> destinationAccountId;
  final Value<String?> categoryId;
  final Value<String?> subcategoryId;
  final Value<String?> paymentMethodId;
  final Value<String?> description;
  final Value<String?> externalReference;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> originalSourceId;
  final Value<String?> sourceMetadataJson;
  final Value<String?> expenseBehavior;
  final Value<String?> allocationGroup;
  final Value<String?> allocationGroupName;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.occurredLocalOffsetMinutes = const Value.absent(),
    this.occurredTimezoneId = const Value.absent(),
    this.localDateKey = const Value.absent(),
    this.status = const Value.absent(),
    this.verification = const Value.absent(),
    this.source = const Value.absent(),
    this.accountId = const Value.absent(),
    this.sourceAccountId = const Value.absent(),
    this.destinationAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.subcategoryId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.description = const Value.absent(),
    this.externalReference = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.originalSourceId = const Value.absent(),
    this.sourceMetadataJson = const Value.absent(),
    this.expenseBehavior = const Value.absent(),
    this.allocationGroup = const Value.absent(),
    this.allocationGroupName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String kind,
    required int amountMinor,
    this.currencyCode = const Value.absent(),
    required DateTime occurredAt,
    this.occurredLocalOffsetMinutes = const Value.absent(),
    this.occurredTimezoneId = const Value.absent(),
    required String localDateKey,
    required String status,
    this.verification = const Value.absent(),
    required String source,
    this.accountId = const Value.absent(),
    this.sourceAccountId = const Value.absent(),
    this.destinationAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.subcategoryId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.description = const Value.absent(),
    this.externalReference = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.originalSourceId = const Value.absent(),
    this.sourceMetadataJson = const Value.absent(),
    this.expenseBehavior = const Value.absent(),
    this.allocationGroup = const Value.absent(),
    this.allocationGroupName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       amountMinor = Value(amountMinor),
       occurredAt = Value(occurredAt),
       localDateKey = Value(localDateKey),
       status = Value(status),
       source = Value(source),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<int>? amountMinor,
    Expression<String>? currencyCode,
    Expression<DateTime>? occurredAt,
    Expression<int>? occurredLocalOffsetMinutes,
    Expression<String>? occurredTimezoneId,
    Expression<String>? localDateKey,
    Expression<String>? status,
    Expression<String>? verification,
    Expression<String>? source,
    Expression<String>? accountId,
    Expression<String>? sourceAccountId,
    Expression<String>? destinationAccountId,
    Expression<String>? categoryId,
    Expression<String>? subcategoryId,
    Expression<String>? paymentMethodId,
    Expression<String>? description,
    Expression<String>? externalReference,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? originalSourceId,
    Expression<String>? sourceMetadataJson,
    Expression<String>? expenseBehavior,
    Expression<String>? allocationGroup,
    Expression<String>? allocationGroupName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (occurredLocalOffsetMinutes != null)
        'occurred_local_offset_minutes': occurredLocalOffsetMinutes,
      if (occurredTimezoneId != null)
        'occurred_timezone_id': occurredTimezoneId,
      if (localDateKey != null) 'local_date_key': localDateKey,
      if (status != null) 'status': status,
      if (verification != null) 'verification': verification,
      if (source != null) 'source': source,
      if (accountId != null) 'account_id': accountId,
      if (sourceAccountId != null) 'source_account_id': sourceAccountId,
      if (destinationAccountId != null)
        'destination_account_id': destinationAccountId,
      if (categoryId != null) 'category_id': categoryId,
      if (subcategoryId != null) 'subcategory_id': subcategoryId,
      if (paymentMethodId != null) 'payment_method_id': paymentMethodId,
      if (description != null) 'description': description,
      if (externalReference != null) 'external_reference': externalReference,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (originalSourceId != null) 'original_source_id': originalSourceId,
      if (sourceMetadataJson != null)
        'source_metadata_json': sourceMetadataJson,
      if (expenseBehavior != null) 'expense_behavior': expenseBehavior,
      if (allocationGroup != null) 'allocation_group': allocationGroup,
      if (allocationGroupName != null)
        'allocation_group_name': allocationGroupName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<int>? amountMinor,
    Value<String>? currencyCode,
    Value<DateTime>? occurredAt,
    Value<int?>? occurredLocalOffsetMinutes,
    Value<String?>? occurredTimezoneId,
    Value<String>? localDateKey,
    Value<String>? status,
    Value<String>? verification,
    Value<String>? source,
    Value<String?>? accountId,
    Value<String?>? sourceAccountId,
    Value<String?>? destinationAccountId,
    Value<String?>? categoryId,
    Value<String?>? subcategoryId,
    Value<String?>? paymentMethodId,
    Value<String?>? description,
    Value<String?>? externalReference,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? originalSourceId,
    Value<String?>? sourceMetadataJson,
    Value<String?>? expenseBehavior,
    Value<String?>? allocationGroup,
    Value<String?>? allocationGroupName,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      amountMinor: amountMinor ?? this.amountMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      occurredAt: occurredAt ?? this.occurredAt,
      occurredLocalOffsetMinutes:
          occurredLocalOffsetMinutes ?? this.occurredLocalOffsetMinutes,
      occurredTimezoneId: occurredTimezoneId ?? this.occurredTimezoneId,
      localDateKey: localDateKey ?? this.localDateKey,
      status: status ?? this.status,
      verification: verification ?? this.verification,
      source: source ?? this.source,
      accountId: accountId ?? this.accountId,
      sourceAccountId: sourceAccountId ?? this.sourceAccountId,
      destinationAccountId: destinationAccountId ?? this.destinationAccountId,
      categoryId: categoryId ?? this.categoryId,
      subcategoryId: subcategoryId ?? this.subcategoryId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      description: description ?? this.description,
      externalReference: externalReference ?? this.externalReference,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      originalSourceId: originalSourceId ?? this.originalSourceId,
      sourceMetadataJson: sourceMetadataJson ?? this.sourceMetadataJson,
      expenseBehavior: expenseBehavior ?? this.expenseBehavior,
      allocationGroup: allocationGroup ?? this.allocationGroup,
      allocationGroupName: allocationGroupName ?? this.allocationGroupName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (occurredLocalOffsetMinutes.present) {
      map['occurred_local_offset_minutes'] = Variable<int>(
        occurredLocalOffsetMinutes.value,
      );
    }
    if (occurredTimezoneId.present) {
      map['occurred_timezone_id'] = Variable<String>(occurredTimezoneId.value);
    }
    if (localDateKey.present) {
      map['local_date_key'] = Variable<String>(localDateKey.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (verification.present) {
      map['verification'] = Variable<String>(verification.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (sourceAccountId.present) {
      map['source_account_id'] = Variable<String>(sourceAccountId.value);
    }
    if (destinationAccountId.present) {
      map['destination_account_id'] = Variable<String>(
        destinationAccountId.value,
      );
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (subcategoryId.present) {
      map['subcategory_id'] = Variable<String>(subcategoryId.value);
    }
    if (paymentMethodId.present) {
      map['payment_method_id'] = Variable<String>(paymentMethodId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (externalReference.present) {
      map['external_reference'] = Variable<String>(externalReference.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (originalSourceId.present) {
      map['original_source_id'] = Variable<String>(originalSourceId.value);
    }
    if (sourceMetadataJson.present) {
      map['source_metadata_json'] = Variable<String>(sourceMetadataJson.value);
    }
    if (expenseBehavior.present) {
      map['expense_behavior'] = Variable<String>(expenseBehavior.value);
    }
    if (allocationGroup.present) {
      map['allocation_group'] = Variable<String>(allocationGroup.value);
    }
    if (allocationGroupName.present) {
      map['allocation_group_name'] = Variable<String>(
        allocationGroupName.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('occurredLocalOffsetMinutes: $occurredLocalOffsetMinutes, ')
          ..write('occurredTimezoneId: $occurredTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('status: $status, ')
          ..write('verification: $verification, ')
          ..write('source: $source, ')
          ..write('accountId: $accountId, ')
          ..write('sourceAccountId: $sourceAccountId, ')
          ..write('destinationAccountId: $destinationAccountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('subcategoryId: $subcategoryId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('description: $description, ')
          ..write('externalReference: $externalReference, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('originalSourceId: $originalSourceId, ')
          ..write('sourceMetadataJson: $sourceMetadataJson, ')
          ..write('expenseBehavior: $expenseBehavior, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationGroupName: $allocationGroupName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodTypeMeta = const VerificationMeta(
    'periodType',
  );
  @override
  late final GeneratedColumn<String> periodType = GeneratedColumn<String>(
    'period_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodKeyMeta = const VerificationMeta(
    'periodKey',
  );
  @override
  late final GeneratedColumn<String> periodKey = GeneratedColumn<String>(
    'period_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _budgetModeMeta = const VerificationMeta(
    'budgetMode',
  );
  @override
  late final GeneratedColumn<String> budgetMode = GeneratedColumn<String>(
    'budget_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _allocationGroupMeta = const VerificationMeta(
    'allocationGroup',
  );
  @override
  late final GeneratedColumn<String> allocationGroup = GeneratedColumn<String>(
    'allocation_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allocationPercentageMeta =
      const VerificationMeta('allocationPercentage');
  @override
  late final GeneratedColumn<int> allocationPercentage = GeneratedColumn<int>(
    'allocation_percentage',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _limitMinorMeta = const VerificationMeta(
    'limitMinor',
  );
  @override
  late final GeneratedColumn<int> limitMinor = GeneratedColumn<int>(
    'limit_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _incomeBaseModeMeta = const VerificationMeta(
    'incomeBaseMode',
  );
  @override
  late final GeneratedColumn<String> incomeBaseMode = GeneratedColumn<String>(
    'income_base_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _incomeBaseAmountMinorMeta =
      const VerificationMeta('incomeBaseAmountMinor');
  @override
  late final GeneratedColumn<int> incomeBaseAmountMinor = GeneratedColumn<int>(
    'income_base_amount_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alertThresholdMinorMeta =
      const VerificationMeta('alertThresholdMinor');
  @override
  late final GeneratedColumn<int> alertThresholdMinor = GeneratedColumn<int>(
    'alert_threshold_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodType,
    periodKey,
    categoryId,
    planId,
    name,
    budgetMode,
    allocationGroup,
    allocationPercentage,
    limitMinor,
    currencyCode,
    incomeBaseMode,
    incomeBaseAmountMinor,
    alertThresholdMinor,
    isActive,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Budget> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('period_type')) {
      context.handle(
        _periodTypeMeta,
        periodType.isAcceptableOrUnknown(data['period_type']!, _periodTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_periodTypeMeta);
    }
    if (data.containsKey('period_key')) {
      context.handle(
        _periodKeyMeta,
        periodKey.isAcceptableOrUnknown(data['period_key']!, _periodKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_periodKeyMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('budget_mode')) {
      context.handle(
        _budgetModeMeta,
        budgetMode.isAcceptableOrUnknown(data['budget_mode']!, _budgetModeMeta),
      );
    } else if (isInserting) {
      context.missing(_budgetModeMeta);
    }
    if (data.containsKey('allocation_group')) {
      context.handle(
        _allocationGroupMeta,
        allocationGroup.isAcceptableOrUnknown(
          data['allocation_group']!,
          _allocationGroupMeta,
        ),
      );
    }
    if (data.containsKey('allocation_percentage')) {
      context.handle(
        _allocationPercentageMeta,
        allocationPercentage.isAcceptableOrUnknown(
          data['allocation_percentage']!,
          _allocationPercentageMeta,
        ),
      );
    }
    if (data.containsKey('limit_minor')) {
      context.handle(
        _limitMinorMeta,
        limitMinor.isAcceptableOrUnknown(data['limit_minor']!, _limitMinorMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('income_base_mode')) {
      context.handle(
        _incomeBaseModeMeta,
        incomeBaseMode.isAcceptableOrUnknown(
          data['income_base_mode']!,
          _incomeBaseModeMeta,
        ),
      );
    }
    if (data.containsKey('income_base_amount_minor')) {
      context.handle(
        _incomeBaseAmountMinorMeta,
        incomeBaseAmountMinor.isAcceptableOrUnknown(
          data['income_base_amount_minor']!,
          _incomeBaseAmountMinorMeta,
        ),
      );
    }
    if (data.containsKey('alert_threshold_minor')) {
      context.handle(
        _alertThresholdMinorMeta,
        alertThresholdMinor.isAcceptableOrUnknown(
          data['alert_threshold_minor']!,
          _alertThresholdMinorMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      periodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_type'],
      )!,
      periodKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_key'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      budgetMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}budget_mode'],
      )!,
      allocationGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocation_group'],
      ),
      allocationPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}allocation_percentage'],
      ),
      limitMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}limit_minor'],
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      incomeBaseMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_base_mode'],
      ),
      incomeBaseAmountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}income_base_amount_minor'],
      ),
      alertThresholdMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_threshold_minor'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class Budget extends DataClass implements Insertable<Budget> {
  final String id;
  final String periodType;
  final String periodKey;
  final String? categoryId;
  final String? planId;
  final String? name;
  final String budgetMode;
  final String? allocationGroup;
  final int? allocationPercentage;
  final int? limitMinor;
  final String currencyCode;
  final String? incomeBaseMode;
  final int? incomeBaseAmountMinor;
  final int? alertThresholdMinor;
  final bool isActive;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Budget({
    required this.id,
    required this.periodType,
    required this.periodKey,
    this.categoryId,
    this.planId,
    this.name,
    required this.budgetMode,
    this.allocationGroup,
    this.allocationPercentage,
    this.limitMinor,
    required this.currencyCode,
    this.incomeBaseMode,
    this.incomeBaseAmountMinor,
    this.alertThresholdMinor,
    required this.isActive,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_type'] = Variable<String>(periodType);
    map['period_key'] = Variable<String>(periodKey);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || planId != null) {
      map['plan_id'] = Variable<String>(planId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['budget_mode'] = Variable<String>(budgetMode);
    if (!nullToAbsent || allocationGroup != null) {
      map['allocation_group'] = Variable<String>(allocationGroup);
    }
    if (!nullToAbsent || allocationPercentage != null) {
      map['allocation_percentage'] = Variable<int>(allocationPercentage);
    }
    if (!nullToAbsent || limitMinor != null) {
      map['limit_minor'] = Variable<int>(limitMinor);
    }
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || incomeBaseMode != null) {
      map['income_base_mode'] = Variable<String>(incomeBaseMode);
    }
    if (!nullToAbsent || incomeBaseAmountMinor != null) {
      map['income_base_amount_minor'] = Variable<int>(incomeBaseAmountMinor);
    }
    if (!nullToAbsent || alertThresholdMinor != null) {
      map['alert_threshold_minor'] = Variable<int>(alertThresholdMinor);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      periodType: Value(periodType),
      periodKey: Value(periodKey),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      planId: planId == null && nullToAbsent
          ? const Value.absent()
          : Value(planId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      budgetMode: Value(budgetMode),
      allocationGroup: allocationGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationGroup),
      allocationPercentage: allocationPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationPercentage),
      limitMinor: limitMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(limitMinor),
      currencyCode: Value(currencyCode),
      incomeBaseMode: incomeBaseMode == null && nullToAbsent
          ? const Value.absent()
          : Value(incomeBaseMode),
      incomeBaseAmountMinor: incomeBaseAmountMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(incomeBaseAmountMinor),
      alertThresholdMinor: alertThresholdMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(alertThresholdMinor),
      isActive: Value(isActive),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Budget.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<String>(json['id']),
      periodType: serializer.fromJson<String>(json['periodType']),
      periodKey: serializer.fromJson<String>(json['periodKey']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      planId: serializer.fromJson<String?>(json['planId']),
      name: serializer.fromJson<String?>(json['name']),
      budgetMode: serializer.fromJson<String>(json['budgetMode']),
      allocationGroup: serializer.fromJson<String?>(json['allocationGroup']),
      allocationPercentage: serializer.fromJson<int?>(
        json['allocationPercentage'],
      ),
      limitMinor: serializer.fromJson<int?>(json['limitMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      incomeBaseMode: serializer.fromJson<String?>(json['incomeBaseMode']),
      incomeBaseAmountMinor: serializer.fromJson<int?>(
        json['incomeBaseAmountMinor'],
      ),
      alertThresholdMinor: serializer.fromJson<int?>(
        json['alertThresholdMinor'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodType': serializer.toJson<String>(periodType),
      'periodKey': serializer.toJson<String>(periodKey),
      'categoryId': serializer.toJson<String?>(categoryId),
      'planId': serializer.toJson<String?>(planId),
      'name': serializer.toJson<String?>(name),
      'budgetMode': serializer.toJson<String>(budgetMode),
      'allocationGroup': serializer.toJson<String?>(allocationGroup),
      'allocationPercentage': serializer.toJson<int?>(allocationPercentage),
      'limitMinor': serializer.toJson<int?>(limitMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'incomeBaseMode': serializer.toJson<String?>(incomeBaseMode),
      'incomeBaseAmountMinor': serializer.toJson<int?>(incomeBaseAmountMinor),
      'alertThresholdMinor': serializer.toJson<int?>(alertThresholdMinor),
      'isActive': serializer.toJson<bool>(isActive),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Budget copyWith({
    String? id,
    String? periodType,
    String? periodKey,
    Value<String?> categoryId = const Value.absent(),
    Value<String?> planId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    String? budgetMode,
    Value<String?> allocationGroup = const Value.absent(),
    Value<int?> allocationPercentage = const Value.absent(),
    Value<int?> limitMinor = const Value.absent(),
    String? currencyCode,
    Value<String?> incomeBaseMode = const Value.absent(),
    Value<int?> incomeBaseAmountMinor = const Value.absent(),
    Value<int?> alertThresholdMinor = const Value.absent(),
    bool? isActive,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Budget(
    id: id ?? this.id,
    periodType: periodType ?? this.periodType,
    periodKey: periodKey ?? this.periodKey,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    planId: planId.present ? planId.value : this.planId,
    name: name.present ? name.value : this.name,
    budgetMode: budgetMode ?? this.budgetMode,
    allocationGroup: allocationGroup.present
        ? allocationGroup.value
        : this.allocationGroup,
    allocationPercentage: allocationPercentage.present
        ? allocationPercentage.value
        : this.allocationPercentage,
    limitMinor: limitMinor.present ? limitMinor.value : this.limitMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    incomeBaseMode: incomeBaseMode.present
        ? incomeBaseMode.value
        : this.incomeBaseMode,
    incomeBaseAmountMinor: incomeBaseAmountMinor.present
        ? incomeBaseAmountMinor.value
        : this.incomeBaseAmountMinor,
    alertThresholdMinor: alertThresholdMinor.present
        ? alertThresholdMinor.value
        : this.alertThresholdMinor,
    isActive: isActive ?? this.isActive,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Budget copyWithCompanion(BudgetsCompanion data) {
    return Budget(
      id: data.id.present ? data.id.value : this.id,
      periodType: data.periodType.present
          ? data.periodType.value
          : this.periodType,
      periodKey: data.periodKey.present ? data.periodKey.value : this.periodKey,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      planId: data.planId.present ? data.planId.value : this.planId,
      name: data.name.present ? data.name.value : this.name,
      budgetMode: data.budgetMode.present
          ? data.budgetMode.value
          : this.budgetMode,
      allocationGroup: data.allocationGroup.present
          ? data.allocationGroup.value
          : this.allocationGroup,
      allocationPercentage: data.allocationPercentage.present
          ? data.allocationPercentage.value
          : this.allocationPercentage,
      limitMinor: data.limitMinor.present
          ? data.limitMinor.value
          : this.limitMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      incomeBaseMode: data.incomeBaseMode.present
          ? data.incomeBaseMode.value
          : this.incomeBaseMode,
      incomeBaseAmountMinor: data.incomeBaseAmountMinor.present
          ? data.incomeBaseAmountMinor.value
          : this.incomeBaseAmountMinor,
      alertThresholdMinor: data.alertThresholdMinor.present
          ? data.alertThresholdMinor.value
          : this.alertThresholdMinor,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('periodKey: $periodKey, ')
          ..write('categoryId: $categoryId, ')
          ..write('planId: $planId, ')
          ..write('name: $name, ')
          ..write('budgetMode: $budgetMode, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationPercentage: $allocationPercentage, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('incomeBaseMode: $incomeBaseMode, ')
          ..write('incomeBaseAmountMinor: $incomeBaseAmountMinor, ')
          ..write('alertThresholdMinor: $alertThresholdMinor, ')
          ..write('isActive: $isActive, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    periodType,
    periodKey,
    categoryId,
    planId,
    name,
    budgetMode,
    allocationGroup,
    allocationPercentage,
    limitMinor,
    currencyCode,
    incomeBaseMode,
    incomeBaseAmountMinor,
    alertThresholdMinor,
    isActive,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.periodType == this.periodType &&
          other.periodKey == this.periodKey &&
          other.categoryId == this.categoryId &&
          other.planId == this.planId &&
          other.name == this.name &&
          other.budgetMode == this.budgetMode &&
          other.allocationGroup == this.allocationGroup &&
          other.allocationPercentage == this.allocationPercentage &&
          other.limitMinor == this.limitMinor &&
          other.currencyCode == this.currencyCode &&
          other.incomeBaseMode == this.incomeBaseMode &&
          other.incomeBaseAmountMinor == this.incomeBaseAmountMinor &&
          other.alertThresholdMinor == this.alertThresholdMinor &&
          other.isActive == this.isActive &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<String> id;
  final Value<String> periodType;
  final Value<String> periodKey;
  final Value<String?> categoryId;
  final Value<String?> planId;
  final Value<String?> name;
  final Value<String> budgetMode;
  final Value<String?> allocationGroup;
  final Value<int?> allocationPercentage;
  final Value<int?> limitMinor;
  final Value<String> currencyCode;
  final Value<String?> incomeBaseMode;
  final Value<int?> incomeBaseAmountMinor;
  final Value<int?> alertThresholdMinor;
  final Value<bool> isActive;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.periodType = const Value.absent(),
    this.periodKey = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.planId = const Value.absent(),
    this.name = const Value.absent(),
    this.budgetMode = const Value.absent(),
    this.allocationGroup = const Value.absent(),
    this.allocationPercentage = const Value.absent(),
    this.limitMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.incomeBaseMode = const Value.absent(),
    this.incomeBaseAmountMinor = const Value.absent(),
    this.alertThresholdMinor = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetsCompanion.insert({
    required String id,
    required String periodType,
    required String periodKey,
    this.categoryId = const Value.absent(),
    this.planId = const Value.absent(),
    this.name = const Value.absent(),
    required String budgetMode,
    this.allocationGroup = const Value.absent(),
    this.allocationPercentage = const Value.absent(),
    this.limitMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.incomeBaseMode = const Value.absent(),
    this.incomeBaseAmountMinor = const Value.absent(),
    this.alertThresholdMinor = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       periodType = Value(periodType),
       periodKey = Value(periodKey),
       budgetMode = Value(budgetMode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Budget> custom({
    Expression<String>? id,
    Expression<String>? periodType,
    Expression<String>? periodKey,
    Expression<String>? categoryId,
    Expression<String>? planId,
    Expression<String>? name,
    Expression<String>? budgetMode,
    Expression<String>? allocationGroup,
    Expression<int>? allocationPercentage,
    Expression<int>? limitMinor,
    Expression<String>? currencyCode,
    Expression<String>? incomeBaseMode,
    Expression<int>? incomeBaseAmountMinor,
    Expression<int>? alertThresholdMinor,
    Expression<bool>? isActive,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodType != null) 'period_type': periodType,
      if (periodKey != null) 'period_key': periodKey,
      if (categoryId != null) 'category_id': categoryId,
      if (planId != null) 'plan_id': planId,
      if (name != null) 'name': name,
      if (budgetMode != null) 'budget_mode': budgetMode,
      if (allocationGroup != null) 'allocation_group': allocationGroup,
      if (allocationPercentage != null)
        'allocation_percentage': allocationPercentage,
      if (limitMinor != null) 'limit_minor': limitMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (incomeBaseMode != null) 'income_base_mode': incomeBaseMode,
      if (incomeBaseAmountMinor != null)
        'income_base_amount_minor': incomeBaseAmountMinor,
      if (alertThresholdMinor != null)
        'alert_threshold_minor': alertThresholdMinor,
      if (isActive != null) 'is_active': isActive,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetsCompanion copyWith({
    Value<String>? id,
    Value<String>? periodType,
    Value<String>? periodKey,
    Value<String?>? categoryId,
    Value<String?>? planId,
    Value<String?>? name,
    Value<String>? budgetMode,
    Value<String?>? allocationGroup,
    Value<int?>? allocationPercentage,
    Value<int?>? limitMinor,
    Value<String>? currencyCode,
    Value<String?>? incomeBaseMode,
    Value<int?>? incomeBaseAmountMinor,
    Value<int?>? alertThresholdMinor,
    Value<bool>? isActive,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return BudgetsCompanion(
      id: id ?? this.id,
      periodType: periodType ?? this.periodType,
      periodKey: periodKey ?? this.periodKey,
      categoryId: categoryId ?? this.categoryId,
      planId: planId ?? this.planId,
      name: name ?? this.name,
      budgetMode: budgetMode ?? this.budgetMode,
      allocationGroup: allocationGroup ?? this.allocationGroup,
      allocationPercentage: allocationPercentage ?? this.allocationPercentage,
      limitMinor: limitMinor ?? this.limitMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      incomeBaseMode: incomeBaseMode ?? this.incomeBaseMode,
      incomeBaseAmountMinor:
          incomeBaseAmountMinor ?? this.incomeBaseAmountMinor,
      alertThresholdMinor: alertThresholdMinor ?? this.alertThresholdMinor,
      isActive: isActive ?? this.isActive,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (periodType.present) {
      map['period_type'] = Variable<String>(periodType.value);
    }
    if (periodKey.present) {
      map['period_key'] = Variable<String>(periodKey.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (budgetMode.present) {
      map['budget_mode'] = Variable<String>(budgetMode.value);
    }
    if (allocationGroup.present) {
      map['allocation_group'] = Variable<String>(allocationGroup.value);
    }
    if (allocationPercentage.present) {
      map['allocation_percentage'] = Variable<int>(allocationPercentage.value);
    }
    if (limitMinor.present) {
      map['limit_minor'] = Variable<int>(limitMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (incomeBaseMode.present) {
      map['income_base_mode'] = Variable<String>(incomeBaseMode.value);
    }
    if (incomeBaseAmountMinor.present) {
      map['income_base_amount_minor'] = Variable<int>(
        incomeBaseAmountMinor.value,
      );
    }
    if (alertThresholdMinor.present) {
      map['alert_threshold_minor'] = Variable<int>(alertThresholdMinor.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('periodKey: $periodKey, ')
          ..write('categoryId: $categoryId, ')
          ..write('planId: $planId, ')
          ..write('name: $name, ')
          ..write('budgetMode: $budgetMode, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationPercentage: $allocationPercentage, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('incomeBaseMode: $incomeBaseMode, ')
          ..write('incomeBaseAmountMinor: $incomeBaseAmountMinor, ')
          ..write('alertThresholdMinor: $alertThresholdMinor, ')
          ..write('isActive: $isActive, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavingsGoalsTable extends SavingsGoals
    with TableInfo<$SavingsGoalsTable, SavingsGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetMinorMeta = const VerificationMeta(
    'targetMinor',
  );
  @override
  late final GeneratedColumn<int> targetMinor = GeneratedColumn<int>(
    'target_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _deadlineAtMeta = const VerificationMeta(
    'deadlineAt',
  );
  @override
  late final GeneratedColumn<DateTime> deadlineAt = GeneratedColumn<DateTime>(
    'deadline_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    targetMinor,
    currencyCode,
    deadlineAt,
    accountId,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingsGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_minor')) {
      context.handle(
        _targetMinorMeta,
        targetMinor.isAcceptableOrUnknown(
          data['target_minor']!,
          _targetMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('deadline_at')) {
      context.handle(
        _deadlineAtMeta,
        deadlineAt.isAcceptableOrUnknown(data['deadline_at']!, _deadlineAtMeta),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsGoal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      targetMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_minor'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      deadlineAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline_at'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SavingsGoalsTable createAlias(String alias) {
    return $SavingsGoalsTable(attachedDatabase, alias);
  }
}

class SavingsGoal extends DataClass implements Insertable<SavingsGoal> {
  final String id;
  final String name;
  final int targetMinor;
  final String currencyCode;
  final DateTime? deadlineAt;
  final String? accountId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SavingsGoal({
    required this.id,
    required this.name,
    required this.targetMinor,
    required this.currencyCode,
    this.deadlineAt,
    this.accountId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['target_minor'] = Variable<int>(targetMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || deadlineAt != null) {
      map['deadline_at'] = Variable<DateTime>(deadlineAt);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SavingsGoalsCompanion toCompanion(bool nullToAbsent) {
    return SavingsGoalsCompanion(
      id: Value(id),
      name: Value(name),
      targetMinor: Value(targetMinor),
      currencyCode: Value(currencyCode),
      deadlineAt: deadlineAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineAt),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SavingsGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsGoal(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetMinor: serializer.fromJson<int>(json['targetMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      deadlineAt: serializer.fromJson<DateTime?>(json['deadlineAt']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'targetMinor': serializer.toJson<int>(targetMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'deadlineAt': serializer.toJson<DateTime?>(deadlineAt),
      'accountId': serializer.toJson<String?>(accountId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SavingsGoal copyWith({
    String? id,
    String? name,
    int? targetMinor,
    String? currencyCode,
    Value<DateTime?> deadlineAt = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SavingsGoal(
    id: id ?? this.id,
    name: name ?? this.name,
    targetMinor: targetMinor ?? this.targetMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    deadlineAt: deadlineAt.present ? deadlineAt.value : this.deadlineAt,
    accountId: accountId.present ? accountId.value : this.accountId,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SavingsGoal copyWithCompanion(SavingsGoalsCompanion data) {
    return SavingsGoal(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetMinor: data.targetMinor.present
          ? data.targetMinor.value
          : this.targetMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      deadlineAt: data.deadlineAt.present
          ? data.deadlineAt.value
          : this.deadlineAt,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsGoal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetMinor: $targetMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('accountId: $accountId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    targetMinor,
    currencyCode,
    deadlineAt,
    accountId,
    status,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsGoal &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetMinor == this.targetMinor &&
          other.currencyCode == this.currencyCode &&
          other.deadlineAt == this.deadlineAt &&
          other.accountId == this.accountId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SavingsGoalsCompanion extends UpdateCompanion<SavingsGoal> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> targetMinor;
  final Value<String> currencyCode;
  final Value<DateTime?> deadlineAt;
  final Value<String?> accountId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SavingsGoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.deadlineAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavingsGoalsCompanion.insert({
    required String id,
    required String name,
    required int targetMinor,
    this.currencyCode = const Value.absent(),
    this.deadlineAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       targetMinor = Value(targetMinor),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SavingsGoal> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? targetMinor,
    Expression<String>? currencyCode,
    Expression<DateTime>? deadlineAt,
    Expression<String>? accountId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetMinor != null) 'target_minor': targetMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (deadlineAt != null) 'deadline_at': deadlineAt,
      if (accountId != null) 'account_id': accountId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavingsGoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? targetMinor,
    Value<String>? currencyCode,
    Value<DateTime?>? deadlineAt,
    Value<String?>? accountId,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SavingsGoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetMinor: targetMinor ?? this.targetMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      deadlineAt: deadlineAt ?? this.deadlineAt,
      accountId: accountId ?? this.accountId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetMinor.present) {
      map['target_minor'] = Variable<int>(targetMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (deadlineAt.present) {
      map['deadline_at'] = Variable<DateTime>(deadlineAt.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsGoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetMinor: $targetMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('accountId: $accountId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavingsContributionsTable extends SavingsContributions
    with TableInfo<$SavingsContributionsTable, SavingsContribution> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsContributionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES savings_goals (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    goalId,
    transactionId,
    amountMinor,
    currencyCode,
    occurredAt,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_contributions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingsContribution> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
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
  SavingsContribution map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsContribution(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_id'],
      ),
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SavingsContributionsTable createAlias(String alias) {
    return $SavingsContributionsTable(attachedDatabase, alias);
  }
}

class SavingsContribution extends DataClass
    implements Insertable<SavingsContribution> {
  final String id;
  final String goalId;
  final String? transactionId;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAt;
  final String? note;
  final DateTime createdAt;
  const SavingsContribution({
    required this.id,
    required this.goalId,
    this.transactionId,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAt,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['goal_id'] = Variable<String>(goalId);
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<String>(transactionId);
    }
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SavingsContributionsCompanion toCompanion(bool nullToAbsent) {
    return SavingsContributionsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      amountMinor: Value(amountMinor),
      currencyCode: Value(currencyCode),
      occurredAt: Value(occurredAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory SavingsContribution.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsContribution(
      id: serializer.fromJson<String>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      transactionId: serializer.fromJson<String?>(json['transactionId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'goalId': serializer.toJson<String>(goalId),
      'transactionId': serializer.toJson<String?>(transactionId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SavingsContribution copyWith({
    String? id,
    String? goalId,
    Value<String?> transactionId = const Value.absent(),
    int? amountMinor,
    String? currencyCode,
    DateTime? occurredAt,
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => SavingsContribution(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    transactionId: transactionId.present
        ? transactionId.value
        : this.transactionId,
    amountMinor: amountMinor ?? this.amountMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    occurredAt: occurredAt ?? this.occurredAt,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  SavingsContribution copyWithCompanion(SavingsContributionsCompanion data) {
    return SavingsContribution(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsContribution(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('transactionId: $transactionId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    goalId,
    transactionId,
    amountMinor,
    currencyCode,
    occurredAt,
    note,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsContribution &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.transactionId == this.transactionId &&
          other.amountMinor == this.amountMinor &&
          other.currencyCode == this.currencyCode &&
          other.occurredAt == this.occurredAt &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class SavingsContributionsCompanion
    extends UpdateCompanion<SavingsContribution> {
  final Value<String> id;
  final Value<String> goalId;
  final Value<String?> transactionId;
  final Value<int> amountMinor;
  final Value<String> currencyCode;
  final Value<DateTime> occurredAt;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SavingsContributionsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavingsContributionsCompanion.insert({
    required String id,
    required String goalId,
    this.transactionId = const Value.absent(),
    required int amountMinor,
    this.currencyCode = const Value.absent(),
    required DateTime occurredAt,
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       goalId = Value(goalId),
       amountMinor = Value(amountMinor),
       occurredAt = Value(occurredAt),
       createdAt = Value(createdAt);
  static Insertable<SavingsContribution> custom({
    Expression<String>? id,
    Expression<String>? goalId,
    Expression<String>? transactionId,
    Expression<int>? amountMinor,
    Expression<String>? currencyCode,
    Expression<DateTime>? occurredAt,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavingsContributionsCompanion copyWith({
    Value<String>? id,
    Value<String>? goalId,
    Value<String?>? transactionId,
    Value<int>? amountMinor,
    Value<String>? currencyCode,
    Value<DateTime>? occurredAt,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SavingsContributionsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      transactionId: transactionId ?? this.transactionId,
      amountMinor: amountMinor ?? this.amountMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      occurredAt: occurredAt ?? this.occurredAt,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsContributionsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('transactionId: $transactionId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecurringPlansTable extends RecurringPlans
    with TableInfo<$RecurringPlansTable, RecurringPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cadenceMeta = const VerificationMeta(
    'cadence',
  );
  @override
  late final GeneratedColumn<String> cadence = GeneratedColumn<String>(
    'cadence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextDueAtMeta = const VerificationMeta(
    'nextDueAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueAt = GeneratedColumn<DateTime>(
    'next_due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _templateKindMeta = const VerificationMeta(
    'templateKind',
  );
  @override
  late final GeneratedColumn<String> templateKind = GeneratedColumn<String>(
    'template_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateDataJsonMeta = const VerificationMeta(
    'templateDataJson',
  );
  @override
  late final GeneratedColumn<String> templateDataJson = GeneratedColumn<String>(
    'template_data_json',
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    cadence,
    startAt,
    nextDueAt,
    endAt,
    status,
    templateKind,
    templateDataJson,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecurringPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cadence')) {
      context.handle(
        _cadenceMeta,
        cadence.isAcceptableOrUnknown(data['cadence']!, _cadenceMeta),
      );
    } else if (isInserting) {
      context.missing(_cadenceMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('next_due_at')) {
      context.handle(
        _nextDueAtMeta,
        nextDueAt.isAcceptableOrUnknown(data['next_due_at']!, _nextDueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_nextDueAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('template_kind')) {
      context.handle(
        _templateKindMeta,
        templateKind.isAcceptableOrUnknown(
          data['template_kind']!,
          _templateKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_templateKindMeta);
    }
    if (data.containsKey('template_data_json')) {
      context.handle(
        _templateDataJsonMeta,
        templateDataJson.isAcceptableOrUnknown(
          data['template_data_json']!,
          _templateDataJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_templateDataJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      cadence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cadence'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      )!,
      nextDueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      templateKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_kind'],
      )!,
      templateDataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_data_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RecurringPlansTable createAlias(String alias) {
    return $RecurringPlansTable(attachedDatabase, alias);
  }
}

class RecurringPlan extends DataClass implements Insertable<RecurringPlan> {
  final String id;
  final String name;
  final String cadence;
  final DateTime startAt;
  final DateTime nextDueAt;
  final DateTime? endAt;
  final String status;
  final String templateKind;
  final String templateDataJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RecurringPlan({
    required this.id,
    required this.name,
    required this.cadence,
    required this.startAt,
    required this.nextDueAt,
    this.endAt,
    required this.status,
    required this.templateKind,
    required this.templateDataJson,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['cadence'] = Variable<String>(cadence);
    map['start_at'] = Variable<DateTime>(startAt);
    map['next_due_at'] = Variable<DateTime>(nextDueAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    map['status'] = Variable<String>(status);
    map['template_kind'] = Variable<String>(templateKind);
    map['template_data_json'] = Variable<String>(templateDataJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RecurringPlansCompanion toCompanion(bool nullToAbsent) {
    return RecurringPlansCompanion(
      id: Value(id),
      name: Value(name),
      cadence: Value(cadence),
      startAt: Value(startAt),
      nextDueAt: Value(nextDueAt),
      endAt: endAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endAt),
      status: Value(status),
      templateKind: Value(templateKind),
      templateDataJson: Value(templateDataJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RecurringPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringPlan(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cadence: serializer.fromJson<String>(json['cadence']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      nextDueAt: serializer.fromJson<DateTime>(json['nextDueAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
      status: serializer.fromJson<String>(json['status']),
      templateKind: serializer.fromJson<String>(json['templateKind']),
      templateDataJson: serializer.fromJson<String>(json['templateDataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'cadence': serializer.toJson<String>(cadence),
      'startAt': serializer.toJson<DateTime>(startAt),
      'nextDueAt': serializer.toJson<DateTime>(nextDueAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
      'status': serializer.toJson<String>(status),
      'templateKind': serializer.toJson<String>(templateKind),
      'templateDataJson': serializer.toJson<String>(templateDataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RecurringPlan copyWith({
    String? id,
    String? name,
    String? cadence,
    DateTime? startAt,
    DateTime? nextDueAt,
    Value<DateTime?> endAt = const Value.absent(),
    String? status,
    String? templateKind,
    String? templateDataJson,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RecurringPlan(
    id: id ?? this.id,
    name: name ?? this.name,
    cadence: cadence ?? this.cadence,
    startAt: startAt ?? this.startAt,
    nextDueAt: nextDueAt ?? this.nextDueAt,
    endAt: endAt.present ? endAt.value : this.endAt,
    status: status ?? this.status,
    templateKind: templateKind ?? this.templateKind,
    templateDataJson: templateDataJson ?? this.templateDataJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RecurringPlan copyWithCompanion(RecurringPlansCompanion data) {
    return RecurringPlan(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      cadence: data.cadence.present ? data.cadence.value : this.cadence,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      nextDueAt: data.nextDueAt.present ? data.nextDueAt.value : this.nextDueAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
      status: data.status.present ? data.status.value : this.status,
      templateKind: data.templateKind.present
          ? data.templateKind.value
          : this.templateKind,
      templateDataJson: data.templateDataJson.present
          ? data.templateDataJson.value
          : this.templateDataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecurringPlan(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cadence: $cadence, ')
          ..write('startAt: $startAt, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('endAt: $endAt, ')
          ..write('status: $status, ')
          ..write('templateKind: $templateKind, ')
          ..write('templateDataJson: $templateDataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    cadence,
    startAt,
    nextDueAt,
    endAt,
    status,
    templateKind,
    templateDataJson,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringPlan &&
          other.id == this.id &&
          other.name == this.name &&
          other.cadence == this.cadence &&
          other.startAt == this.startAt &&
          other.nextDueAt == this.nextDueAt &&
          other.endAt == this.endAt &&
          other.status == this.status &&
          other.templateKind == this.templateKind &&
          other.templateDataJson == this.templateDataJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecurringPlansCompanion extends UpdateCompanion<RecurringPlan> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> cadence;
  final Value<DateTime> startAt;
  final Value<DateTime> nextDueAt;
  final Value<DateTime?> endAt;
  final Value<String> status;
  final Value<String> templateKind;
  final Value<String> templateDataJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RecurringPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cadence = const Value.absent(),
    this.startAt = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.status = const Value.absent(),
    this.templateKind = const Value.absent(),
    this.templateDataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecurringPlansCompanion.insert({
    required String id,
    required String name,
    required String cadence,
    required DateTime startAt,
    required DateTime nextDueAt,
    this.endAt = const Value.absent(),
    this.status = const Value.absent(),
    required String templateKind,
    required String templateDataJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       cadence = Value(cadence),
       startAt = Value(startAt),
       nextDueAt = Value(nextDueAt),
       templateKind = Value(templateKind),
       templateDataJson = Value(templateDataJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RecurringPlan> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? cadence,
    Expression<DateTime>? startAt,
    Expression<DateTime>? nextDueAt,
    Expression<DateTime>? endAt,
    Expression<String>? status,
    Expression<String>? templateKind,
    Expression<String>? templateDataJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cadence != null) 'cadence': cadence,
      if (startAt != null) 'start_at': startAt,
      if (nextDueAt != null) 'next_due_at': nextDueAt,
      if (endAt != null) 'end_at': endAt,
      if (status != null) 'status': status,
      if (templateKind != null) 'template_kind': templateKind,
      if (templateDataJson != null) 'template_data_json': templateDataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecurringPlansCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? cadence,
    Value<DateTime>? startAt,
    Value<DateTime>? nextDueAt,
    Value<DateTime?>? endAt,
    Value<String>? status,
    Value<String>? templateKind,
    Value<String>? templateDataJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RecurringPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      cadence: cadence ?? this.cadence,
      startAt: startAt ?? this.startAt,
      nextDueAt: nextDueAt ?? this.nextDueAt,
      endAt: endAt ?? this.endAt,
      status: status ?? this.status,
      templateKind: templateKind ?? this.templateKind,
      templateDataJson: templateDataJson ?? this.templateDataJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cadence.present) {
      map['cadence'] = Variable<String>(cadence.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (nextDueAt.present) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (templateKind.present) {
      map['template_kind'] = Variable<String>(templateKind.value);
    }
    if (templateDataJson.present) {
      map['template_data_json'] = Variable<String>(templateDataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cadence: $cadence, ')
          ..write('startAt: $startAt, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('endAt: $endAt, ')
          ..write('status: $status, ')
          ..write('templateKind: $templateKind, ')
          ..write('templateDataJson: $templateDataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DetectedTransactionCandidatesTable extends DetectedTransactionCandidates
    with
        TableInfo<
          $DetectedTransactionCandidatesTable,
          DetectedTransactionCandidate
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetectedTransactionCandidatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceAppMeta = const VerificationMeta(
    'sourceApp',
  );
  @override
  late final GeneratedColumn<String> sourceApp = GeneratedColumn<String>(
    'source_app',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceReferenceMeta = const VerificationMeta(
    'sourceReference',
  );
  @override
  late final GeneratedColumn<String> sourceReference = GeneratedColumn<String>(
    'source_reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _normalizedKindMeta = const VerificationMeta(
    'normalizedKind',
  );
  @override
  late final GeneratedColumn<String> normalizedKind = GeneratedColumn<String>(
    'normalized_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseBehaviorMeta = const VerificationMeta(
    'expenseBehavior',
  );
  @override
  late final GeneratedColumn<String> expenseBehavior = GeneratedColumn<String>(
    'expense_behavior',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allocationGroupMeta = const VerificationMeta(
    'allocationGroup',
  );
  @override
  late final GeneratedColumn<String> allocationGroup = GeneratedColumn<String>(
    'allocation_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allocationGroupNameMeta =
      const VerificationMeta('allocationGroupName');
  @override
  late final GeneratedColumn<String> allocationGroupName =
      GeneratedColumn<String>(
        'allocation_group_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredLocalOffsetMinutesMeta =
      const VerificationMeta('occurredLocalOffsetMinutes');
  @override
  late final GeneratedColumn<int> occurredLocalOffsetMinutes =
      GeneratedColumn<int>(
        'occurred_local_offset_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _occurredTimezoneIdMeta =
      const VerificationMeta('occurredTimezoneId');
  @override
  late final GeneratedColumn<String> occurredTimezoneId =
      GeneratedColumn<String>(
        'occurred_timezone_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _localDateKeyMeta = const VerificationMeta(
    'localDateKey',
  );
  @override
  late final GeneratedColumn<String> localDateKey = GeneratedColumn<String>(
    'local_date_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _sourceAccountIdMeta = const VerificationMeta(
    'sourceAccountId',
  );
  @override
  late final GeneratedColumn<String> sourceAccountId = GeneratedColumn<String>(
    'source_account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _destinationAccountIdMeta =
      const VerificationMeta('destinationAccountId');
  @override
  late final GeneratedColumn<String> destinationAccountId =
      GeneratedColumn<String>(
        'destination_account_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _paymentMethodIdMeta = const VerificationMeta(
    'paymentMethodId',
  );
  @override
  late final GeneratedColumn<String> paymentMethodId = GeneratedColumn<String>(
    'payment_method_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payment_methods (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _partyDetailsMeta = const VerificationMeta(
    'partyDetails',
  );
  @override
  late final GeneratedColumn<String> partyDetails = GeneratedColumn<String>(
    'party_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceContextMeta = const VerificationMeta(
    'sourceContext',
  );
  @override
  late final GeneratedColumn<String> sourceContext = GeneratedColumn<String>(
    'source_context',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusEvidenceMeta = const VerificationMeta(
    'statusEvidence',
  );
  @override
  late final GeneratedColumn<String> statusEvidence = GeneratedColumn<String>(
    'status_evidence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _candidateStateMeta = const VerificationMeta(
    'candidateState',
  );
  @override
  late final GeneratedColumn<String> candidateState = GeneratedColumn<String>(
    'candidate_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('needs_review'),
  );
  static const VerificationMeta _duplicateOfTransactionIdMeta =
      const VerificationMeta('duplicateOfTransactionId');
  @override
  late final GeneratedColumn<String> duplicateOfTransactionId =
      GeneratedColumn<String>(
        'duplicate_of_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transactions (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _confirmedTransactionIdMeta =
      const VerificationMeta('confirmedTransactionId');
  @override
  late final GeneratedColumn<String> confirmedTransactionId =
      GeneratedColumn<String>(
        'confirmed_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transactions (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMetadataJsonMeta =
      const VerificationMeta('sourceMetadataJson');
  @override
  late final GeneratedColumn<String> sourceMetadataJson =
      GeneratedColumn<String>(
        'source_metadata_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    source,
    sourceApp,
    sourceReference,
    normalizedKind,
    expenseBehavior,
    allocationGroup,
    allocationGroupName,
    amountMinor,
    currencyCode,
    occurredAt,
    occurredLocalOffsetMinutes,
    occurredTimezoneId,
    localDateKey,
    accountId,
    sourceAccountId,
    destinationAccountId,
    categoryId,
    paymentMethodId,
    description,
    partyDetails,
    sourceContext,
    confidence,
    statusEvidence,
    candidateState,
    duplicateOfTransactionId,
    confirmedTransactionId,
    receivedAt,
    sourceMetadataJson,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detected_transaction_candidates';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetectedTransactionCandidate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('source_app')) {
      context.handle(
        _sourceAppMeta,
        sourceApp.isAcceptableOrUnknown(data['source_app']!, _sourceAppMeta),
      );
    }
    if (data.containsKey('source_reference')) {
      context.handle(
        _sourceReferenceMeta,
        sourceReference.isAcceptableOrUnknown(
          data['source_reference']!,
          _sourceReferenceMeta,
        ),
      );
    }
    if (data.containsKey('normalized_kind')) {
      context.handle(
        _normalizedKindMeta,
        normalizedKind.isAcceptableOrUnknown(
          data['normalized_kind']!,
          _normalizedKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_normalizedKindMeta);
    }
    if (data.containsKey('expense_behavior')) {
      context.handle(
        _expenseBehaviorMeta,
        expenseBehavior.isAcceptableOrUnknown(
          data['expense_behavior']!,
          _expenseBehaviorMeta,
        ),
      );
    }
    if (data.containsKey('allocation_group')) {
      context.handle(
        _allocationGroupMeta,
        allocationGroup.isAcceptableOrUnknown(
          data['allocation_group']!,
          _allocationGroupMeta,
        ),
      );
    }
    if (data.containsKey('allocation_group_name')) {
      context.handle(
        _allocationGroupNameMeta,
        allocationGroupName.isAcceptableOrUnknown(
          data['allocation_group_name']!,
          _allocationGroupNameMeta,
        ),
      );
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('occurred_local_offset_minutes')) {
      context.handle(
        _occurredLocalOffsetMinutesMeta,
        occurredLocalOffsetMinutes.isAcceptableOrUnknown(
          data['occurred_local_offset_minutes']!,
          _occurredLocalOffsetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('occurred_timezone_id')) {
      context.handle(
        _occurredTimezoneIdMeta,
        occurredTimezoneId.isAcceptableOrUnknown(
          data['occurred_timezone_id']!,
          _occurredTimezoneIdMeta,
        ),
      );
    }
    if (data.containsKey('local_date_key')) {
      context.handle(
        _localDateKeyMeta,
        localDateKey.isAcceptableOrUnknown(
          data['local_date_key']!,
          _localDateKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localDateKeyMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('source_account_id')) {
      context.handle(
        _sourceAccountIdMeta,
        sourceAccountId.isAcceptableOrUnknown(
          data['source_account_id']!,
          _sourceAccountIdMeta,
        ),
      );
    }
    if (data.containsKey('destination_account_id')) {
      context.handle(
        _destinationAccountIdMeta,
        destinationAccountId.isAcceptableOrUnknown(
          data['destination_account_id']!,
          _destinationAccountIdMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('payment_method_id')) {
      context.handle(
        _paymentMethodIdMeta,
        paymentMethodId.isAcceptableOrUnknown(
          data['payment_method_id']!,
          _paymentMethodIdMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('party_details')) {
      context.handle(
        _partyDetailsMeta,
        partyDetails.isAcceptableOrUnknown(
          data['party_details']!,
          _partyDetailsMeta,
        ),
      );
    }
    if (data.containsKey('source_context')) {
      context.handle(
        _sourceContextMeta,
        sourceContext.isAcceptableOrUnknown(
          data['source_context']!,
          _sourceContextMeta,
        ),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('status_evidence')) {
      context.handle(
        _statusEvidenceMeta,
        statusEvidence.isAcceptableOrUnknown(
          data['status_evidence']!,
          _statusEvidenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statusEvidenceMeta);
    }
    if (data.containsKey('candidate_state')) {
      context.handle(
        _candidateStateMeta,
        candidateState.isAcceptableOrUnknown(
          data['candidate_state']!,
          _candidateStateMeta,
        ),
      );
    }
    if (data.containsKey('duplicate_of_transaction_id')) {
      context.handle(
        _duplicateOfTransactionIdMeta,
        duplicateOfTransactionId.isAcceptableOrUnknown(
          data['duplicate_of_transaction_id']!,
          _duplicateOfTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('confirmed_transaction_id')) {
      context.handle(
        _confirmedTransactionIdMeta,
        confirmedTransactionId.isAcceptableOrUnknown(
          data['confirmed_transaction_id']!,
          _confirmedTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('source_metadata_json')) {
      context.handle(
        _sourceMetadataJsonMeta,
        sourceMetadataJson.isAcceptableOrUnknown(
          data['source_metadata_json']!,
          _sourceMetadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetectedTransactionCandidate map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetectedTransactionCandidate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      sourceApp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_app'],
      ),
      sourceReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_reference'],
      ),
      normalizedKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normalized_kind'],
      )!,
      expenseBehavior: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_behavior'],
      ),
      allocationGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocation_group'],
      ),
      allocationGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocation_group_name'],
      ),
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      occurredLocalOffsetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occurred_local_offset_minutes'],
      ),
      occurredTimezoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occurred_timezone_id'],
      ),
      localDateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_date_key'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      sourceAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_account_id'],
      ),
      destinationAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination_account_id'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      paymentMethodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      partyDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_details'],
      ),
      sourceContext: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_context'],
      ),
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      statusEvidence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_evidence'],
      )!,
      candidateState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidate_state'],
      )!,
      duplicateOfTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duplicate_of_transaction_id'],
      ),
      confirmedTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}confirmed_transaction_id'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
      sourceMetadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_metadata_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DetectedTransactionCandidatesTable createAlias(String alias) {
    return $DetectedTransactionCandidatesTable(attachedDatabase, alias);
  }
}

class DetectedTransactionCandidate extends DataClass
    implements Insertable<DetectedTransactionCandidate> {
  final String id;
  final String source;
  final String? sourceApp;
  final String? sourceReference;
  final String normalizedKind;
  final String? expenseBehavior;
  final String? allocationGroup;
  final String? allocationGroupName;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredAt;
  final int? occurredLocalOffsetMinutes;
  final String? occurredTimezoneId;
  final String localDateKey;
  final String? accountId;
  final String? sourceAccountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? paymentMethodId;
  final String? description;
  final String? partyDetails;
  final String? sourceContext;
  final double confidence;
  final String statusEvidence;
  final String candidateState;
  final String? duplicateOfTransactionId;
  final String? confirmedTransactionId;
  final DateTime receivedAt;
  final String? sourceMetadataJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DetectedTransactionCandidate({
    required this.id,
    required this.source,
    this.sourceApp,
    this.sourceReference,
    required this.normalizedKind,
    this.expenseBehavior,
    this.allocationGroup,
    this.allocationGroupName,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredAt,
    this.occurredLocalOffsetMinutes,
    this.occurredTimezoneId,
    required this.localDateKey,
    this.accountId,
    this.sourceAccountId,
    this.destinationAccountId,
    this.categoryId,
    this.paymentMethodId,
    this.description,
    this.partyDetails,
    this.sourceContext,
    required this.confidence,
    required this.statusEvidence,
    required this.candidateState,
    this.duplicateOfTransactionId,
    this.confirmedTransactionId,
    required this.receivedAt,
    this.sourceMetadataJson,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || sourceApp != null) {
      map['source_app'] = Variable<String>(sourceApp);
    }
    if (!nullToAbsent || sourceReference != null) {
      map['source_reference'] = Variable<String>(sourceReference);
    }
    map['normalized_kind'] = Variable<String>(normalizedKind);
    if (!nullToAbsent || expenseBehavior != null) {
      map['expense_behavior'] = Variable<String>(expenseBehavior);
    }
    if (!nullToAbsent || allocationGroup != null) {
      map['allocation_group'] = Variable<String>(allocationGroup);
    }
    if (!nullToAbsent || allocationGroupName != null) {
      map['allocation_group_name'] = Variable<String>(allocationGroupName);
    }
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || occurredLocalOffsetMinutes != null) {
      map['occurred_local_offset_minutes'] = Variable<int>(
        occurredLocalOffsetMinutes,
      );
    }
    if (!nullToAbsent || occurredTimezoneId != null) {
      map['occurred_timezone_id'] = Variable<String>(occurredTimezoneId);
    }
    map['local_date_key'] = Variable<String>(localDateKey);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    if (!nullToAbsent || sourceAccountId != null) {
      map['source_account_id'] = Variable<String>(sourceAccountId);
    }
    if (!nullToAbsent || destinationAccountId != null) {
      map['destination_account_id'] = Variable<String>(destinationAccountId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || paymentMethodId != null) {
      map['payment_method_id'] = Variable<String>(paymentMethodId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || partyDetails != null) {
      map['party_details'] = Variable<String>(partyDetails);
    }
    if (!nullToAbsent || sourceContext != null) {
      map['source_context'] = Variable<String>(sourceContext);
    }
    map['confidence'] = Variable<double>(confidence);
    map['status_evidence'] = Variable<String>(statusEvidence);
    map['candidate_state'] = Variable<String>(candidateState);
    if (!nullToAbsent || duplicateOfTransactionId != null) {
      map['duplicate_of_transaction_id'] = Variable<String>(
        duplicateOfTransactionId,
      );
    }
    if (!nullToAbsent || confirmedTransactionId != null) {
      map['confirmed_transaction_id'] = Variable<String>(
        confirmedTransactionId,
      );
    }
    map['received_at'] = Variable<DateTime>(receivedAt);
    if (!nullToAbsent || sourceMetadataJson != null) {
      map['source_metadata_json'] = Variable<String>(sourceMetadataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DetectedTransactionCandidatesCompanion toCompanion(bool nullToAbsent) {
    return DetectedTransactionCandidatesCompanion(
      id: Value(id),
      source: Value(source),
      sourceApp: sourceApp == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceApp),
      sourceReference: sourceReference == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceReference),
      normalizedKind: Value(normalizedKind),
      expenseBehavior: expenseBehavior == null && nullToAbsent
          ? const Value.absent()
          : Value(expenseBehavior),
      allocationGroup: allocationGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationGroup),
      allocationGroupName: allocationGroupName == null && nullToAbsent
          ? const Value.absent()
          : Value(allocationGroupName),
      amountMinor: Value(amountMinor),
      currencyCode: Value(currencyCode),
      occurredAt: Value(occurredAt),
      occurredLocalOffsetMinutes:
          occurredLocalOffsetMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredLocalOffsetMinutes),
      occurredTimezoneId: occurredTimezoneId == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredTimezoneId),
      localDateKey: Value(localDateKey),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      sourceAccountId: sourceAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceAccountId),
      destinationAccountId: destinationAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(destinationAccountId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      paymentMethodId: paymentMethodId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethodId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      partyDetails: partyDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(partyDetails),
      sourceContext: sourceContext == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceContext),
      confidence: Value(confidence),
      statusEvidence: Value(statusEvidence),
      candidateState: Value(candidateState),
      duplicateOfTransactionId: duplicateOfTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(duplicateOfTransactionId),
      confirmedTransactionId: confirmedTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmedTransactionId),
      receivedAt: Value(receivedAt),
      sourceMetadataJson: sourceMetadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceMetadataJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DetectedTransactionCandidate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetectedTransactionCandidate(
      id: serializer.fromJson<String>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      sourceApp: serializer.fromJson<String?>(json['sourceApp']),
      sourceReference: serializer.fromJson<String?>(json['sourceReference']),
      normalizedKind: serializer.fromJson<String>(json['normalizedKind']),
      expenseBehavior: serializer.fromJson<String?>(json['expenseBehavior']),
      allocationGroup: serializer.fromJson<String?>(json['allocationGroup']),
      allocationGroupName: serializer.fromJson<String?>(
        json['allocationGroupName'],
      ),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      occurredLocalOffsetMinutes: serializer.fromJson<int?>(
        json['occurredLocalOffsetMinutes'],
      ),
      occurredTimezoneId: serializer.fromJson<String?>(
        json['occurredTimezoneId'],
      ),
      localDateKey: serializer.fromJson<String>(json['localDateKey']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      sourceAccountId: serializer.fromJson<String?>(json['sourceAccountId']),
      destinationAccountId: serializer.fromJson<String?>(
        json['destinationAccountId'],
      ),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      paymentMethodId: serializer.fromJson<String?>(json['paymentMethodId']),
      description: serializer.fromJson<String?>(json['description']),
      partyDetails: serializer.fromJson<String?>(json['partyDetails']),
      sourceContext: serializer.fromJson<String?>(json['sourceContext']),
      confidence: serializer.fromJson<double>(json['confidence']),
      statusEvidence: serializer.fromJson<String>(json['statusEvidence']),
      candidateState: serializer.fromJson<String>(json['candidateState']),
      duplicateOfTransactionId: serializer.fromJson<String?>(
        json['duplicateOfTransactionId'],
      ),
      confirmedTransactionId: serializer.fromJson<String?>(
        json['confirmedTransactionId'],
      ),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      sourceMetadataJson: serializer.fromJson<String?>(
        json['sourceMetadataJson'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'source': serializer.toJson<String>(source),
      'sourceApp': serializer.toJson<String?>(sourceApp),
      'sourceReference': serializer.toJson<String?>(sourceReference),
      'normalizedKind': serializer.toJson<String>(normalizedKind),
      'expenseBehavior': serializer.toJson<String?>(expenseBehavior),
      'allocationGroup': serializer.toJson<String?>(allocationGroup),
      'allocationGroupName': serializer.toJson<String?>(allocationGroupName),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'occurredLocalOffsetMinutes': serializer.toJson<int?>(
        occurredLocalOffsetMinutes,
      ),
      'occurredTimezoneId': serializer.toJson<String?>(occurredTimezoneId),
      'localDateKey': serializer.toJson<String>(localDateKey),
      'accountId': serializer.toJson<String?>(accountId),
      'sourceAccountId': serializer.toJson<String?>(sourceAccountId),
      'destinationAccountId': serializer.toJson<String?>(destinationAccountId),
      'categoryId': serializer.toJson<String?>(categoryId),
      'paymentMethodId': serializer.toJson<String?>(paymentMethodId),
      'description': serializer.toJson<String?>(description),
      'partyDetails': serializer.toJson<String?>(partyDetails),
      'sourceContext': serializer.toJson<String?>(sourceContext),
      'confidence': serializer.toJson<double>(confidence),
      'statusEvidence': serializer.toJson<String>(statusEvidence),
      'candidateState': serializer.toJson<String>(candidateState),
      'duplicateOfTransactionId': serializer.toJson<String?>(
        duplicateOfTransactionId,
      ),
      'confirmedTransactionId': serializer.toJson<String?>(
        confirmedTransactionId,
      ),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'sourceMetadataJson': serializer.toJson<String?>(sourceMetadataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DetectedTransactionCandidate copyWith({
    String? id,
    String? source,
    Value<String?> sourceApp = const Value.absent(),
    Value<String?> sourceReference = const Value.absent(),
    String? normalizedKind,
    Value<String?> expenseBehavior = const Value.absent(),
    Value<String?> allocationGroup = const Value.absent(),
    Value<String?> allocationGroupName = const Value.absent(),
    int? amountMinor,
    String? currencyCode,
    DateTime? occurredAt,
    Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
    Value<String?> occurredTimezoneId = const Value.absent(),
    String? localDateKey,
    Value<String?> accountId = const Value.absent(),
    Value<String?> sourceAccountId = const Value.absent(),
    Value<String?> destinationAccountId = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    Value<String?> paymentMethodId = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> partyDetails = const Value.absent(),
    Value<String?> sourceContext = const Value.absent(),
    double? confidence,
    String? statusEvidence,
    String? candidateState,
    Value<String?> duplicateOfTransactionId = const Value.absent(),
    Value<String?> confirmedTransactionId = const Value.absent(),
    DateTime? receivedAt,
    Value<String?> sourceMetadataJson = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DetectedTransactionCandidate(
    id: id ?? this.id,
    source: source ?? this.source,
    sourceApp: sourceApp.present ? sourceApp.value : this.sourceApp,
    sourceReference: sourceReference.present
        ? sourceReference.value
        : this.sourceReference,
    normalizedKind: normalizedKind ?? this.normalizedKind,
    expenseBehavior: expenseBehavior.present
        ? expenseBehavior.value
        : this.expenseBehavior,
    allocationGroup: allocationGroup.present
        ? allocationGroup.value
        : this.allocationGroup,
    allocationGroupName: allocationGroupName.present
        ? allocationGroupName.value
        : this.allocationGroupName,
    amountMinor: amountMinor ?? this.amountMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    occurredAt: occurredAt ?? this.occurredAt,
    occurredLocalOffsetMinutes: occurredLocalOffsetMinutes.present
        ? occurredLocalOffsetMinutes.value
        : this.occurredLocalOffsetMinutes,
    occurredTimezoneId: occurredTimezoneId.present
        ? occurredTimezoneId.value
        : this.occurredTimezoneId,
    localDateKey: localDateKey ?? this.localDateKey,
    accountId: accountId.present ? accountId.value : this.accountId,
    sourceAccountId: sourceAccountId.present
        ? sourceAccountId.value
        : this.sourceAccountId,
    destinationAccountId: destinationAccountId.present
        ? destinationAccountId.value
        : this.destinationAccountId,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    paymentMethodId: paymentMethodId.present
        ? paymentMethodId.value
        : this.paymentMethodId,
    description: description.present ? description.value : this.description,
    partyDetails: partyDetails.present ? partyDetails.value : this.partyDetails,
    sourceContext: sourceContext.present
        ? sourceContext.value
        : this.sourceContext,
    confidence: confidence ?? this.confidence,
    statusEvidence: statusEvidence ?? this.statusEvidence,
    candidateState: candidateState ?? this.candidateState,
    duplicateOfTransactionId: duplicateOfTransactionId.present
        ? duplicateOfTransactionId.value
        : this.duplicateOfTransactionId,
    confirmedTransactionId: confirmedTransactionId.present
        ? confirmedTransactionId.value
        : this.confirmedTransactionId,
    receivedAt: receivedAt ?? this.receivedAt,
    sourceMetadataJson: sourceMetadataJson.present
        ? sourceMetadataJson.value
        : this.sourceMetadataJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DetectedTransactionCandidate copyWithCompanion(
    DetectedTransactionCandidatesCompanion data,
  ) {
    return DetectedTransactionCandidate(
      id: data.id.present ? data.id.value : this.id,
      source: data.source.present ? data.source.value : this.source,
      sourceApp: data.sourceApp.present ? data.sourceApp.value : this.sourceApp,
      sourceReference: data.sourceReference.present
          ? data.sourceReference.value
          : this.sourceReference,
      normalizedKind: data.normalizedKind.present
          ? data.normalizedKind.value
          : this.normalizedKind,
      expenseBehavior: data.expenseBehavior.present
          ? data.expenseBehavior.value
          : this.expenseBehavior,
      allocationGroup: data.allocationGroup.present
          ? data.allocationGroup.value
          : this.allocationGroup,
      allocationGroupName: data.allocationGroupName.present
          ? data.allocationGroupName.value
          : this.allocationGroupName,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      occurredLocalOffsetMinutes: data.occurredLocalOffsetMinutes.present
          ? data.occurredLocalOffsetMinutes.value
          : this.occurredLocalOffsetMinutes,
      occurredTimezoneId: data.occurredTimezoneId.present
          ? data.occurredTimezoneId.value
          : this.occurredTimezoneId,
      localDateKey: data.localDateKey.present
          ? data.localDateKey.value
          : this.localDateKey,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      sourceAccountId: data.sourceAccountId.present
          ? data.sourceAccountId.value
          : this.sourceAccountId,
      destinationAccountId: data.destinationAccountId.present
          ? data.destinationAccountId.value
          : this.destinationAccountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      paymentMethodId: data.paymentMethodId.present
          ? data.paymentMethodId.value
          : this.paymentMethodId,
      description: data.description.present
          ? data.description.value
          : this.description,
      partyDetails: data.partyDetails.present
          ? data.partyDetails.value
          : this.partyDetails,
      sourceContext: data.sourceContext.present
          ? data.sourceContext.value
          : this.sourceContext,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      statusEvidence: data.statusEvidence.present
          ? data.statusEvidence.value
          : this.statusEvidence,
      candidateState: data.candidateState.present
          ? data.candidateState.value
          : this.candidateState,
      duplicateOfTransactionId: data.duplicateOfTransactionId.present
          ? data.duplicateOfTransactionId.value
          : this.duplicateOfTransactionId,
      confirmedTransactionId: data.confirmedTransactionId.present
          ? data.confirmedTransactionId.value
          : this.confirmedTransactionId,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      sourceMetadataJson: data.sourceMetadataJson.present
          ? data.sourceMetadataJson.value
          : this.sourceMetadataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetectedTransactionCandidate(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('sourceReference: $sourceReference, ')
          ..write('normalizedKind: $normalizedKind, ')
          ..write('expenseBehavior: $expenseBehavior, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationGroupName: $allocationGroupName, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('occurredLocalOffsetMinutes: $occurredLocalOffsetMinutes, ')
          ..write('occurredTimezoneId: $occurredTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('accountId: $accountId, ')
          ..write('sourceAccountId: $sourceAccountId, ')
          ..write('destinationAccountId: $destinationAccountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('description: $description, ')
          ..write('partyDetails: $partyDetails, ')
          ..write('sourceContext: $sourceContext, ')
          ..write('confidence: $confidence, ')
          ..write('statusEvidence: $statusEvidence, ')
          ..write('candidateState: $candidateState, ')
          ..write('duplicateOfTransactionId: $duplicateOfTransactionId, ')
          ..write('confirmedTransactionId: $confirmedTransactionId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('sourceMetadataJson: $sourceMetadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    source,
    sourceApp,
    sourceReference,
    normalizedKind,
    expenseBehavior,
    allocationGroup,
    allocationGroupName,
    amountMinor,
    currencyCode,
    occurredAt,
    occurredLocalOffsetMinutes,
    occurredTimezoneId,
    localDateKey,
    accountId,
    sourceAccountId,
    destinationAccountId,
    categoryId,
    paymentMethodId,
    description,
    partyDetails,
    sourceContext,
    confidence,
    statusEvidence,
    candidateState,
    duplicateOfTransactionId,
    confirmedTransactionId,
    receivedAt,
    sourceMetadataJson,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetectedTransactionCandidate &&
          other.id == this.id &&
          other.source == this.source &&
          other.sourceApp == this.sourceApp &&
          other.sourceReference == this.sourceReference &&
          other.normalizedKind == this.normalizedKind &&
          other.expenseBehavior == this.expenseBehavior &&
          other.allocationGroup == this.allocationGroup &&
          other.allocationGroupName == this.allocationGroupName &&
          other.amountMinor == this.amountMinor &&
          other.currencyCode == this.currencyCode &&
          other.occurredAt == this.occurredAt &&
          other.occurredLocalOffsetMinutes == this.occurredLocalOffsetMinutes &&
          other.occurredTimezoneId == this.occurredTimezoneId &&
          other.localDateKey == this.localDateKey &&
          other.accountId == this.accountId &&
          other.sourceAccountId == this.sourceAccountId &&
          other.destinationAccountId == this.destinationAccountId &&
          other.categoryId == this.categoryId &&
          other.paymentMethodId == this.paymentMethodId &&
          other.description == this.description &&
          other.partyDetails == this.partyDetails &&
          other.sourceContext == this.sourceContext &&
          other.confidence == this.confidence &&
          other.statusEvidence == this.statusEvidence &&
          other.candidateState == this.candidateState &&
          other.duplicateOfTransactionId == this.duplicateOfTransactionId &&
          other.confirmedTransactionId == this.confirmedTransactionId &&
          other.receivedAt == this.receivedAt &&
          other.sourceMetadataJson == this.sourceMetadataJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DetectedTransactionCandidatesCompanion
    extends UpdateCompanion<DetectedTransactionCandidate> {
  final Value<String> id;
  final Value<String> source;
  final Value<String?> sourceApp;
  final Value<String?> sourceReference;
  final Value<String> normalizedKind;
  final Value<String?> expenseBehavior;
  final Value<String?> allocationGroup;
  final Value<String?> allocationGroupName;
  final Value<int> amountMinor;
  final Value<String> currencyCode;
  final Value<DateTime> occurredAt;
  final Value<int?> occurredLocalOffsetMinutes;
  final Value<String?> occurredTimezoneId;
  final Value<String> localDateKey;
  final Value<String?> accountId;
  final Value<String?> sourceAccountId;
  final Value<String?> destinationAccountId;
  final Value<String?> categoryId;
  final Value<String?> paymentMethodId;
  final Value<String?> description;
  final Value<String?> partyDetails;
  final Value<String?> sourceContext;
  final Value<double> confidence;
  final Value<String> statusEvidence;
  final Value<String> candidateState;
  final Value<String?> duplicateOfTransactionId;
  final Value<String?> confirmedTransactionId;
  final Value<DateTime> receivedAt;
  final Value<String?> sourceMetadataJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DetectedTransactionCandidatesCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceApp = const Value.absent(),
    this.sourceReference = const Value.absent(),
    this.normalizedKind = const Value.absent(),
    this.expenseBehavior = const Value.absent(),
    this.allocationGroup = const Value.absent(),
    this.allocationGroupName = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.occurredLocalOffsetMinutes = const Value.absent(),
    this.occurredTimezoneId = const Value.absent(),
    this.localDateKey = const Value.absent(),
    this.accountId = const Value.absent(),
    this.sourceAccountId = const Value.absent(),
    this.destinationAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.description = const Value.absent(),
    this.partyDetails = const Value.absent(),
    this.sourceContext = const Value.absent(),
    this.confidence = const Value.absent(),
    this.statusEvidence = const Value.absent(),
    this.candidateState = const Value.absent(),
    this.duplicateOfTransactionId = const Value.absent(),
    this.confirmedTransactionId = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.sourceMetadataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DetectedTransactionCandidatesCompanion.insert({
    required String id,
    required String source,
    this.sourceApp = const Value.absent(),
    this.sourceReference = const Value.absent(),
    required String normalizedKind,
    this.expenseBehavior = const Value.absent(),
    this.allocationGroup = const Value.absent(),
    this.allocationGroupName = const Value.absent(),
    required int amountMinor,
    this.currencyCode = const Value.absent(),
    required DateTime occurredAt,
    this.occurredLocalOffsetMinutes = const Value.absent(),
    this.occurredTimezoneId = const Value.absent(),
    required String localDateKey,
    this.accountId = const Value.absent(),
    this.sourceAccountId = const Value.absent(),
    this.destinationAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.description = const Value.absent(),
    this.partyDetails = const Value.absent(),
    this.sourceContext = const Value.absent(),
    this.confidence = const Value.absent(),
    required String statusEvidence,
    this.candidateState = const Value.absent(),
    this.duplicateOfTransactionId = const Value.absent(),
    this.confirmedTransactionId = const Value.absent(),
    required DateTime receivedAt,
    this.sourceMetadataJson = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       source = Value(source),
       normalizedKind = Value(normalizedKind),
       amountMinor = Value(amountMinor),
       occurredAt = Value(occurredAt),
       localDateKey = Value(localDateKey),
       statusEvidence = Value(statusEvidence),
       receivedAt = Value(receivedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DetectedTransactionCandidate> custom({
    Expression<String>? id,
    Expression<String>? source,
    Expression<String>? sourceApp,
    Expression<String>? sourceReference,
    Expression<String>? normalizedKind,
    Expression<String>? expenseBehavior,
    Expression<String>? allocationGroup,
    Expression<String>? allocationGroupName,
    Expression<int>? amountMinor,
    Expression<String>? currencyCode,
    Expression<DateTime>? occurredAt,
    Expression<int>? occurredLocalOffsetMinutes,
    Expression<String>? occurredTimezoneId,
    Expression<String>? localDateKey,
    Expression<String>? accountId,
    Expression<String>? sourceAccountId,
    Expression<String>? destinationAccountId,
    Expression<String>? categoryId,
    Expression<String>? paymentMethodId,
    Expression<String>? description,
    Expression<String>? partyDetails,
    Expression<String>? sourceContext,
    Expression<double>? confidence,
    Expression<String>? statusEvidence,
    Expression<String>? candidateState,
    Expression<String>? duplicateOfTransactionId,
    Expression<String>? confirmedTransactionId,
    Expression<DateTime>? receivedAt,
    Expression<String>? sourceMetadataJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (sourceApp != null) 'source_app': sourceApp,
      if (sourceReference != null) 'source_reference': sourceReference,
      if (normalizedKind != null) 'normalized_kind': normalizedKind,
      if (expenseBehavior != null) 'expense_behavior': expenseBehavior,
      if (allocationGroup != null) 'allocation_group': allocationGroup,
      if (allocationGroupName != null)
        'allocation_group_name': allocationGroupName,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (occurredLocalOffsetMinutes != null)
        'occurred_local_offset_minutes': occurredLocalOffsetMinutes,
      if (occurredTimezoneId != null)
        'occurred_timezone_id': occurredTimezoneId,
      if (localDateKey != null) 'local_date_key': localDateKey,
      if (accountId != null) 'account_id': accountId,
      if (sourceAccountId != null) 'source_account_id': sourceAccountId,
      if (destinationAccountId != null)
        'destination_account_id': destinationAccountId,
      if (categoryId != null) 'category_id': categoryId,
      if (paymentMethodId != null) 'payment_method_id': paymentMethodId,
      if (description != null) 'description': description,
      if (partyDetails != null) 'party_details': partyDetails,
      if (sourceContext != null) 'source_context': sourceContext,
      if (confidence != null) 'confidence': confidence,
      if (statusEvidence != null) 'status_evidence': statusEvidence,
      if (candidateState != null) 'candidate_state': candidateState,
      if (duplicateOfTransactionId != null)
        'duplicate_of_transaction_id': duplicateOfTransactionId,
      if (confirmedTransactionId != null)
        'confirmed_transaction_id': confirmedTransactionId,
      if (receivedAt != null) 'received_at': receivedAt,
      if (sourceMetadataJson != null)
        'source_metadata_json': sourceMetadataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DetectedTransactionCandidatesCompanion copyWith({
    Value<String>? id,
    Value<String>? source,
    Value<String?>? sourceApp,
    Value<String?>? sourceReference,
    Value<String>? normalizedKind,
    Value<String?>? expenseBehavior,
    Value<String?>? allocationGroup,
    Value<String?>? allocationGroupName,
    Value<int>? amountMinor,
    Value<String>? currencyCode,
    Value<DateTime>? occurredAt,
    Value<int?>? occurredLocalOffsetMinutes,
    Value<String?>? occurredTimezoneId,
    Value<String>? localDateKey,
    Value<String?>? accountId,
    Value<String?>? sourceAccountId,
    Value<String?>? destinationAccountId,
    Value<String?>? categoryId,
    Value<String?>? paymentMethodId,
    Value<String?>? description,
    Value<String?>? partyDetails,
    Value<String?>? sourceContext,
    Value<double>? confidence,
    Value<String>? statusEvidence,
    Value<String>? candidateState,
    Value<String?>? duplicateOfTransactionId,
    Value<String?>? confirmedTransactionId,
    Value<DateTime>? receivedAt,
    Value<String?>? sourceMetadataJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DetectedTransactionCandidatesCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      sourceApp: sourceApp ?? this.sourceApp,
      sourceReference: sourceReference ?? this.sourceReference,
      normalizedKind: normalizedKind ?? this.normalizedKind,
      expenseBehavior: expenseBehavior ?? this.expenseBehavior,
      allocationGroup: allocationGroup ?? this.allocationGroup,
      allocationGroupName: allocationGroupName ?? this.allocationGroupName,
      amountMinor: amountMinor ?? this.amountMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      occurredAt: occurredAt ?? this.occurredAt,
      occurredLocalOffsetMinutes:
          occurredLocalOffsetMinutes ?? this.occurredLocalOffsetMinutes,
      occurredTimezoneId: occurredTimezoneId ?? this.occurredTimezoneId,
      localDateKey: localDateKey ?? this.localDateKey,
      accountId: accountId ?? this.accountId,
      sourceAccountId: sourceAccountId ?? this.sourceAccountId,
      destinationAccountId: destinationAccountId ?? this.destinationAccountId,
      categoryId: categoryId ?? this.categoryId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      description: description ?? this.description,
      partyDetails: partyDetails ?? this.partyDetails,
      sourceContext: sourceContext ?? this.sourceContext,
      confidence: confidence ?? this.confidence,
      statusEvidence: statusEvidence ?? this.statusEvidence,
      candidateState: candidateState ?? this.candidateState,
      duplicateOfTransactionId:
          duplicateOfTransactionId ?? this.duplicateOfTransactionId,
      confirmedTransactionId:
          confirmedTransactionId ?? this.confirmedTransactionId,
      receivedAt: receivedAt ?? this.receivedAt,
      sourceMetadataJson: sourceMetadataJson ?? this.sourceMetadataJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (sourceApp.present) {
      map['source_app'] = Variable<String>(sourceApp.value);
    }
    if (sourceReference.present) {
      map['source_reference'] = Variable<String>(sourceReference.value);
    }
    if (normalizedKind.present) {
      map['normalized_kind'] = Variable<String>(normalizedKind.value);
    }
    if (expenseBehavior.present) {
      map['expense_behavior'] = Variable<String>(expenseBehavior.value);
    }
    if (allocationGroup.present) {
      map['allocation_group'] = Variable<String>(allocationGroup.value);
    }
    if (allocationGroupName.present) {
      map['allocation_group_name'] = Variable<String>(
        allocationGroupName.value,
      );
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (occurredLocalOffsetMinutes.present) {
      map['occurred_local_offset_minutes'] = Variable<int>(
        occurredLocalOffsetMinutes.value,
      );
    }
    if (occurredTimezoneId.present) {
      map['occurred_timezone_id'] = Variable<String>(occurredTimezoneId.value);
    }
    if (localDateKey.present) {
      map['local_date_key'] = Variable<String>(localDateKey.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (sourceAccountId.present) {
      map['source_account_id'] = Variable<String>(sourceAccountId.value);
    }
    if (destinationAccountId.present) {
      map['destination_account_id'] = Variable<String>(
        destinationAccountId.value,
      );
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (paymentMethodId.present) {
      map['payment_method_id'] = Variable<String>(paymentMethodId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (partyDetails.present) {
      map['party_details'] = Variable<String>(partyDetails.value);
    }
    if (sourceContext.present) {
      map['source_context'] = Variable<String>(sourceContext.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (statusEvidence.present) {
      map['status_evidence'] = Variable<String>(statusEvidence.value);
    }
    if (candidateState.present) {
      map['candidate_state'] = Variable<String>(candidateState.value);
    }
    if (duplicateOfTransactionId.present) {
      map['duplicate_of_transaction_id'] = Variable<String>(
        duplicateOfTransactionId.value,
      );
    }
    if (confirmedTransactionId.present) {
      map['confirmed_transaction_id'] = Variable<String>(
        confirmedTransactionId.value,
      );
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (sourceMetadataJson.present) {
      map['source_metadata_json'] = Variable<String>(sourceMetadataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetectedTransactionCandidatesCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('sourceReference: $sourceReference, ')
          ..write('normalizedKind: $normalizedKind, ')
          ..write('expenseBehavior: $expenseBehavior, ')
          ..write('allocationGroup: $allocationGroup, ')
          ..write('allocationGroupName: $allocationGroupName, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('occurredLocalOffsetMinutes: $occurredLocalOffsetMinutes, ')
          ..write('occurredTimezoneId: $occurredTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('accountId: $accountId, ')
          ..write('sourceAccountId: $sourceAccountId, ')
          ..write('destinationAccountId: $destinationAccountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('description: $description, ')
          ..write('partyDetails: $partyDetails, ')
          ..write('sourceContext: $sourceContext, ')
          ..write('confidence: $confidence, ')
          ..write('statusEvidence: $statusEvidence, ')
          ..write('candidateState: $candidateState, ')
          ..write('duplicateOfTransactionId: $duplicateOfTransactionId, ')
          ..write('confirmedTransactionId: $confirmedTransactionId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('sourceMetadataJson: $sourceMetadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CandidateDuplicateLinksTable extends CandidateDuplicateLinks
    with TableInfo<$CandidateDuplicateLinksTable, CandidateDuplicateLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CandidateDuplicateLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _candidateIdMeta = const VerificationMeta(
    'candidateId',
  );
  @override
  late final GeneratedColumn<String> candidateId = GeneratedColumn<String>(
    'candidate_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detected_transaction_candidates (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _relatedTransactionIdMeta =
      const VerificationMeta('relatedTransactionId');
  @override
  late final GeneratedColumn<String> relatedTransactionId =
      GeneratedColumn<String>(
        'related_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transactions (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _relatedCandidateIdMeta =
      const VerificationMeta('relatedCandidateId');
  @override
  late final GeneratedColumn<String> relatedCandidateId =
      GeneratedColumn<String>(
        'related_candidate_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES detected_transaction_candidates (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _fingerprintTypeMeta = const VerificationMeta(
    'fingerprintType',
  );
  @override
  late final GeneratedColumn<String> fingerprintType = GeneratedColumn<String>(
    'fingerprint_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _similarityScoreMeta = const VerificationMeta(
    'similarityScore',
  );
  @override
  late final GeneratedColumn<double> similarityScore = GeneratedColumn<double>(
    'similarity_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
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
    candidateId,
    relatedTransactionId,
    relatedCandidateId,
    fingerprintType,
    similarityScore,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'candidate_duplicate_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<CandidateDuplicateLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('candidate_id')) {
      context.handle(
        _candidateIdMeta,
        candidateId.isAcceptableOrUnknown(
          data['candidate_id']!,
          _candidateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_candidateIdMeta);
    }
    if (data.containsKey('related_transaction_id')) {
      context.handle(
        _relatedTransactionIdMeta,
        relatedTransactionId.isAcceptableOrUnknown(
          data['related_transaction_id']!,
          _relatedTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('related_candidate_id')) {
      context.handle(
        _relatedCandidateIdMeta,
        relatedCandidateId.isAcceptableOrUnknown(
          data['related_candidate_id']!,
          _relatedCandidateIdMeta,
        ),
      );
    }
    if (data.containsKey('fingerprint_type')) {
      context.handle(
        _fingerprintTypeMeta,
        fingerprintType.isAcceptableOrUnknown(
          data['fingerprint_type']!,
          _fingerprintTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fingerprintTypeMeta);
    }
    if (data.containsKey('similarity_score')) {
      context.handle(
        _similarityScoreMeta,
        similarityScore.isAcceptableOrUnknown(
          data['similarity_score']!,
          _similarityScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_similarityScoreMeta);
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
  CandidateDuplicateLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CandidateDuplicateLink(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      candidateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidate_id'],
      )!,
      relatedTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_transaction_id'],
      ),
      relatedCandidateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_candidate_id'],
      ),
      fingerprintType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fingerprint_type'],
      )!,
      similarityScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}similarity_score'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CandidateDuplicateLinksTable createAlias(String alias) {
    return $CandidateDuplicateLinksTable(attachedDatabase, alias);
  }
}

class CandidateDuplicateLink extends DataClass
    implements Insertable<CandidateDuplicateLink> {
  final String id;
  final String candidateId;
  final String? relatedTransactionId;
  final String? relatedCandidateId;
  final String fingerprintType;
  final double similarityScore;
  final DateTime createdAt;
  const CandidateDuplicateLink({
    required this.id,
    required this.candidateId,
    this.relatedTransactionId,
    this.relatedCandidateId,
    required this.fingerprintType,
    required this.similarityScore,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['candidate_id'] = Variable<String>(candidateId);
    if (!nullToAbsent || relatedTransactionId != null) {
      map['related_transaction_id'] = Variable<String>(relatedTransactionId);
    }
    if (!nullToAbsent || relatedCandidateId != null) {
      map['related_candidate_id'] = Variable<String>(relatedCandidateId);
    }
    map['fingerprint_type'] = Variable<String>(fingerprintType);
    map['similarity_score'] = Variable<double>(similarityScore);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CandidateDuplicateLinksCompanion toCompanion(bool nullToAbsent) {
    return CandidateDuplicateLinksCompanion(
      id: Value(id),
      candidateId: Value(candidateId),
      relatedTransactionId: relatedTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedTransactionId),
      relatedCandidateId: relatedCandidateId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedCandidateId),
      fingerprintType: Value(fingerprintType),
      similarityScore: Value(similarityScore),
      createdAt: Value(createdAt),
    );
  }

  factory CandidateDuplicateLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CandidateDuplicateLink(
      id: serializer.fromJson<String>(json['id']),
      candidateId: serializer.fromJson<String>(json['candidateId']),
      relatedTransactionId: serializer.fromJson<String?>(
        json['relatedTransactionId'],
      ),
      relatedCandidateId: serializer.fromJson<String?>(
        json['relatedCandidateId'],
      ),
      fingerprintType: serializer.fromJson<String>(json['fingerprintType']),
      similarityScore: serializer.fromJson<double>(json['similarityScore']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'candidateId': serializer.toJson<String>(candidateId),
      'relatedTransactionId': serializer.toJson<String?>(relatedTransactionId),
      'relatedCandidateId': serializer.toJson<String?>(relatedCandidateId),
      'fingerprintType': serializer.toJson<String>(fingerprintType),
      'similarityScore': serializer.toJson<double>(similarityScore),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CandidateDuplicateLink copyWith({
    String? id,
    String? candidateId,
    Value<String?> relatedTransactionId = const Value.absent(),
    Value<String?> relatedCandidateId = const Value.absent(),
    String? fingerprintType,
    double? similarityScore,
    DateTime? createdAt,
  }) => CandidateDuplicateLink(
    id: id ?? this.id,
    candidateId: candidateId ?? this.candidateId,
    relatedTransactionId: relatedTransactionId.present
        ? relatedTransactionId.value
        : this.relatedTransactionId,
    relatedCandidateId: relatedCandidateId.present
        ? relatedCandidateId.value
        : this.relatedCandidateId,
    fingerprintType: fingerprintType ?? this.fingerprintType,
    similarityScore: similarityScore ?? this.similarityScore,
    createdAt: createdAt ?? this.createdAt,
  );
  CandidateDuplicateLink copyWithCompanion(
    CandidateDuplicateLinksCompanion data,
  ) {
    return CandidateDuplicateLink(
      id: data.id.present ? data.id.value : this.id,
      candidateId: data.candidateId.present
          ? data.candidateId.value
          : this.candidateId,
      relatedTransactionId: data.relatedTransactionId.present
          ? data.relatedTransactionId.value
          : this.relatedTransactionId,
      relatedCandidateId: data.relatedCandidateId.present
          ? data.relatedCandidateId.value
          : this.relatedCandidateId,
      fingerprintType: data.fingerprintType.present
          ? data.fingerprintType.value
          : this.fingerprintType,
      similarityScore: data.similarityScore.present
          ? data.similarityScore.value
          : this.similarityScore,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CandidateDuplicateLink(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('relatedTransactionId: $relatedTransactionId, ')
          ..write('relatedCandidateId: $relatedCandidateId, ')
          ..write('fingerprintType: $fingerprintType, ')
          ..write('similarityScore: $similarityScore, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    candidateId,
    relatedTransactionId,
    relatedCandidateId,
    fingerprintType,
    similarityScore,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CandidateDuplicateLink &&
          other.id == this.id &&
          other.candidateId == this.candidateId &&
          other.relatedTransactionId == this.relatedTransactionId &&
          other.relatedCandidateId == this.relatedCandidateId &&
          other.fingerprintType == this.fingerprintType &&
          other.similarityScore == this.similarityScore &&
          other.createdAt == this.createdAt);
}

class CandidateDuplicateLinksCompanion
    extends UpdateCompanion<CandidateDuplicateLink> {
  final Value<String> id;
  final Value<String> candidateId;
  final Value<String?> relatedTransactionId;
  final Value<String?> relatedCandidateId;
  final Value<String> fingerprintType;
  final Value<double> similarityScore;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CandidateDuplicateLinksCompanion({
    this.id = const Value.absent(),
    this.candidateId = const Value.absent(),
    this.relatedTransactionId = const Value.absent(),
    this.relatedCandidateId = const Value.absent(),
    this.fingerprintType = const Value.absent(),
    this.similarityScore = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CandidateDuplicateLinksCompanion.insert({
    required String id,
    required String candidateId,
    this.relatedTransactionId = const Value.absent(),
    this.relatedCandidateId = const Value.absent(),
    required String fingerprintType,
    required double similarityScore,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       candidateId = Value(candidateId),
       fingerprintType = Value(fingerprintType),
       similarityScore = Value(similarityScore),
       createdAt = Value(createdAt);
  static Insertable<CandidateDuplicateLink> custom({
    Expression<String>? id,
    Expression<String>? candidateId,
    Expression<String>? relatedTransactionId,
    Expression<String>? relatedCandidateId,
    Expression<String>? fingerprintType,
    Expression<double>? similarityScore,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (candidateId != null) 'candidate_id': candidateId,
      if (relatedTransactionId != null)
        'related_transaction_id': relatedTransactionId,
      if (relatedCandidateId != null)
        'related_candidate_id': relatedCandidateId,
      if (fingerprintType != null) 'fingerprint_type': fingerprintType,
      if (similarityScore != null) 'similarity_score': similarityScore,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CandidateDuplicateLinksCompanion copyWith({
    Value<String>? id,
    Value<String>? candidateId,
    Value<String?>? relatedTransactionId,
    Value<String?>? relatedCandidateId,
    Value<String>? fingerprintType,
    Value<double>? similarityScore,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CandidateDuplicateLinksCompanion(
      id: id ?? this.id,
      candidateId: candidateId ?? this.candidateId,
      relatedTransactionId: relatedTransactionId ?? this.relatedTransactionId,
      relatedCandidateId: relatedCandidateId ?? this.relatedCandidateId,
      fingerprintType: fingerprintType ?? this.fingerprintType,
      similarityScore: similarityScore ?? this.similarityScore,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (candidateId.present) {
      map['candidate_id'] = Variable<String>(candidateId.value);
    }
    if (relatedTransactionId.present) {
      map['related_transaction_id'] = Variable<String>(
        relatedTransactionId.value,
      );
    }
    if (relatedCandidateId.present) {
      map['related_candidate_id'] = Variable<String>(relatedCandidateId.value);
    }
    if (fingerprintType.present) {
      map['fingerprint_type'] = Variable<String>(fingerprintType.value);
    }
    if (similarityScore.present) {
      map['similarity_score'] = Variable<double>(similarityScore.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CandidateDuplicateLinksCompanion(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('relatedTransactionId: $relatedTransactionId, ')
          ..write('relatedCandidateId: $relatedCandidateId, ')
          ..write('fingerprintType: $fingerprintType, ')
          ..write('similarityScore: $similarityScore, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CandidateFingerprintsTable extends CandidateFingerprints
    with TableInfo<$CandidateFingerprintsTable, CandidateFingerprint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CandidateFingerprintsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _candidateIdMeta = const VerificationMeta(
    'candidateId',
  );
  @override
  late final GeneratedColumn<String> candidateId = GeneratedColumn<String>(
    'candidate_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detected_transaction_candidates (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _fingerprintHashMeta = const VerificationMeta(
    'fingerprintHash',
  );
  @override
  late final GeneratedColumn<String> fingerprintHash = GeneratedColumn<String>(
    'fingerprint_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fingerprintVersionMeta =
      const VerificationMeta('fingerprintVersion');
  @override
  late final GeneratedColumn<int> fingerprintVersion = GeneratedColumn<int>(
    'fingerprint_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
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
    candidateId,
    fingerprintHash,
    fingerprintVersion,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'candidate_fingerprints';
  @override
  VerificationContext validateIntegrity(
    Insertable<CandidateFingerprint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('candidate_id')) {
      context.handle(
        _candidateIdMeta,
        candidateId.isAcceptableOrUnknown(
          data['candidate_id']!,
          _candidateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_candidateIdMeta);
    }
    if (data.containsKey('fingerprint_hash')) {
      context.handle(
        _fingerprintHashMeta,
        fingerprintHash.isAcceptableOrUnknown(
          data['fingerprint_hash']!,
          _fingerprintHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fingerprintHashMeta);
    }
    if (data.containsKey('fingerprint_version')) {
      context.handle(
        _fingerprintVersionMeta,
        fingerprintVersion.isAcceptableOrUnknown(
          data['fingerprint_version']!,
          _fingerprintVersionMeta,
        ),
      );
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
  CandidateFingerprint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CandidateFingerprint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      candidateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidate_id'],
      )!,
      fingerprintHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fingerprint_hash'],
      )!,
      fingerprintVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fingerprint_version'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CandidateFingerprintsTable createAlias(String alias) {
    return $CandidateFingerprintsTable(attachedDatabase, alias);
  }
}

class CandidateFingerprint extends DataClass
    implements Insertable<CandidateFingerprint> {
  final String id;
  final String candidateId;
  final String fingerprintHash;
  final int fingerprintVersion;
  final DateTime createdAt;
  const CandidateFingerprint({
    required this.id,
    required this.candidateId,
    required this.fingerprintHash,
    required this.fingerprintVersion,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['candidate_id'] = Variable<String>(candidateId);
    map['fingerprint_hash'] = Variable<String>(fingerprintHash);
    map['fingerprint_version'] = Variable<int>(fingerprintVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CandidateFingerprintsCompanion toCompanion(bool nullToAbsent) {
    return CandidateFingerprintsCompanion(
      id: Value(id),
      candidateId: Value(candidateId),
      fingerprintHash: Value(fingerprintHash),
      fingerprintVersion: Value(fingerprintVersion),
      createdAt: Value(createdAt),
    );
  }

  factory CandidateFingerprint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CandidateFingerprint(
      id: serializer.fromJson<String>(json['id']),
      candidateId: serializer.fromJson<String>(json['candidateId']),
      fingerprintHash: serializer.fromJson<String>(json['fingerprintHash']),
      fingerprintVersion: serializer.fromJson<int>(json['fingerprintVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'candidateId': serializer.toJson<String>(candidateId),
      'fingerprintHash': serializer.toJson<String>(fingerprintHash),
      'fingerprintVersion': serializer.toJson<int>(fingerprintVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CandidateFingerprint copyWith({
    String? id,
    String? candidateId,
    String? fingerprintHash,
    int? fingerprintVersion,
    DateTime? createdAt,
  }) => CandidateFingerprint(
    id: id ?? this.id,
    candidateId: candidateId ?? this.candidateId,
    fingerprintHash: fingerprintHash ?? this.fingerprintHash,
    fingerprintVersion: fingerprintVersion ?? this.fingerprintVersion,
    createdAt: createdAt ?? this.createdAt,
  );
  CandidateFingerprint copyWithCompanion(CandidateFingerprintsCompanion data) {
    return CandidateFingerprint(
      id: data.id.present ? data.id.value : this.id,
      candidateId: data.candidateId.present
          ? data.candidateId.value
          : this.candidateId,
      fingerprintHash: data.fingerprintHash.present
          ? data.fingerprintHash.value
          : this.fingerprintHash,
      fingerprintVersion: data.fingerprintVersion.present
          ? data.fingerprintVersion.value
          : this.fingerprintVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CandidateFingerprint(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('fingerprintHash: $fingerprintHash, ')
          ..write('fingerprintVersion: $fingerprintVersion, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    candidateId,
    fingerprintHash,
    fingerprintVersion,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CandidateFingerprint &&
          other.id == this.id &&
          other.candidateId == this.candidateId &&
          other.fingerprintHash == this.fingerprintHash &&
          other.fingerprintVersion == this.fingerprintVersion &&
          other.createdAt == this.createdAt);
}

class CandidateFingerprintsCompanion
    extends UpdateCompanion<CandidateFingerprint> {
  final Value<String> id;
  final Value<String> candidateId;
  final Value<String> fingerprintHash;
  final Value<int> fingerprintVersion;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CandidateFingerprintsCompanion({
    this.id = const Value.absent(),
    this.candidateId = const Value.absent(),
    this.fingerprintHash = const Value.absent(),
    this.fingerprintVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CandidateFingerprintsCompanion.insert({
    required String id,
    required String candidateId,
    required String fingerprintHash,
    this.fingerprintVersion = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       candidateId = Value(candidateId),
       fingerprintHash = Value(fingerprintHash),
       createdAt = Value(createdAt);
  static Insertable<CandidateFingerprint> custom({
    Expression<String>? id,
    Expression<String>? candidateId,
    Expression<String>? fingerprintHash,
    Expression<int>? fingerprintVersion,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (candidateId != null) 'candidate_id': candidateId,
      if (fingerprintHash != null) 'fingerprint_hash': fingerprintHash,
      if (fingerprintVersion != null) 'fingerprint_version': fingerprintVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CandidateFingerprintsCompanion copyWith({
    Value<String>? id,
    Value<String>? candidateId,
    Value<String>? fingerprintHash,
    Value<int>? fingerprintVersion,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CandidateFingerprintsCompanion(
      id: id ?? this.id,
      candidateId: candidateId ?? this.candidateId,
      fingerprintHash: fingerprintHash ?? this.fingerprintHash,
      fingerprintVersion: fingerprintVersion ?? this.fingerprintVersion,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (candidateId.present) {
      map['candidate_id'] = Variable<String>(candidateId.value);
    }
    if (fingerprintHash.present) {
      map['fingerprint_hash'] = Variable<String>(fingerprintHash.value);
    }
    if (fingerprintVersion.present) {
      map['fingerprint_version'] = Variable<int>(fingerprintVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CandidateFingerprintsCompanion(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('fingerprintHash: $fingerprintHash, ')
          ..write('fingerprintVersion: $fingerprintVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImportBatchesTable extends ImportBatches
    with TableInfo<$ImportBatchesTable, ImportBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImportBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('csv'),
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
  static const VerificationMeta _committedAtMeta = const VerificationMeta(
    'committedAt',
  );
  @override
  late final GeneratedColumn<DateTime> committedAt = GeneratedColumn<DateTime>(
    'committed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fileName,
    sourceType,
    status,
    createdAt,
    committedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'import_batches';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImportBatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('committed_at')) {
      context.handle(
        _committedAtMeta,
        committedAt.isAcceptableOrUnknown(
          data['committed_at']!,
          _committedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImportBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImportBatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      committedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}committed_at'],
      ),
    );
  }

  @override
  $ImportBatchesTable createAlias(String alias) {
    return $ImportBatchesTable(attachedDatabase, alias);
  }
}

class ImportBatche extends DataClass implements Insertable<ImportBatche> {
  final String id;
  final String fileName;
  final String sourceType;
  final String status;
  final DateTime createdAt;
  final DateTime? committedAt;
  const ImportBatche({
    required this.id,
    required this.fileName,
    required this.sourceType,
    required this.status,
    required this.createdAt,
    this.committedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['file_name'] = Variable<String>(fileName);
    map['source_type'] = Variable<String>(sourceType);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || committedAt != null) {
      map['committed_at'] = Variable<DateTime>(committedAt);
    }
    return map;
  }

  ImportBatchesCompanion toCompanion(bool nullToAbsent) {
    return ImportBatchesCompanion(
      id: Value(id),
      fileName: Value(fileName),
      sourceType: Value(sourceType),
      status: Value(status),
      createdAt: Value(createdAt),
      committedAt: committedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(committedAt),
    );
  }

  factory ImportBatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImportBatche(
      id: serializer.fromJson<String>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      committedAt: serializer.fromJson<DateTime?>(json['committedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fileName': serializer.toJson<String>(fileName),
      'sourceType': serializer.toJson<String>(sourceType),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'committedAt': serializer.toJson<DateTime?>(committedAt),
    };
  }

  ImportBatche copyWith({
    String? id,
    String? fileName,
    String? sourceType,
    String? status,
    DateTime? createdAt,
    Value<DateTime?> committedAt = const Value.absent(),
  }) => ImportBatche(
    id: id ?? this.id,
    fileName: fileName ?? this.fileName,
    sourceType: sourceType ?? this.sourceType,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    committedAt: committedAt.present ? committedAt.value : this.committedAt,
  );
  ImportBatche copyWithCompanion(ImportBatchesCompanion data) {
    return ImportBatche(
      id: data.id.present ? data.id.value : this.id,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      committedAt: data.committedAt.present
          ? data.committedAt.value
          : this.committedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImportBatche(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('sourceType: $sourceType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('committedAt: $committedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fileName, sourceType, status, createdAt, committedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImportBatche &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          other.sourceType == this.sourceType &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.committedAt == this.committedAt);
}

class ImportBatchesCompanion extends UpdateCompanion<ImportBatche> {
  final Value<String> id;
  final Value<String> fileName;
  final Value<String> sourceType;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> committedAt;
  final Value<int> rowid;
  const ImportBatchesCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.committedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImportBatchesCompanion.insert({
    required String id,
    required String fileName,
    this.sourceType = const Value.absent(),
    required String status,
    required DateTime createdAt,
    this.committedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileName = Value(fileName),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<ImportBatche> custom({
    Expression<String>? id,
    Expression<String>? fileName,
    Expression<String>? sourceType,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? committedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (sourceType != null) 'source_type': sourceType,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (committedAt != null) 'committed_at': committedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImportBatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? fileName,
    Value<String>? sourceType,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime?>? committedAt,
    Value<int>? rowid,
  }) {
    return ImportBatchesCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      sourceType: sourceType ?? this.sourceType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      committedAt: committedAt ?? this.committedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (committedAt.present) {
      map['committed_at'] = Variable<DateTime>(committedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImportBatchesCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('sourceType: $sourceType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('committedAt: $committedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImportRowsTable extends ImportRows
    with TableInfo<$ImportRowsTable, ImportRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImportRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES import_batches (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _rowNumberMeta = const VerificationMeta(
    'rowNumber',
  );
  @override
  late final GeneratedColumn<int> rowNumber = GeneratedColumn<int>(
    'row_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parsedKindMeta = const VerificationMeta(
    'parsedKind',
  );
  @override
  late final GeneratedColumn<String> parsedKind = GeneratedColumn<String>(
    'parsed_kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parsedAmountMinorMeta = const VerificationMeta(
    'parsedAmountMinor',
  );
  @override
  late final GeneratedColumn<int> parsedAmountMinor = GeneratedColumn<int>(
    'parsed_amount_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parsedCurrencyCodeMeta =
      const VerificationMeta('parsedCurrencyCode');
  @override
  late final GeneratedColumn<String> parsedCurrencyCode =
      GeneratedColumn<String>(
        'parsed_currency_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _parsedOccurredAtMeta = const VerificationMeta(
    'parsedOccurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> parsedOccurredAt =
      GeneratedColumn<DateTime>(
        'parsed_occurred_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _parsedLocalOffsetMinutesMeta =
      const VerificationMeta('parsedLocalOffsetMinutes');
  @override
  late final GeneratedColumn<int> parsedLocalOffsetMinutes =
      GeneratedColumn<int>(
        'parsed_local_offset_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _parsedTimezoneIdMeta = const VerificationMeta(
    'parsedTimezoneId',
  );
  @override
  late final GeneratedColumn<String> parsedTimezoneId = GeneratedColumn<String>(
    'parsed_timezone_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localDateKeyMeta = const VerificationMeta(
    'localDateKey',
  );
  @override
  late final GeneratedColumn<String> localDateKey = GeneratedColumn<String>(
    'local_date_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parsedAccountNameMeta = const VerificationMeta(
    'parsedAccountName',
  );
  @override
  late final GeneratedColumn<String> parsedAccountName =
      GeneratedColumn<String>(
        'parsed_account_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _parsedCategoryNameMeta =
      const VerificationMeta('parsedCategoryName');
  @override
  late final GeneratedColumn<String> parsedCategoryName =
      GeneratedColumn<String>(
        'parsed_category_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _parseErrorsJsonMeta = const VerificationMeta(
    'parseErrorsJson',
  );
  @override
  late final GeneratedColumn<String> parseErrorsJson = GeneratedColumn<String>(
    'parse_errors_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _duplicateOfTransactionIdMeta =
      const VerificationMeta('duplicateOfTransactionId');
  @override
  late final GeneratedColumn<String> duplicateOfTransactionId =
      GeneratedColumn<String>(
        'duplicate_of_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transactions (id) ON DELETE RESTRICT',
        ),
      );
  static const VerificationMeta _userDecisionMeta = const VerificationMeta(
    'userDecision',
  );
  @override
  late final GeneratedColumn<String> userDecision = GeneratedColumn<String>(
    'user_decision',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _candidateIdMeta = const VerificationMeta(
    'candidateId',
  );
  @override
  late final GeneratedColumn<String> candidateId = GeneratedColumn<String>(
    'candidate_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detected_transaction_candidates (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _committedTransactionIdMeta =
      const VerificationMeta('committedTransactionId');
  @override
  late final GeneratedColumn<String> committedTransactionId =
      GeneratedColumn<String>(
        'committed_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transactions (id) ON DELETE RESTRICT',
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
    batchId,
    rowNumber,
    parsedKind,
    parsedAmountMinor,
    parsedCurrencyCode,
    parsedOccurredAt,
    parsedLocalOffsetMinutes,
    parsedTimezoneId,
    localDateKey,
    parsedAccountName,
    parsedCategoryName,
    parseErrorsJson,
    duplicateOfTransactionId,
    userDecision,
    candidateId,
    committedTransactionId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'import_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImportRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('row_number')) {
      context.handle(
        _rowNumberMeta,
        rowNumber.isAcceptableOrUnknown(data['row_number']!, _rowNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_rowNumberMeta);
    }
    if (data.containsKey('parsed_kind')) {
      context.handle(
        _parsedKindMeta,
        parsedKind.isAcceptableOrUnknown(data['parsed_kind']!, _parsedKindMeta),
      );
    }
    if (data.containsKey('parsed_amount_minor')) {
      context.handle(
        _parsedAmountMinorMeta,
        parsedAmountMinor.isAcceptableOrUnknown(
          data['parsed_amount_minor']!,
          _parsedAmountMinorMeta,
        ),
      );
    }
    if (data.containsKey('parsed_currency_code')) {
      context.handle(
        _parsedCurrencyCodeMeta,
        parsedCurrencyCode.isAcceptableOrUnknown(
          data['parsed_currency_code']!,
          _parsedCurrencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('parsed_occurred_at')) {
      context.handle(
        _parsedOccurredAtMeta,
        parsedOccurredAt.isAcceptableOrUnknown(
          data['parsed_occurred_at']!,
          _parsedOccurredAtMeta,
        ),
      );
    }
    if (data.containsKey('parsed_local_offset_minutes')) {
      context.handle(
        _parsedLocalOffsetMinutesMeta,
        parsedLocalOffsetMinutes.isAcceptableOrUnknown(
          data['parsed_local_offset_minutes']!,
          _parsedLocalOffsetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('parsed_timezone_id')) {
      context.handle(
        _parsedTimezoneIdMeta,
        parsedTimezoneId.isAcceptableOrUnknown(
          data['parsed_timezone_id']!,
          _parsedTimezoneIdMeta,
        ),
      );
    }
    if (data.containsKey('local_date_key')) {
      context.handle(
        _localDateKeyMeta,
        localDateKey.isAcceptableOrUnknown(
          data['local_date_key']!,
          _localDateKeyMeta,
        ),
      );
    }
    if (data.containsKey('parsed_account_name')) {
      context.handle(
        _parsedAccountNameMeta,
        parsedAccountName.isAcceptableOrUnknown(
          data['parsed_account_name']!,
          _parsedAccountNameMeta,
        ),
      );
    }
    if (data.containsKey('parsed_category_name')) {
      context.handle(
        _parsedCategoryNameMeta,
        parsedCategoryName.isAcceptableOrUnknown(
          data['parsed_category_name']!,
          _parsedCategoryNameMeta,
        ),
      );
    }
    if (data.containsKey('parse_errors_json')) {
      context.handle(
        _parseErrorsJsonMeta,
        parseErrorsJson.isAcceptableOrUnknown(
          data['parse_errors_json']!,
          _parseErrorsJsonMeta,
        ),
      );
    }
    if (data.containsKey('duplicate_of_transaction_id')) {
      context.handle(
        _duplicateOfTransactionIdMeta,
        duplicateOfTransactionId.isAcceptableOrUnknown(
          data['duplicate_of_transaction_id']!,
          _duplicateOfTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('user_decision')) {
      context.handle(
        _userDecisionMeta,
        userDecision.isAcceptableOrUnknown(
          data['user_decision']!,
          _userDecisionMeta,
        ),
      );
    }
    if (data.containsKey('candidate_id')) {
      context.handle(
        _candidateIdMeta,
        candidateId.isAcceptableOrUnknown(
          data['candidate_id']!,
          _candidateIdMeta,
        ),
      );
    }
    if (data.containsKey('committed_transaction_id')) {
      context.handle(
        _committedTransactionIdMeta,
        committedTransactionId.isAcceptableOrUnknown(
          data['committed_transaction_id']!,
          _committedTransactionIdMeta,
        ),
      );
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
  ImportRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImportRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      rowNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}row_number'],
      )!,
      parsedKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_kind'],
      ),
      parsedAmountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parsed_amount_minor'],
      ),
      parsedCurrencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_currency_code'],
      ),
      parsedOccurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}parsed_occurred_at'],
      ),
      parsedLocalOffsetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parsed_local_offset_minutes'],
      ),
      parsedTimezoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_timezone_id'],
      ),
      localDateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_date_key'],
      ),
      parsedAccountName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_account_name'],
      ),
      parsedCategoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_category_name'],
      ),
      parseErrorsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parse_errors_json'],
      ),
      duplicateOfTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duplicate_of_transaction_id'],
      ),
      userDecision: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_decision'],
      )!,
      candidateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidate_id'],
      ),
      committedTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}committed_transaction_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ImportRowsTable createAlias(String alias) {
    return $ImportRowsTable(attachedDatabase, alias);
  }
}

class ImportRow extends DataClass implements Insertable<ImportRow> {
  final String id;
  final String batchId;
  final int rowNumber;
  final String? parsedKind;
  final int? parsedAmountMinor;
  final String? parsedCurrencyCode;
  final DateTime? parsedOccurredAt;
  final int? parsedLocalOffsetMinutes;
  final String? parsedTimezoneId;
  final String? localDateKey;
  final String? parsedAccountName;
  final String? parsedCategoryName;
  final String? parseErrorsJson;
  final String? duplicateOfTransactionId;
  final String userDecision;
  final String? candidateId;
  final String? committedTransactionId;
  final DateTime createdAt;
  const ImportRow({
    required this.id,
    required this.batchId,
    required this.rowNumber,
    this.parsedKind,
    this.parsedAmountMinor,
    this.parsedCurrencyCode,
    this.parsedOccurredAt,
    this.parsedLocalOffsetMinutes,
    this.parsedTimezoneId,
    this.localDateKey,
    this.parsedAccountName,
    this.parsedCategoryName,
    this.parseErrorsJson,
    this.duplicateOfTransactionId,
    required this.userDecision,
    this.candidateId,
    this.committedTransactionId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['row_number'] = Variable<int>(rowNumber);
    if (!nullToAbsent || parsedKind != null) {
      map['parsed_kind'] = Variable<String>(parsedKind);
    }
    if (!nullToAbsent || parsedAmountMinor != null) {
      map['parsed_amount_minor'] = Variable<int>(parsedAmountMinor);
    }
    if (!nullToAbsent || parsedCurrencyCode != null) {
      map['parsed_currency_code'] = Variable<String>(parsedCurrencyCode);
    }
    if (!nullToAbsent || parsedOccurredAt != null) {
      map['parsed_occurred_at'] = Variable<DateTime>(parsedOccurredAt);
    }
    if (!nullToAbsent || parsedLocalOffsetMinutes != null) {
      map['parsed_local_offset_minutes'] = Variable<int>(
        parsedLocalOffsetMinutes,
      );
    }
    if (!nullToAbsent || parsedTimezoneId != null) {
      map['parsed_timezone_id'] = Variable<String>(parsedTimezoneId);
    }
    if (!nullToAbsent || localDateKey != null) {
      map['local_date_key'] = Variable<String>(localDateKey);
    }
    if (!nullToAbsent || parsedAccountName != null) {
      map['parsed_account_name'] = Variable<String>(parsedAccountName);
    }
    if (!nullToAbsent || parsedCategoryName != null) {
      map['parsed_category_name'] = Variable<String>(parsedCategoryName);
    }
    if (!nullToAbsent || parseErrorsJson != null) {
      map['parse_errors_json'] = Variable<String>(parseErrorsJson);
    }
    if (!nullToAbsent || duplicateOfTransactionId != null) {
      map['duplicate_of_transaction_id'] = Variable<String>(
        duplicateOfTransactionId,
      );
    }
    map['user_decision'] = Variable<String>(userDecision);
    if (!nullToAbsent || candidateId != null) {
      map['candidate_id'] = Variable<String>(candidateId);
    }
    if (!nullToAbsent || committedTransactionId != null) {
      map['committed_transaction_id'] = Variable<String>(
        committedTransactionId,
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ImportRowsCompanion toCompanion(bool nullToAbsent) {
    return ImportRowsCompanion(
      id: Value(id),
      batchId: Value(batchId),
      rowNumber: Value(rowNumber),
      parsedKind: parsedKind == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedKind),
      parsedAmountMinor: parsedAmountMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedAmountMinor),
      parsedCurrencyCode: parsedCurrencyCode == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedCurrencyCode),
      parsedOccurredAt: parsedOccurredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedOccurredAt),
      parsedLocalOffsetMinutes: parsedLocalOffsetMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedLocalOffsetMinutes),
      parsedTimezoneId: parsedTimezoneId == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedTimezoneId),
      localDateKey: localDateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(localDateKey),
      parsedAccountName: parsedAccountName == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedAccountName),
      parsedCategoryName: parsedCategoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedCategoryName),
      parseErrorsJson: parseErrorsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(parseErrorsJson),
      duplicateOfTransactionId: duplicateOfTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(duplicateOfTransactionId),
      userDecision: Value(userDecision),
      candidateId: candidateId == null && nullToAbsent
          ? const Value.absent()
          : Value(candidateId),
      committedTransactionId: committedTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(committedTransactionId),
      createdAt: Value(createdAt),
    );
  }

  factory ImportRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImportRow(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      rowNumber: serializer.fromJson<int>(json['rowNumber']),
      parsedKind: serializer.fromJson<String?>(json['parsedKind']),
      parsedAmountMinor: serializer.fromJson<int?>(json['parsedAmountMinor']),
      parsedCurrencyCode: serializer.fromJson<String?>(
        json['parsedCurrencyCode'],
      ),
      parsedOccurredAt: serializer.fromJson<DateTime?>(
        json['parsedOccurredAt'],
      ),
      parsedLocalOffsetMinutes: serializer.fromJson<int?>(
        json['parsedLocalOffsetMinutes'],
      ),
      parsedTimezoneId: serializer.fromJson<String?>(json['parsedTimezoneId']),
      localDateKey: serializer.fromJson<String?>(json['localDateKey']),
      parsedAccountName: serializer.fromJson<String?>(
        json['parsedAccountName'],
      ),
      parsedCategoryName: serializer.fromJson<String?>(
        json['parsedCategoryName'],
      ),
      parseErrorsJson: serializer.fromJson<String?>(json['parseErrorsJson']),
      duplicateOfTransactionId: serializer.fromJson<String?>(
        json['duplicateOfTransactionId'],
      ),
      userDecision: serializer.fromJson<String>(json['userDecision']),
      candidateId: serializer.fromJson<String?>(json['candidateId']),
      committedTransactionId: serializer.fromJson<String?>(
        json['committedTransactionId'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'rowNumber': serializer.toJson<int>(rowNumber),
      'parsedKind': serializer.toJson<String?>(parsedKind),
      'parsedAmountMinor': serializer.toJson<int?>(parsedAmountMinor),
      'parsedCurrencyCode': serializer.toJson<String?>(parsedCurrencyCode),
      'parsedOccurredAt': serializer.toJson<DateTime?>(parsedOccurredAt),
      'parsedLocalOffsetMinutes': serializer.toJson<int?>(
        parsedLocalOffsetMinutes,
      ),
      'parsedTimezoneId': serializer.toJson<String?>(parsedTimezoneId),
      'localDateKey': serializer.toJson<String?>(localDateKey),
      'parsedAccountName': serializer.toJson<String?>(parsedAccountName),
      'parsedCategoryName': serializer.toJson<String?>(parsedCategoryName),
      'parseErrorsJson': serializer.toJson<String?>(parseErrorsJson),
      'duplicateOfTransactionId': serializer.toJson<String?>(
        duplicateOfTransactionId,
      ),
      'userDecision': serializer.toJson<String>(userDecision),
      'candidateId': serializer.toJson<String?>(candidateId),
      'committedTransactionId': serializer.toJson<String?>(
        committedTransactionId,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ImportRow copyWith({
    String? id,
    String? batchId,
    int? rowNumber,
    Value<String?> parsedKind = const Value.absent(),
    Value<int?> parsedAmountMinor = const Value.absent(),
    Value<String?> parsedCurrencyCode = const Value.absent(),
    Value<DateTime?> parsedOccurredAt = const Value.absent(),
    Value<int?> parsedLocalOffsetMinutes = const Value.absent(),
    Value<String?> parsedTimezoneId = const Value.absent(),
    Value<String?> localDateKey = const Value.absent(),
    Value<String?> parsedAccountName = const Value.absent(),
    Value<String?> parsedCategoryName = const Value.absent(),
    Value<String?> parseErrorsJson = const Value.absent(),
    Value<String?> duplicateOfTransactionId = const Value.absent(),
    String? userDecision,
    Value<String?> candidateId = const Value.absent(),
    Value<String?> committedTransactionId = const Value.absent(),
    DateTime? createdAt,
  }) => ImportRow(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    rowNumber: rowNumber ?? this.rowNumber,
    parsedKind: parsedKind.present ? parsedKind.value : this.parsedKind,
    parsedAmountMinor: parsedAmountMinor.present
        ? parsedAmountMinor.value
        : this.parsedAmountMinor,
    parsedCurrencyCode: parsedCurrencyCode.present
        ? parsedCurrencyCode.value
        : this.parsedCurrencyCode,
    parsedOccurredAt: parsedOccurredAt.present
        ? parsedOccurredAt.value
        : this.parsedOccurredAt,
    parsedLocalOffsetMinutes: parsedLocalOffsetMinutes.present
        ? parsedLocalOffsetMinutes.value
        : this.parsedLocalOffsetMinutes,
    parsedTimezoneId: parsedTimezoneId.present
        ? parsedTimezoneId.value
        : this.parsedTimezoneId,
    localDateKey: localDateKey.present ? localDateKey.value : this.localDateKey,
    parsedAccountName: parsedAccountName.present
        ? parsedAccountName.value
        : this.parsedAccountName,
    parsedCategoryName: parsedCategoryName.present
        ? parsedCategoryName.value
        : this.parsedCategoryName,
    parseErrorsJson: parseErrorsJson.present
        ? parseErrorsJson.value
        : this.parseErrorsJson,
    duplicateOfTransactionId: duplicateOfTransactionId.present
        ? duplicateOfTransactionId.value
        : this.duplicateOfTransactionId,
    userDecision: userDecision ?? this.userDecision,
    candidateId: candidateId.present ? candidateId.value : this.candidateId,
    committedTransactionId: committedTransactionId.present
        ? committedTransactionId.value
        : this.committedTransactionId,
    createdAt: createdAt ?? this.createdAt,
  );
  ImportRow copyWithCompanion(ImportRowsCompanion data) {
    return ImportRow(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      rowNumber: data.rowNumber.present ? data.rowNumber.value : this.rowNumber,
      parsedKind: data.parsedKind.present
          ? data.parsedKind.value
          : this.parsedKind,
      parsedAmountMinor: data.parsedAmountMinor.present
          ? data.parsedAmountMinor.value
          : this.parsedAmountMinor,
      parsedCurrencyCode: data.parsedCurrencyCode.present
          ? data.parsedCurrencyCode.value
          : this.parsedCurrencyCode,
      parsedOccurredAt: data.parsedOccurredAt.present
          ? data.parsedOccurredAt.value
          : this.parsedOccurredAt,
      parsedLocalOffsetMinutes: data.parsedLocalOffsetMinutes.present
          ? data.parsedLocalOffsetMinutes.value
          : this.parsedLocalOffsetMinutes,
      parsedTimezoneId: data.parsedTimezoneId.present
          ? data.parsedTimezoneId.value
          : this.parsedTimezoneId,
      localDateKey: data.localDateKey.present
          ? data.localDateKey.value
          : this.localDateKey,
      parsedAccountName: data.parsedAccountName.present
          ? data.parsedAccountName.value
          : this.parsedAccountName,
      parsedCategoryName: data.parsedCategoryName.present
          ? data.parsedCategoryName.value
          : this.parsedCategoryName,
      parseErrorsJson: data.parseErrorsJson.present
          ? data.parseErrorsJson.value
          : this.parseErrorsJson,
      duplicateOfTransactionId: data.duplicateOfTransactionId.present
          ? data.duplicateOfTransactionId.value
          : this.duplicateOfTransactionId,
      userDecision: data.userDecision.present
          ? data.userDecision.value
          : this.userDecision,
      candidateId: data.candidateId.present
          ? data.candidateId.value
          : this.candidateId,
      committedTransactionId: data.committedTransactionId.present
          ? data.committedTransactionId.value
          : this.committedTransactionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImportRow(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('rowNumber: $rowNumber, ')
          ..write('parsedKind: $parsedKind, ')
          ..write('parsedAmountMinor: $parsedAmountMinor, ')
          ..write('parsedCurrencyCode: $parsedCurrencyCode, ')
          ..write('parsedOccurredAt: $parsedOccurredAt, ')
          ..write('parsedLocalOffsetMinutes: $parsedLocalOffsetMinutes, ')
          ..write('parsedTimezoneId: $parsedTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('parsedAccountName: $parsedAccountName, ')
          ..write('parsedCategoryName: $parsedCategoryName, ')
          ..write('parseErrorsJson: $parseErrorsJson, ')
          ..write('duplicateOfTransactionId: $duplicateOfTransactionId, ')
          ..write('userDecision: $userDecision, ')
          ..write('candidateId: $candidateId, ')
          ..write('committedTransactionId: $committedTransactionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    batchId,
    rowNumber,
    parsedKind,
    parsedAmountMinor,
    parsedCurrencyCode,
    parsedOccurredAt,
    parsedLocalOffsetMinutes,
    parsedTimezoneId,
    localDateKey,
    parsedAccountName,
    parsedCategoryName,
    parseErrorsJson,
    duplicateOfTransactionId,
    userDecision,
    candidateId,
    committedTransactionId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImportRow &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.rowNumber == this.rowNumber &&
          other.parsedKind == this.parsedKind &&
          other.parsedAmountMinor == this.parsedAmountMinor &&
          other.parsedCurrencyCode == this.parsedCurrencyCode &&
          other.parsedOccurredAt == this.parsedOccurredAt &&
          other.parsedLocalOffsetMinutes == this.parsedLocalOffsetMinutes &&
          other.parsedTimezoneId == this.parsedTimezoneId &&
          other.localDateKey == this.localDateKey &&
          other.parsedAccountName == this.parsedAccountName &&
          other.parsedCategoryName == this.parsedCategoryName &&
          other.parseErrorsJson == this.parseErrorsJson &&
          other.duplicateOfTransactionId == this.duplicateOfTransactionId &&
          other.userDecision == this.userDecision &&
          other.candidateId == this.candidateId &&
          other.committedTransactionId == this.committedTransactionId &&
          other.createdAt == this.createdAt);
}

class ImportRowsCompanion extends UpdateCompanion<ImportRow> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<int> rowNumber;
  final Value<String?> parsedKind;
  final Value<int?> parsedAmountMinor;
  final Value<String?> parsedCurrencyCode;
  final Value<DateTime?> parsedOccurredAt;
  final Value<int?> parsedLocalOffsetMinutes;
  final Value<String?> parsedTimezoneId;
  final Value<String?> localDateKey;
  final Value<String?> parsedAccountName;
  final Value<String?> parsedCategoryName;
  final Value<String?> parseErrorsJson;
  final Value<String?> duplicateOfTransactionId;
  final Value<String> userDecision;
  final Value<String?> candidateId;
  final Value<String?> committedTransactionId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ImportRowsCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.rowNumber = const Value.absent(),
    this.parsedKind = const Value.absent(),
    this.parsedAmountMinor = const Value.absent(),
    this.parsedCurrencyCode = const Value.absent(),
    this.parsedOccurredAt = const Value.absent(),
    this.parsedLocalOffsetMinutes = const Value.absent(),
    this.parsedTimezoneId = const Value.absent(),
    this.localDateKey = const Value.absent(),
    this.parsedAccountName = const Value.absent(),
    this.parsedCategoryName = const Value.absent(),
    this.parseErrorsJson = const Value.absent(),
    this.duplicateOfTransactionId = const Value.absent(),
    this.userDecision = const Value.absent(),
    this.candidateId = const Value.absent(),
    this.committedTransactionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImportRowsCompanion.insert({
    required String id,
    required String batchId,
    required int rowNumber,
    this.parsedKind = const Value.absent(),
    this.parsedAmountMinor = const Value.absent(),
    this.parsedCurrencyCode = const Value.absent(),
    this.parsedOccurredAt = const Value.absent(),
    this.parsedLocalOffsetMinutes = const Value.absent(),
    this.parsedTimezoneId = const Value.absent(),
    this.localDateKey = const Value.absent(),
    this.parsedAccountName = const Value.absent(),
    this.parsedCategoryName = const Value.absent(),
    this.parseErrorsJson = const Value.absent(),
    this.duplicateOfTransactionId = const Value.absent(),
    this.userDecision = const Value.absent(),
    this.candidateId = const Value.absent(),
    this.committedTransactionId = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       batchId = Value(batchId),
       rowNumber = Value(rowNumber),
       createdAt = Value(createdAt);
  static Insertable<ImportRow> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<int>? rowNumber,
    Expression<String>? parsedKind,
    Expression<int>? parsedAmountMinor,
    Expression<String>? parsedCurrencyCode,
    Expression<DateTime>? parsedOccurredAt,
    Expression<int>? parsedLocalOffsetMinutes,
    Expression<String>? parsedTimezoneId,
    Expression<String>? localDateKey,
    Expression<String>? parsedAccountName,
    Expression<String>? parsedCategoryName,
    Expression<String>? parseErrorsJson,
    Expression<String>? duplicateOfTransactionId,
    Expression<String>? userDecision,
    Expression<String>? candidateId,
    Expression<String>? committedTransactionId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (rowNumber != null) 'row_number': rowNumber,
      if (parsedKind != null) 'parsed_kind': parsedKind,
      if (parsedAmountMinor != null) 'parsed_amount_minor': parsedAmountMinor,
      if (parsedCurrencyCode != null)
        'parsed_currency_code': parsedCurrencyCode,
      if (parsedOccurredAt != null) 'parsed_occurred_at': parsedOccurredAt,
      if (parsedLocalOffsetMinutes != null)
        'parsed_local_offset_minutes': parsedLocalOffsetMinutes,
      if (parsedTimezoneId != null) 'parsed_timezone_id': parsedTimezoneId,
      if (localDateKey != null) 'local_date_key': localDateKey,
      if (parsedAccountName != null) 'parsed_account_name': parsedAccountName,
      if (parsedCategoryName != null)
        'parsed_category_name': parsedCategoryName,
      if (parseErrorsJson != null) 'parse_errors_json': parseErrorsJson,
      if (duplicateOfTransactionId != null)
        'duplicate_of_transaction_id': duplicateOfTransactionId,
      if (userDecision != null) 'user_decision': userDecision,
      if (candidateId != null) 'candidate_id': candidateId,
      if (committedTransactionId != null)
        'committed_transaction_id': committedTransactionId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImportRowsCompanion copyWith({
    Value<String>? id,
    Value<String>? batchId,
    Value<int>? rowNumber,
    Value<String?>? parsedKind,
    Value<int?>? parsedAmountMinor,
    Value<String?>? parsedCurrencyCode,
    Value<DateTime?>? parsedOccurredAt,
    Value<int?>? parsedLocalOffsetMinutes,
    Value<String?>? parsedTimezoneId,
    Value<String?>? localDateKey,
    Value<String?>? parsedAccountName,
    Value<String?>? parsedCategoryName,
    Value<String?>? parseErrorsJson,
    Value<String?>? duplicateOfTransactionId,
    Value<String>? userDecision,
    Value<String?>? candidateId,
    Value<String?>? committedTransactionId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ImportRowsCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      rowNumber: rowNumber ?? this.rowNumber,
      parsedKind: parsedKind ?? this.parsedKind,
      parsedAmountMinor: parsedAmountMinor ?? this.parsedAmountMinor,
      parsedCurrencyCode: parsedCurrencyCode ?? this.parsedCurrencyCode,
      parsedOccurredAt: parsedOccurredAt ?? this.parsedOccurredAt,
      parsedLocalOffsetMinutes:
          parsedLocalOffsetMinutes ?? this.parsedLocalOffsetMinutes,
      parsedTimezoneId: parsedTimezoneId ?? this.parsedTimezoneId,
      localDateKey: localDateKey ?? this.localDateKey,
      parsedAccountName: parsedAccountName ?? this.parsedAccountName,
      parsedCategoryName: parsedCategoryName ?? this.parsedCategoryName,
      parseErrorsJson: parseErrorsJson ?? this.parseErrorsJson,
      duplicateOfTransactionId:
          duplicateOfTransactionId ?? this.duplicateOfTransactionId,
      userDecision: userDecision ?? this.userDecision,
      candidateId: candidateId ?? this.candidateId,
      committedTransactionId:
          committedTransactionId ?? this.committedTransactionId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (rowNumber.present) {
      map['row_number'] = Variable<int>(rowNumber.value);
    }
    if (parsedKind.present) {
      map['parsed_kind'] = Variable<String>(parsedKind.value);
    }
    if (parsedAmountMinor.present) {
      map['parsed_amount_minor'] = Variable<int>(parsedAmountMinor.value);
    }
    if (parsedCurrencyCode.present) {
      map['parsed_currency_code'] = Variable<String>(parsedCurrencyCode.value);
    }
    if (parsedOccurredAt.present) {
      map['parsed_occurred_at'] = Variable<DateTime>(parsedOccurredAt.value);
    }
    if (parsedLocalOffsetMinutes.present) {
      map['parsed_local_offset_minutes'] = Variable<int>(
        parsedLocalOffsetMinutes.value,
      );
    }
    if (parsedTimezoneId.present) {
      map['parsed_timezone_id'] = Variable<String>(parsedTimezoneId.value);
    }
    if (localDateKey.present) {
      map['local_date_key'] = Variable<String>(localDateKey.value);
    }
    if (parsedAccountName.present) {
      map['parsed_account_name'] = Variable<String>(parsedAccountName.value);
    }
    if (parsedCategoryName.present) {
      map['parsed_category_name'] = Variable<String>(parsedCategoryName.value);
    }
    if (parseErrorsJson.present) {
      map['parse_errors_json'] = Variable<String>(parseErrorsJson.value);
    }
    if (duplicateOfTransactionId.present) {
      map['duplicate_of_transaction_id'] = Variable<String>(
        duplicateOfTransactionId.value,
      );
    }
    if (userDecision.present) {
      map['user_decision'] = Variable<String>(userDecision.value);
    }
    if (candidateId.present) {
      map['candidate_id'] = Variable<String>(candidateId.value);
    }
    if (committedTransactionId.present) {
      map['committed_transaction_id'] = Variable<String>(
        committedTransactionId.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImportRowsCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('rowNumber: $rowNumber, ')
          ..write('parsedKind: $parsedKind, ')
          ..write('parsedAmountMinor: $parsedAmountMinor, ')
          ..write('parsedCurrencyCode: $parsedCurrencyCode, ')
          ..write('parsedOccurredAt: $parsedOccurredAt, ')
          ..write('parsedLocalOffsetMinutes: $parsedLocalOffsetMinutes, ')
          ..write('parsedTimezoneId: $parsedTimezoneId, ')
          ..write('localDateKey: $localDateKey, ')
          ..write('parsedAccountName: $parsedAccountName, ')
          ..write('parsedCategoryName: $parsedCategoryName, ')
          ..write('parseErrorsJson: $parseErrorsJson, ')
          ..write('duplicateOfTransactionId: $duplicateOfTransactionId, ')
          ..write('userDecision: $userDecision, ')
          ..write('candidateId: $candidateId, ')
          ..write('committedTransactionId: $committedTransactionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueJsonMeta = const VerificationMeta(
    'valueJson',
  );
  @override
  late final GeneratedColumn<String> valueJson = GeneratedColumn<String>(
    'value_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, valueJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value_json')) {
      context.handle(
        _valueJsonMeta,
        valueJson.isAcceptableOrUnknown(data['value_json']!, _valueJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_valueJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      valueJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final String key;
  final String valueJson;
  final DateTime updatedAt;
  const UserSetting({
    required this.key,
    required this.valueJson,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value_json'] = Variable<String>(valueJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      key: Value(key),
      valueJson: Value(valueJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      key: serializer.fromJson<String>(json['key']),
      valueJson: serializer.fromJson<String>(json['valueJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'valueJson': serializer.toJson<String>(valueJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserSetting copyWith({String? key, String? valueJson, DateTime? updatedAt}) =>
      UserSetting(
        key: key ?? this.key,
        valueJson: valueJson ?? this.valueJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      key: data.key.present ? data.key.value : this.key,
      valueJson: data.valueJson.present ? data.valueJson.value : this.valueJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('key: $key, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, valueJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.key == this.key &&
          other.valueJson == this.valueJson &&
          other.updatedAt == this.updatedAt);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<String> key;
  final Value<String> valueJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserSettingsCompanion({
    this.key = const Value.absent(),
    this.valueJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    required String key,
    required String valueJson,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       valueJson = Value(valueJson),
       updatedAt = Value(updatedAt);
  static Insertable<UserSetting> custom({
    Expression<String>? key,
    Expression<String>? valueJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (valueJson != null) 'value_json': valueJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? valueJson,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserSettingsCompanion(
      key: key ?? this.key,
      valueJson: valueJson ?? this.valueJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (valueJson.present) {
      map['value_json'] = Variable<String>(valueJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('key: $key, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBackupMetadataTable extends LocalBackupMetadata
    with TableInfo<$LocalBackupMetadataTable, LocalBackupMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBackupMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backupFileNameMeta = const VerificationMeta(
    'backupFileName',
  );
  @override
  late final GeneratedColumn<String> backupFileName = GeneratedColumn<String>(
    'backup_file_name',
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
  static const VerificationMeta _fileHashMeta = const VerificationMeta(
    'fileHash',
  );
  @override
  late final GeneratedColumn<String> fileHash = GeneratedColumn<String>(
    'file_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checksumAlgorithmMeta = const VerificationMeta(
    'checksumAlgorithm',
  );
  @override
  late final GeneratedColumn<String> checksumAlgorithm =
      GeneratedColumn<String>(
        'checksum_algorithm',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _encryptedMeta = const VerificationMeta(
    'encrypted',
  );
  @override
  late final GeneratedColumn<bool> encrypted = GeneratedColumn<bool>(
    'encrypted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("encrypted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _validMeta = const VerificationMeta('valid');
  @override
  late final GeneratedColumn<bool> valid = GeneratedColumn<bool>(
    'valid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("valid" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    backupFileName,
    createdAt,
    fileHash,
    checksumAlgorithm,
    encrypted,
    notes,
    valid,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_backup_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalBackupMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('backup_file_name')) {
      context.handle(
        _backupFileNameMeta,
        backupFileName.isAcceptableOrUnknown(
          data['backup_file_name']!,
          _backupFileNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backupFileNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('file_hash')) {
      context.handle(
        _fileHashMeta,
        fileHash.isAcceptableOrUnknown(data['file_hash']!, _fileHashMeta),
      );
    } else if (isInserting) {
      context.missing(_fileHashMeta);
    }
    if (data.containsKey('checksum_algorithm')) {
      context.handle(
        _checksumAlgorithmMeta,
        checksumAlgorithm.isAcceptableOrUnknown(
          data['checksum_algorithm']!,
          _checksumAlgorithmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_checksumAlgorithmMeta);
    }
    if (data.containsKey('encrypted')) {
      context.handle(
        _encryptedMeta,
        encrypted.isAcceptableOrUnknown(data['encrypted']!, _encryptedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('valid')) {
      context.handle(
        _validMeta,
        valid.isAcceptableOrUnknown(data['valid']!, _validMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBackupMetadataData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBackupMetadataData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      backupFileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backup_file_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      fileHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_hash'],
      )!,
      checksumAlgorithm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum_algorithm'],
      )!,
      encrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}encrypted'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      valid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}valid'],
      )!,
    );
  }

  @override
  $LocalBackupMetadataTable createAlias(String alias) {
    return $LocalBackupMetadataTable(attachedDatabase, alias);
  }
}

class LocalBackupMetadataData extends DataClass
    implements Insertable<LocalBackupMetadataData> {
  final String id;
  final String backupFileName;
  final DateTime createdAt;
  final String fileHash;
  final String checksumAlgorithm;
  final bool encrypted;
  final String? notes;
  final bool valid;
  const LocalBackupMetadataData({
    required this.id,
    required this.backupFileName,
    required this.createdAt,
    required this.fileHash,
    required this.checksumAlgorithm,
    required this.encrypted,
    this.notes,
    required this.valid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['backup_file_name'] = Variable<String>(backupFileName);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['file_hash'] = Variable<String>(fileHash);
    map['checksum_algorithm'] = Variable<String>(checksumAlgorithm);
    map['encrypted'] = Variable<bool>(encrypted);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['valid'] = Variable<bool>(valid);
    return map;
  }

  LocalBackupMetadataCompanion toCompanion(bool nullToAbsent) {
    return LocalBackupMetadataCompanion(
      id: Value(id),
      backupFileName: Value(backupFileName),
      createdAt: Value(createdAt),
      fileHash: Value(fileHash),
      checksumAlgorithm: Value(checksumAlgorithm),
      encrypted: Value(encrypted),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      valid: Value(valid),
    );
  }

  factory LocalBackupMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalBackupMetadataData(
      id: serializer.fromJson<String>(json['id']),
      backupFileName: serializer.fromJson<String>(json['backupFileName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      fileHash: serializer.fromJson<String>(json['fileHash']),
      checksumAlgorithm: serializer.fromJson<String>(json['checksumAlgorithm']),
      encrypted: serializer.fromJson<bool>(json['encrypted']),
      notes: serializer.fromJson<String?>(json['notes']),
      valid: serializer.fromJson<bool>(json['valid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'backupFileName': serializer.toJson<String>(backupFileName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'fileHash': serializer.toJson<String>(fileHash),
      'checksumAlgorithm': serializer.toJson<String>(checksumAlgorithm),
      'encrypted': serializer.toJson<bool>(encrypted),
      'notes': serializer.toJson<String?>(notes),
      'valid': serializer.toJson<bool>(valid),
    };
  }

  LocalBackupMetadataData copyWith({
    String? id,
    String? backupFileName,
    DateTime? createdAt,
    String? fileHash,
    String? checksumAlgorithm,
    bool? encrypted,
    Value<String?> notes = const Value.absent(),
    bool? valid,
  }) => LocalBackupMetadataData(
    id: id ?? this.id,
    backupFileName: backupFileName ?? this.backupFileName,
    createdAt: createdAt ?? this.createdAt,
    fileHash: fileHash ?? this.fileHash,
    checksumAlgorithm: checksumAlgorithm ?? this.checksumAlgorithm,
    encrypted: encrypted ?? this.encrypted,
    notes: notes.present ? notes.value : this.notes,
    valid: valid ?? this.valid,
  );
  LocalBackupMetadataData copyWithCompanion(LocalBackupMetadataCompanion data) {
    return LocalBackupMetadataData(
      id: data.id.present ? data.id.value : this.id,
      backupFileName: data.backupFileName.present
          ? data.backupFileName.value
          : this.backupFileName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      fileHash: data.fileHash.present ? data.fileHash.value : this.fileHash,
      checksumAlgorithm: data.checksumAlgorithm.present
          ? data.checksumAlgorithm.value
          : this.checksumAlgorithm,
      encrypted: data.encrypted.present ? data.encrypted.value : this.encrypted,
      notes: data.notes.present ? data.notes.value : this.notes,
      valid: data.valid.present ? data.valid.value : this.valid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBackupMetadataData(')
          ..write('id: $id, ')
          ..write('backupFileName: $backupFileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('fileHash: $fileHash, ')
          ..write('checksumAlgorithm: $checksumAlgorithm, ')
          ..write('encrypted: $encrypted, ')
          ..write('notes: $notes, ')
          ..write('valid: $valid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    backupFileName,
    createdAt,
    fileHash,
    checksumAlgorithm,
    encrypted,
    notes,
    valid,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBackupMetadataData &&
          other.id == this.id &&
          other.backupFileName == this.backupFileName &&
          other.createdAt == this.createdAt &&
          other.fileHash == this.fileHash &&
          other.checksumAlgorithm == this.checksumAlgorithm &&
          other.encrypted == this.encrypted &&
          other.notes == this.notes &&
          other.valid == this.valid);
}

class LocalBackupMetadataCompanion
    extends UpdateCompanion<LocalBackupMetadataData> {
  final Value<String> id;
  final Value<String> backupFileName;
  final Value<DateTime> createdAt;
  final Value<String> fileHash;
  final Value<String> checksumAlgorithm;
  final Value<bool> encrypted;
  final Value<String?> notes;
  final Value<bool> valid;
  final Value<int> rowid;
  const LocalBackupMetadataCompanion({
    this.id = const Value.absent(),
    this.backupFileName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.fileHash = const Value.absent(),
    this.checksumAlgorithm = const Value.absent(),
    this.encrypted = const Value.absent(),
    this.notes = const Value.absent(),
    this.valid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalBackupMetadataCompanion.insert({
    required String id,
    required String backupFileName,
    required DateTime createdAt,
    required String fileHash,
    required String checksumAlgorithm,
    this.encrypted = const Value.absent(),
    this.notes = const Value.absent(),
    this.valid = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       backupFileName = Value(backupFileName),
       createdAt = Value(createdAt),
       fileHash = Value(fileHash),
       checksumAlgorithm = Value(checksumAlgorithm);
  static Insertable<LocalBackupMetadataData> custom({
    Expression<String>? id,
    Expression<String>? backupFileName,
    Expression<DateTime>? createdAt,
    Expression<String>? fileHash,
    Expression<String>? checksumAlgorithm,
    Expression<bool>? encrypted,
    Expression<String>? notes,
    Expression<bool>? valid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (backupFileName != null) 'backup_file_name': backupFileName,
      if (createdAt != null) 'created_at': createdAt,
      if (fileHash != null) 'file_hash': fileHash,
      if (checksumAlgorithm != null) 'checksum_algorithm': checksumAlgorithm,
      if (encrypted != null) 'encrypted': encrypted,
      if (notes != null) 'notes': notes,
      if (valid != null) 'valid': valid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBackupMetadataCompanion copyWith({
    Value<String>? id,
    Value<String>? backupFileName,
    Value<DateTime>? createdAt,
    Value<String>? fileHash,
    Value<String>? checksumAlgorithm,
    Value<bool>? encrypted,
    Value<String?>? notes,
    Value<bool>? valid,
    Value<int>? rowid,
  }) {
    return LocalBackupMetadataCompanion(
      id: id ?? this.id,
      backupFileName: backupFileName ?? this.backupFileName,
      createdAt: createdAt ?? this.createdAt,
      fileHash: fileHash ?? this.fileHash,
      checksumAlgorithm: checksumAlgorithm ?? this.checksumAlgorithm,
      encrypted: encrypted ?? this.encrypted,
      notes: notes ?? this.notes,
      valid: valid ?? this.valid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (backupFileName.present) {
      map['backup_file_name'] = Variable<String>(backupFileName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (fileHash.present) {
      map['file_hash'] = Variable<String>(fileHash.value);
    }
    if (checksumAlgorithm.present) {
      map['checksum_algorithm'] = Variable<String>(checksumAlgorithm.value);
    }
    if (encrypted.present) {
      map['encrypted'] = Variable<bool>(encrypted.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (valid.present) {
      map['valid'] = Variable<bool>(valid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBackupMetadataCompanion(')
          ..write('id: $id, ')
          ..write('backupFileName: $backupFileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('fileHash: $fileHash, ')
          ..write('checksumAlgorithm: $checksumAlgorithm, ')
          ..write('encrypted: $encrypted, ')
          ..write('notes: $notes, ')
          ..write('valid: $valid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $SubcategoriesTable subcategories = $SubcategoriesTable(this);
  late final $PaymentMethodsTable paymentMethods = $PaymentMethodsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $SavingsGoalsTable savingsGoals = $SavingsGoalsTable(this);
  late final $SavingsContributionsTable savingsContributions =
      $SavingsContributionsTable(this);
  late final $RecurringPlansTable recurringPlans = $RecurringPlansTable(this);
  late final $DetectedTransactionCandidatesTable detectedTransactionCandidates =
      $DetectedTransactionCandidatesTable(this);
  late final $CandidateDuplicateLinksTable candidateDuplicateLinks =
      $CandidateDuplicateLinksTable(this);
  late final $CandidateFingerprintsTable candidateFingerprints =
      $CandidateFingerprintsTable(this);
  late final $ImportBatchesTable importBatches = $ImportBatchesTable(this);
  late final $ImportRowsTable importRows = $ImportRowsTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  late final $LocalBackupMetadataTable localBackupMetadata =
      $LocalBackupMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    accounts,
    categories,
    subcategories,
    paymentMethods,
    transactions,
    budgets,
    savingsGoals,
    savingsContributions,
    recurringPlans,
    detectedTransactionCandidates,
    candidateDuplicateLinks,
    candidateFingerprints,
    importBatches,
    importRows,
    userSettings,
    localBackupMetadata,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'detected_transaction_candidates',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('candidate_duplicate_links', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'detected_transaction_candidates',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('candidate_fingerprints', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'import_batches',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('import_rows', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  required String id,
  required String name,
  required String kind,
  Value<String> currencyCode,
  Value<int> openingBalanceMinor,
  Value<bool> isArchived,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> kind,
  Value<String> currencyCode,
  Value<int> openingBalanceMinor,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, Account> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PaymentMethodsTable, List<PaymentMethod>>
  _paymentMethodsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.paymentMethods,
    aliasName: 'accounts__id__payment_methods__account_id',
  );

  $$PaymentMethodsTableProcessedTableManager get paymentMethodsRefs {
    final manager = $$PaymentMethodsTableTableManager(
      $_db,
      $_db.paymentMethods,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentMethodsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _ledgerTransactionsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'accounts__id__transactions__account_id',
  );

  $$TransactionsTableProcessedTableManager get ledgerTransactions {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ledgerTransactionsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _outgoingTransfersTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'accounts__id__transactions__source_account_id',
  );

  $$TransactionsTableProcessedTableManager get outgoingTransfers {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) => f.sourceAccountId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_outgoingTransfersTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _incomingTransfersTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'accounts__id__transactions__destination_account_id',
  );

  $$TransactionsTableProcessedTableManager get incomingTransfers {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) =>
              f.destinationAccountId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_incomingTransfersTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SavingsGoalsTable, List<SavingsGoal>>
  _savingsGoalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.savingsGoals,
    aliasName: 'accounts__id__savings_goals__account_id',
  );

  $$SavingsGoalsTableProcessedTableManager get savingsGoalsRefs {
    final manager = $$SavingsGoalsTableTableManager(
      $_db,
      $_db.savingsGoals,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_savingsGoalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _accountCandidatesTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detectedTransactionCandidates,
    aliasName: 'accounts__id__detected_transaction_candidates__account_id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get accountCandidates {
    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountCandidatesTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _sourceAccountCandidatesTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.detectedTransactionCandidates,
        aliasName:
            'accounts__id__detected_transaction_candidates__source_account_id',
      );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get sourceAccountCandidates {
    final manager =
        $$DetectedTransactionCandidatesTableTableManager(
          $_db,
          $_db.detectedTransactionCandidates,
        ).filter(
          (f) => f.sourceAccountId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _sourceAccountCandidatesTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _destinationAccountCandidatesTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.detectedTransactionCandidates,
    aliasName:
        'accounts__id__detected_transaction_candidates__destination_account_id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get destinationAccountCandidates {
    final manager =
        $$DetectedTransactionCandidatesTableTableManager(
          $_db,
          $_db.detectedTransactionCandidates,
        ).filter(
          (f) =>
              f.destinationAccountId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _destinationAccountCandidatesTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> paymentMethodsRefs(
    Expression<bool> Function($$PaymentMethodsTableFilterComposer f) f,
  ) {
    final $$PaymentMethodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableFilterComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ledgerTransactions(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> outgoingTransfers(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.sourceAccountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> incomingTransfers(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.destinationAccountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> savingsGoalsRefs(
    Expression<bool> Function($$SavingsGoalsTableFilterComposer f) f,
  ) {
    final $$SavingsGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savingsGoals,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsGoalsTableFilterComposer(
            $db: $db,
            $table: $db.savingsGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountCandidates(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> sourceAccountCandidates(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.sourceAccountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> destinationAccountCandidates(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.destinationAccountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> paymentMethodsRefs<T extends Object>(
    Expression<T> Function($$PaymentMethodsTableAnnotationComposer a) f,
  ) {
    final $$PaymentMethodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableAnnotationComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ledgerTransactions<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> outgoingTransfers<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.sourceAccountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> incomingTransfers<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.destinationAccountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> savingsGoalsRefs<T extends Object>(
    Expression<T> Function($$SavingsGoalsTableAnnotationComposer a) f,
  ) {
    final $$SavingsGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savingsGoals,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.savingsGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountCandidates<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.accountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> sourceAccountCandidates<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.sourceAccountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> destinationAccountCandidates<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.destinationAccountId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, $$AccountsTableReferences),
          Account,
          PrefetchHooks Function({
            bool paymentMethodsRefs,
            bool ledgerTransactions,
            bool outgoingTransfers,
            bool incomingTransfers,
            bool savingsGoalsRefs,
            bool accountCandidates,
            bool sourceAccountCandidates,
            bool destinationAccountCandidates,
          })
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> openingBalanceMinor = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                name: name,
                kind: kind,
                currencyCode: currencyCode,
                openingBalanceMinor: openingBalanceMinor,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String kind,
                Value<String> currencyCode = const Value.absent(),
                Value<int> openingBalanceMinor = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                name: name,
                kind: kind,
                currencyCode: currencyCode,
                openingBalanceMinor: openingBalanceMinor,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AccountsTable, Account>(table),
                  $$AccountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                paymentMethodsRefs = false,
                ledgerTransactions = false,
                outgoingTransfers = false,
                incomingTransfers = false,
                savingsGoalsRefs = false,
                accountCandidates = false,
                sourceAccountCandidates = false,
                destinationAccountCandidates = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentMethodsRefs) db.paymentMethods,
                    if (ledgerTransactions) db.transactions,
                    if (outgoingTransfers) db.transactions,
                    if (incomingTransfers) db.transactions,
                    if (savingsGoalsRefs) db.savingsGoals,
                    if (accountCandidates) db.detectedTransactionCandidates,
                    if (sourceAccountCandidates)
                      db.detectedTransactionCandidates,
                    if (destinationAccountCandidates)
                      db.detectedTransactionCandidates,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentMethodsRefs)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          PaymentMethod,
                          $PaymentMethodsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._paymentMethodsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentMethodsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'account_id',
                          typedResults: items,
                        ),
                      if (ledgerTransactions)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._ledgerTransactionsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).ledgerTransactions,
                          currentColumn: 'id',
                          referencedColumn: 'account_id',
                          typedResults: items,
                        ),
                      if (outgoingTransfers)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._outgoingTransfersTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).outgoingTransfers,
                          currentColumn: 'id',
                          referencedColumn: 'source_account_id',
                          typedResults: items,
                        ),
                      if (incomingTransfers)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._incomingTransfersTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).incomingTransfers,
                          currentColumn: 'id',
                          referencedColumn: 'destination_account_id',
                          typedResults: items,
                        ),
                      if (savingsGoalsRefs)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          SavingsGoal,
                          $SavingsGoalsTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._savingsGoalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).savingsGoalsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'account_id',
                          typedResults: items,
                        ),
                      if (accountCandidates)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._accountCandidatesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).accountCandidates,
                          currentColumn: 'id',
                          referencedColumn: 'account_id',
                          typedResults: items,
                        ),
                      if (sourceAccountCandidates)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._sourceAccountCandidatesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).sourceAccountCandidates,
                          currentColumn: 'id',
                          referencedColumn: 'source_account_id',
                          typedResults: items,
                        ),
                      if (destinationAccountCandidates)
                        await $_getPrefetchedDataByColumns<
                          Account,
                          $AccountsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._destinationAccountCandidatesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).destinationAccountCandidates,
                          currentColumn: 'id',
                          referencedColumn: 'destination_account_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, $$AccountsTableReferences),
      Account,
      PrefetchHooks Function({
        bool paymentMethodsRefs,
        bool ledgerTransactions,
        bool outgoingTransfers,
        bool incomingTransfers,
        bool savingsGoalsRefs,
        bool accountCandidates,
        bool sourceAccountCandidates,
        bool destinationAccountCandidates,
      })
    >;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  Value<String> kind,
  Value<String?> parentCategoryId,
  Value<bool> isBuiltin,
  Value<bool> isArchived,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> kind,
  Value<String?> parentCategoryId,
  Value<bool> isBuiltin,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _parentCategoryIdTable(_$AppDatabase db) => db
      .categories
      .createAlias('categories__parent_category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get parentCategoryId {
    final $_column = $_itemColumn<String>('parent_category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SubcategoriesTable, List<Subcategory>>
  _subcategoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.subcategories,
    aliasName: 'categories__id__subcategories__category_id',
  );

  $$SubcategoriesTableProcessedTableManager get subcategoriesRefs {
    final manager = $$SubcategoriesTableTableManager(
      $_db,
      $_db.subcategories,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_subcategoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'categories__id__transactions__category_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BudgetsTable, List<Budget>> _budgetsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.budgets,
    aliasName: 'categories__id__budgets__category_id',
  );

  $$BudgetsTableProcessedTableManager get budgetsRefs {
    final manager = $$BudgetsTableTableManager(
      $_db,
      $_db.budgets,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _detectedTransactionCandidatesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.detectedTransactionCandidates,
        aliasName:
            'categories__id__detected_transaction_candidates__category_id',
      );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get detectedTransactionCandidatesRefs {
    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _detectedTransactionCandidatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBuiltin => $composableBuilder(
    column: $table.isBuiltin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get parentCategoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> subcategoriesRefs(
    Expression<bool> Function($$SubcategoriesTableFilterComposer f) f,
  ) {
    final $$SubcategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subcategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubcategoriesTableFilterComposer(
            $db: $db,
            $table: $db.subcategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> budgetsRefs(
    Expression<bool> Function($$BudgetsTableFilterComposer f) f,
  ) {
    final $$BudgetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetsTableFilterComposer(
            $db: $db,
            $table: $db.budgets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> detectedTransactionCandidatesRefs(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBuiltin => $composableBuilder(
    column: $table.isBuiltin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get parentCategoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<bool> get isBuiltin =>
      $composableBuilder(column: $table.isBuiltin, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get parentCategoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> subcategoriesRefs<T extends Object>(
    Expression<T> Function($$SubcategoriesTableAnnotationComposer a) f,
  ) {
    final $$SubcategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subcategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubcategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.subcategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> budgetsRefs<T extends Object>(
    Expression<T> Function($$BudgetsTableAnnotationComposer a) f,
  ) {
    final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetsTableAnnotationComposer(
            $db: $db,
            $table: $db.budgets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> detectedTransactionCandidatesRefs<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({
            bool parentCategoryId,
            bool subcategoriesRefs,
            bool transactionsRefs,
            bool budgetsRefs,
            bool detectedTransactionCandidatesRefs,
          })
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String?> parentCategoryId = const Value.absent(),
                Value<bool> isBuiltin = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                kind: kind,
                parentCategoryId: parentCategoryId,
                isBuiltin: isBuiltin,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> kind = const Value.absent(),
                Value<String?> parentCategoryId = const Value.absent(),
                Value<bool> isBuiltin = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                kind: kind,
                parentCategoryId: parentCategoryId,
                isBuiltin: isBuiltin,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, Category>(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                parentCategoryId = false,
                subcategoriesRefs = false,
                transactionsRefs = false,
                budgetsRefs = false,
                detectedTransactionCandidatesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (subcategoriesRefs) db.subcategories,
                    if (transactionsRefs) db.transactions,
                    if (budgetsRefs) db.budgets,
                    if (detectedTransactionCandidatesRefs)
                      db.detectedTransactionCandidates,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (parentCategoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.parentCategoryId,
                            referencedTable: $$CategoriesTableReferences
                                ._parentCategoryIdTable(db),
                            referencedColumn: $$CategoriesTableReferences
                                ._parentCategoryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (subcategoriesRefs)
                        await $_getPrefetchedDataByColumns<
                          Category,
                          $CategoriesTable,
                          Subcategory,
                          $SubcategoriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._subcategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).subcategoriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                      if (transactionsRefs)
                        await $_getPrefetchedDataByColumns<
                          Category,
                          $CategoriesTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                      if (budgetsRefs)
                        await $_getPrefetchedDataByColumns<
                          Category,
                          $CategoriesTable,
                          Budget,
                          $BudgetsTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._budgetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).budgetsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                      if (detectedTransactionCandidatesRefs)
                        await $_getPrefetchedDataByColumns<
                          Category,
                          $CategoriesTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._detectedTransactionCandidatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).detectedTransactionCandidatesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'category_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({
        bool parentCategoryId,
        bool subcategoriesRefs,
        bool transactionsRefs,
        bool budgetsRefs,
        bool detectedTransactionCandidatesRefs,
      })
    >;
typedef $$SubcategoriesTableCreateCompanionBuilder =
    SubcategoriesCompanion Function({
      required String id,
      required String categoryId,
      required String name,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SubcategoriesTableUpdateCompanionBuilder =
    SubcategoriesCompanion Function({
      Value<String> id,
      Value<String> categoryId,
      Value<String> name,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SubcategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $SubcategoriesTable, Subcategory> {
  $$SubcategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('subcategories__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'subcategories__id__transactions__subcategory_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.subcategoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubcategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.subcategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubcategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubcategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.subcategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubcategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubcategoriesTable,
          Subcategory,
          $$SubcategoriesTableFilterComposer,
          $$SubcategoriesTableOrderingComposer,
          $$SubcategoriesTableAnnotationComposer,
          $$SubcategoriesTableCreateCompanionBuilder,
          $$SubcategoriesTableUpdateCompanionBuilder,
          (Subcategory, $$SubcategoriesTableReferences),
          Subcategory,
          PrefetchHooks Function({bool categoryId, bool transactionsRefs})
        > {
  $$SubcategoriesTableTableManager(_$AppDatabase db, $SubcategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubcategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubcategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubcategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubcategoriesCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String categoryId,
                required String name,
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SubcategoriesCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubcategoriesTable, Subcategory>(table),
                  $$SubcategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, transactionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionsRefs) db.transactions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$SubcategoriesTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$SubcategoriesTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionsRefs)
                        await $_getPrefetchedDataByColumns<
                          Subcategory,
                          $SubcategoriesTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SubcategoriesTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubcategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'subcategory_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubcategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubcategoriesTable,
      Subcategory,
      $$SubcategoriesTableFilterComposer,
      $$SubcategoriesTableOrderingComposer,
      $$SubcategoriesTableAnnotationComposer,
      $$SubcategoriesTableCreateCompanionBuilder,
      $$SubcategoriesTableUpdateCompanionBuilder,
      (Subcategory, $$SubcategoriesTableReferences),
      Subcategory,
      PrefetchHooks Function({bool categoryId, bool transactionsRefs})
    >;
typedef $$PaymentMethodsTableCreateCompanionBuilder =
    PaymentMethodsCompanion Function({
      required String id,
      required String name,
      Value<String?> accountId,
      Value<bool> isActive,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PaymentMethodsTableUpdateCompanionBuilder =
    PaymentMethodsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> accountId,
      Value<bool> isActive,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$PaymentMethodsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentMethodsTable, PaymentMethod> {
  $$PaymentMethodsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('payment_methods__account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get accountId {
    final $_column = $_itemColumn<String>('account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'payment_methods__id__transactions__payment_method_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) => f.paymentMethodId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _detectedTransactionCandidatesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.detectedTransactionCandidates,
        aliasName: 'payment_methods__id__detected_transaction_candidates__payment_method_id',
      );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get detectedTransactionCandidatesRefs {
    final manager =
        $$DetectedTransactionCandidatesTableTableManager(
          $_db,
          $_db.detectedTransactionCandidates,
        ).filter(
          (f) => f.paymentMethodId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _detectedTransactionCandidatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentMethodsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.paymentMethodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> detectedTransactionCandidatesRefs(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.paymentMethodId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PaymentMethodsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentMethodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentMethodsTable> {
  $$PaymentMethodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.paymentMethodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> detectedTransactionCandidatesRefs<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.paymentMethodId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PaymentMethodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentMethodsTable,
          PaymentMethod,
          $$PaymentMethodsTableFilterComposer,
          $$PaymentMethodsTableOrderingComposer,
          $$PaymentMethodsTableAnnotationComposer,
          $$PaymentMethodsTableCreateCompanionBuilder,
          $$PaymentMethodsTableUpdateCompanionBuilder,
          (PaymentMethod, $$PaymentMethodsTableReferences),
          PaymentMethod,
          PrefetchHooks Function({
            bool accountId,
            bool transactionsRefs,
            bool detectedTransactionCandidatesRefs,
          })
        > {
  $$PaymentMethodsTableTableManager(
    _$AppDatabase db,
    $PaymentMethodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentMethodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentMethodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentMethodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentMethodsCompanion(
                id: id,
                name: name,
                accountId: accountId,
                isActive: isActive,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> accountId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PaymentMethodsCompanion.insert(
                id: id,
                name: name,
                accountId: accountId,
                isActive: isActive,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentMethodsTable, PaymentMethod>(table),
                  $$PaymentMethodsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountId = false,
                transactionsRefs = false,
                detectedTransactionCandidatesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionsRefs) db.transactions,
                    if (detectedTransactionCandidatesRefs)
                      db.detectedTransactionCandidates,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountId,
                            referencedTable: $$PaymentMethodsTableReferences
                                ._accountIdTable(db),
                            referencedColumn: $$PaymentMethodsTableReferences
                                ._accountIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionsRefs)
                        await $_getPrefetchedDataByColumns<
                          PaymentMethod,
                          $PaymentMethodsTable,
                          Transaction,
                          $TransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentMethodsTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentMethodsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'payment_method_id',
                          typedResults: items,
                        ),
                      if (detectedTransactionCandidatesRefs)
                        await $_getPrefetchedDataByColumns<
                          PaymentMethod,
                          $PaymentMethodsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentMethodsTableReferences
                              ._detectedTransactionCandidatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentMethodsTableReferences(
                                db,
                                table,
                                p0,
                              ).detectedTransactionCandidatesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'payment_method_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PaymentMethodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentMethodsTable,
      PaymentMethod,
      $$PaymentMethodsTableFilterComposer,
      $$PaymentMethodsTableOrderingComposer,
      $$PaymentMethodsTableAnnotationComposer,
      $$PaymentMethodsTableCreateCompanionBuilder,
      $$PaymentMethodsTableUpdateCompanionBuilder,
      (PaymentMethod, $$PaymentMethodsTableReferences),
      PaymentMethod,
      PrefetchHooks Function({
        bool accountId,
        bool transactionsRefs,
        bool detectedTransactionCandidatesRefs,
      })
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String kind,
      required int amountMinor,
      Value<String> currencyCode,
      required DateTime occurredAt,
      Value<int?> occurredLocalOffsetMinutes,
      Value<String?> occurredTimezoneId,
      required String localDateKey,
      required String status,
      Value<String> verification,
      required String source,
      Value<String?> accountId,
      Value<String?> sourceAccountId,
      Value<String?> destinationAccountId,
      Value<String?> categoryId,
      Value<String?> subcategoryId,
      Value<String?> paymentMethodId,
      Value<String?> description,
      Value<String?> externalReference,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> originalSourceId,
      Value<String?> sourceMetadataJson,
      Value<String?> expenseBehavior,
      Value<String?> allocationGroup,
      Value<String?> allocationGroupName,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> kind,
      Value<int> amountMinor,
      Value<String> currencyCode,
      Value<DateTime> occurredAt,
      Value<int?> occurredLocalOffsetMinutes,
      Value<String?> occurredTimezoneId,
      Value<String> localDateKey,
      Value<String> status,
      Value<String> verification,
      Value<String> source,
      Value<String?> accountId,
      Value<String?> sourceAccountId,
      Value<String?> destinationAccountId,
      Value<String?> categoryId,
      Value<String?> subcategoryId,
      Value<String?> paymentMethodId,
      Value<String?> description,
      Value<String?> externalReference,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> originalSourceId,
      Value<String?> sourceMetadataJson,
      Value<String?> expenseBehavior,
      Value<String?> allocationGroup,
      Value<String?> allocationGroupName,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('transactions__account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get accountId {
    final $_column = $_itemColumn<String>('account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountsTable _sourceAccountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('transactions__source_account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get sourceAccountId {
    final $_column = $_itemColumn<String>('source_account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountsTable _destinationAccountIdTable(_$AppDatabase db) => db
      .accounts
      .createAlias('transactions__destination_account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get destinationAccountId {
    final $_column = $_itemColumn<String>('destination_account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _destinationAccountIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('transactions__category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SubcategoriesTable _subcategoryIdTable(_$AppDatabase db) => db
      .subcategories
      .createAlias('transactions__subcategory_id__subcategories__id');

  $$SubcategoriesTableProcessedTableManager? get subcategoryId {
    final $_column = $_itemColumn<String>('subcategory_id');
    if ($_column == null) return null;
    final manager = $$SubcategoriesTableTableManager(
      $_db,
      $_db.subcategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subcategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PaymentMethodsTable _paymentMethodIdTable(_$AppDatabase db) => db
      .paymentMethods
      .createAlias('transactions__payment_method_id__payment_methods__id');

  $$PaymentMethodsTableProcessedTableManager? get paymentMethodId {
    final $_column = $_itemColumn<String>('payment_method_id');
    if ($_column == null) return null;
    final manager = $$PaymentMethodsTableTableManager(
      $_db,
      $_db.paymentMethods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentMethodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SavingsContributionsTable,
    List<SavingsContribution>
  >
  _savingsContributionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.savingsContributions,
        aliasName: 'transactions__id__savings_contributions__transaction_id',
      );

  $$SavingsContributionsTableProcessedTableManager
  get savingsContributionsRefs {
    final manager = $$SavingsContributionsTableTableManager(
      $_db,
      $_db.savingsContributions,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _savingsContributionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _candidateDuplicateReferencesTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.detectedTransactionCandidates,
        aliasName: 'transactions__id__detected_transaction_candidates__duplicate_of_transaction_id',
      );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get candidateDuplicateReferences {
    final manager =
        $$DetectedTransactionCandidatesTableTableManager(
          $_db,
          $_db.detectedTransactionCandidates,
        ).filter(
          (f) => f.duplicateOfTransactionId.id.sqlEquals(
            $_itemColumn<String>('id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _candidateDuplicateReferencesTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $DetectedTransactionCandidatesTable,
    List<DetectedTransactionCandidate>
  >
  _candidateConfirmedTransactionsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.detectedTransactionCandidates,
        aliasName: 'transactions__id__detected_transaction_candidates__confirmed_transaction_id',
      );

  $$DetectedTransactionCandidatesTableProcessedTableManager
  get candidateConfirmedTransactions {
    final manager =
        $$DetectedTransactionCandidatesTableTableManager(
          $_db,
          $_db.detectedTransactionCandidates,
        ).filter(
          (f) => f.confirmedTransactionId.id.sqlEquals(
            $_itemColumn<String>('id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _candidateConfirmedTransactionsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CandidateDuplicateLinksTable,
    List<CandidateDuplicateLink>
  >
  _candidateDuplicateLinksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.candidateDuplicateLinks,
    aliasName:
        'transactions__id__candidate_duplicate_links__related_transaction_id',
  );

  $$CandidateDuplicateLinksTableProcessedTableManager
  get candidateDuplicateLinksRefs {
    final manager =
        $$CandidateDuplicateLinksTableTableManager(
          $_db,
          $_db.candidateDuplicateLinks,
        ).filter(
          (f) =>
              f.relatedTransactionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _candidateDuplicateLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ImportRowsTable, List<ImportRow>>
  _importDuplicateReferencesTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.importRows,
        aliasName: 'transactions__id__import_rows__duplicate_of_transaction_id',
      );

  $$ImportRowsTableProcessedTableManager get importDuplicateReferences {
    final manager = $$ImportRowsTableTableManager($_db, $_db.importRows).filter(
      (f) =>
          f.duplicateOfTransactionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _importDuplicateReferencesTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ImportRowsTable, List<ImportRow>>
  _importCommittedTransactionsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.importRows,
        aliasName: 'transactions__id__import_rows__committed_transaction_id',
      );

  $$ImportRowsTableProcessedTableManager get importCommittedTransactions {
    final manager = $$ImportRowsTableTableManager($_db, $_db.importRows).filter(
      (f) => f.committedTransactionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _importCommittedTransactionsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verification => $composableBuilder(
    column: $table.verification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalReference => $composableBuilder(
    column: $table.externalReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalSourceId => $composableBuilder(
    column: $table.originalSourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableFilterComposer get sourceAccountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableFilterComposer get destinationAccountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubcategoriesTableFilterComposer get subcategoryId {
    final $$SubcategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subcategoryId,
      referencedTable: $db.subcategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubcategoriesTableFilterComposer(
            $db: $db,
            $table: $db.subcategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableFilterComposer get paymentMethodId {
    final $$PaymentMethodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableFilterComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> savingsContributionsRefs(
    Expression<bool> Function($$SavingsContributionsTableFilterComposer f) f,
  ) {
    final $$SavingsContributionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savingsContributions,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsContributionsTableFilterComposer(
            $db: $db,
            $table: $db.savingsContributions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> candidateDuplicateReferences(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.duplicateOfTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> candidateConfirmedTransactions(
    Expression<bool> Function(
      $$DetectedTransactionCandidatesTableFilterComposer f,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.confirmedTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> candidateDuplicateLinksRefs(
    Expression<bool> Function($$CandidateDuplicateLinksTableFilterComposer f) f,
  ) {
    final $$CandidateDuplicateLinksTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.relatedTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableFilterComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> importDuplicateReferences(
    Expression<bool> Function($$ImportRowsTableFilterComposer f) f,
  ) {
    final $$ImportRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.duplicateOfTransactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableFilterComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> importCommittedTransactions(
    Expression<bool> Function($$ImportRowsTableFilterComposer f) f,
  ) {
    final $$ImportRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.committedTransactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableFilterComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verification => $composableBuilder(
    column: $table.verification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalReference => $composableBuilder(
    column: $table.externalReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalSourceId => $composableBuilder(
    column: $table.originalSourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableOrderingComposer get sourceAccountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableOrderingComposer get destinationAccountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubcategoriesTableOrderingComposer get subcategoryId {
    final $$SubcategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subcategoryId,
      referencedTable: $db.subcategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubcategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.subcategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableOrderingComposer get paymentMethodId {
    final $$PaymentMethodsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableOrderingComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get verification => $composableBuilder(
    column: $table.verification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get externalReference => $composableBuilder(
    column: $table.externalReference,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get originalSourceId => $composableBuilder(
    column: $table.originalSourceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => column,
  );

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableAnnotationComposer get sourceAccountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableAnnotationComposer get destinationAccountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubcategoriesTableAnnotationComposer get subcategoryId {
    final $$SubcategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subcategoryId,
      referencedTable: $db.subcategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubcategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.subcategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableAnnotationComposer get paymentMethodId {
    final $$PaymentMethodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableAnnotationComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> savingsContributionsRefs<T extends Object>(
    Expression<T> Function($$SavingsContributionsTableAnnotationComposer a) f,
  ) {
    final $$SavingsContributionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.savingsContributions,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SavingsContributionsTableAnnotationComposer(
                $db: $db,
                $table: $db.savingsContributions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> candidateDuplicateReferences<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.duplicateOfTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> candidateConfirmedTransactions<T extends Object>(
    Expression<T> Function(
      $$DetectedTransactionCandidatesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.confirmedTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> candidateDuplicateLinksRefs<T extends Object>(
    Expression<T> Function($$CandidateDuplicateLinksTableAnnotationComposer a)
    f,
  ) {
    final $$CandidateDuplicateLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.relatedTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> importDuplicateReferences<T extends Object>(
    Expression<T> Function($$ImportRowsTableAnnotationComposer a) f,
  ) {
    final $$ImportRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.duplicateOfTransactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> importCommittedTransactions<T extends Object>(
    Expression<T> Function($$ImportRowsTableAnnotationComposer a) f,
  ) {
    final $$ImportRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.committedTransactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({
            bool accountId,
            bool sourceAccountId,
            bool destinationAccountId,
            bool categoryId,
            bool subcategoryId,
            bool paymentMethodId,
            bool savingsContributionsRefs,
            bool candidateDuplicateReferences,
            bool candidateConfirmedTransactions,
            bool candidateDuplicateLinksRefs,
            bool importDuplicateReferences,
            bool importCommittedTransactions,
          })
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
                Value<String?> occurredTimezoneId = const Value.absent(),
                Value<String> localDateKey = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> verification = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<String?> sourceAccountId = const Value.absent(),
                Value<String?> destinationAccountId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> subcategoryId = const Value.absent(),
                Value<String?> paymentMethodId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> externalReference = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> originalSourceId = const Value.absent(),
                Value<String?> sourceMetadataJson = const Value.absent(),
                Value<String?> expenseBehavior = const Value.absent(),
                Value<String?> allocationGroup = const Value.absent(),
                Value<String?> allocationGroupName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                kind: kind,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                occurredLocalOffsetMinutes: occurredLocalOffsetMinutes,
                occurredTimezoneId: occurredTimezoneId,
                localDateKey: localDateKey,
                status: status,
                verification: verification,
                source: source,
                accountId: accountId,
                sourceAccountId: sourceAccountId,
                destinationAccountId: destinationAccountId,
                categoryId: categoryId,
                subcategoryId: subcategoryId,
                paymentMethodId: paymentMethodId,
                description: description,
                externalReference: externalReference,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                originalSourceId: originalSourceId,
                sourceMetadataJson: sourceMetadataJson,
                expenseBehavior: expenseBehavior,
                allocationGroup: allocationGroup,
                allocationGroupName: allocationGroupName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required int amountMinor,
                Value<String> currencyCode = const Value.absent(),
                required DateTime occurredAt,
                Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
                Value<String?> occurredTimezoneId = const Value.absent(),
                required String localDateKey,
                required String status,
                Value<String> verification = const Value.absent(),
                required String source,
                Value<String?> accountId = const Value.absent(),
                Value<String?> sourceAccountId = const Value.absent(),
                Value<String?> destinationAccountId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> subcategoryId = const Value.absent(),
                Value<String?> paymentMethodId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> externalReference = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> originalSourceId = const Value.absent(),
                Value<String?> sourceMetadataJson = const Value.absent(),
                Value<String?> expenseBehavior = const Value.absent(),
                Value<String?> allocationGroup = const Value.absent(),
                Value<String?> allocationGroupName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                kind: kind,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                occurredLocalOffsetMinutes: occurredLocalOffsetMinutes,
                occurredTimezoneId: occurredTimezoneId,
                localDateKey: localDateKey,
                status: status,
                verification: verification,
                source: source,
                accountId: accountId,
                sourceAccountId: sourceAccountId,
                destinationAccountId: destinationAccountId,
                categoryId: categoryId,
                subcategoryId: subcategoryId,
                paymentMethodId: paymentMethodId,
                description: description,
                externalReference: externalReference,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                originalSourceId: originalSourceId,
                sourceMetadataJson: sourceMetadataJson,
                expenseBehavior: expenseBehavior,
                allocationGroup: allocationGroup,
                allocationGroupName: allocationGroupName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionsTable, Transaction>(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountId = false,
                sourceAccountId = false,
                destinationAccountId = false,
                categoryId = false,
                subcategoryId = false,
                paymentMethodId = false,
                savingsContributionsRefs = false,
                candidateDuplicateReferences = false,
                candidateConfirmedTransactions = false,
                candidateDuplicateLinksRefs = false,
                importDuplicateReferences = false,
                importCommittedTransactions = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (savingsContributionsRefs) db.savingsContributions,
                    if (candidateDuplicateReferences)
                      db.detectedTransactionCandidates,
                    if (candidateConfirmedTransactions)
                      db.detectedTransactionCandidates,
                    if (candidateDuplicateLinksRefs) db.candidateDuplicateLinks,
                    if (importDuplicateReferences) db.importRows,
                    if (importCommittedTransactions) db.importRows,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountId,
                            referencedTable: $$TransactionsTableReferences
                                ._accountIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._accountIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (sourceAccountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceAccountId,
                            referencedTable: $$TransactionsTableReferences
                                ._sourceAccountIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._sourceAccountIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (destinationAccountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.destinationAccountId,
                            referencedTable: $$TransactionsTableReferences
                                ._destinationAccountIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._destinationAccountIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$TransactionsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (subcategoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.subcategoryId,
                            referencedTable: $$TransactionsTableReferences
                                ._subcategoryIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._subcategoryIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (paymentMethodId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.paymentMethodId,
                            referencedTable: $$TransactionsTableReferences
                                ._paymentMethodIdTable(db),
                            referencedColumn: $$TransactionsTableReferences
                                ._paymentMethodIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (savingsContributionsRefs)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          SavingsContribution,
                          $SavingsContributionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._savingsContributionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).savingsContributionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'transaction_id',
                          typedResults: items,
                        ),
                      if (candidateDuplicateReferences)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._candidateDuplicateReferencesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).candidateDuplicateReferences,
                          currentColumn: 'id',
                          referencedColumn: 'duplicate_of_transaction_id',
                          typedResults: items,
                        ),
                      if (candidateConfirmedTransactions)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._candidateConfirmedTransactionsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).candidateConfirmedTransactions,
                          currentColumn: 'id',
                          referencedColumn: 'confirmed_transaction_id',
                          typedResults: items,
                        ),
                      if (candidateDuplicateLinksRefs)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          CandidateDuplicateLink,
                          $CandidateDuplicateLinksTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._candidateDuplicateLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).candidateDuplicateLinksRefs,
                          currentColumn: 'id',
                          referencedColumn: 'related_transaction_id',
                          typedResults: items,
                        ),
                      if (importDuplicateReferences)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          ImportRow,
                          $ImportRowsTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._importDuplicateReferencesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).importDuplicateReferences,
                          currentColumn: 'id',
                          referencedColumn: 'duplicate_of_transaction_id',
                          typedResults: items,
                        ),
                      if (importCommittedTransactions)
                        await $_getPrefetchedDataByColumns<
                          Transaction,
                          $TransactionsTable,
                          ImportRow,
                          $ImportRowsTable
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._importCommittedTransactionsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).importCommittedTransactions,
                          currentColumn: 'id',
                          referencedColumn: 'committed_transaction_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({
        bool accountId,
        bool sourceAccountId,
        bool destinationAccountId,
        bool categoryId,
        bool subcategoryId,
        bool paymentMethodId,
        bool savingsContributionsRefs,
        bool candidateDuplicateReferences,
        bool candidateConfirmedTransactions,
        bool candidateDuplicateLinksRefs,
        bool importDuplicateReferences,
        bool importCommittedTransactions,
      })
    >;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  required String id,
  required String periodType,
  required String periodKey,
  Value<String?> categoryId,
  Value<String?> planId,
  Value<String?> name,
  required String budgetMode,
  Value<String?> allocationGroup,
  Value<int?> allocationPercentage,
  Value<int?> limitMinor,
  Value<String> currencyCode,
  Value<String?> incomeBaseMode,
  Value<int?> incomeBaseAmountMinor,
  Value<int?> alertThresholdMinor,
  Value<bool> isActive,
  Value<bool> isArchived,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<String> id,
  Value<String> periodType,
  Value<String> periodKey,
  Value<String?> categoryId,
  Value<String?> planId,
  Value<String?> name,
  Value<String> budgetMode,
  Value<String?> allocationGroup,
  Value<int?> allocationPercentage,
  Value<int?> limitMinor,
  Value<String> currencyCode,
  Value<String?> incomeBaseMode,
  Value<int?> incomeBaseAmountMinor,
  Value<int?> alertThresholdMinor,
  Value<bool> isActive,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$BudgetsTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetsTable, Budget> {
  $$BudgetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('budgets__category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BudgetsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodKey => $composableBuilder(
    column: $table.periodKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get budgetMode => $composableBuilder(
    column: $table.budgetMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get allocationPercentage => $composableBuilder(
    column: $table.allocationPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incomeBaseMode => $composableBuilder(
    column: $table.incomeBaseMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get incomeBaseAmountMinor => $composableBuilder(
    column: $table.incomeBaseAmountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get alertThresholdMinor => $composableBuilder(
    column: $table.alertThresholdMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodKey => $composableBuilder(
    column: $table.periodKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get budgetMode => $composableBuilder(
    column: $table.budgetMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get allocationPercentage => $composableBuilder(
    column: $table.allocationPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incomeBaseMode => $composableBuilder(
    column: $table.incomeBaseMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get incomeBaseAmountMinor => $composableBuilder(
    column: $table.incomeBaseAmountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get alertThresholdMinor => $composableBuilder(
    column: $table.alertThresholdMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get periodKey =>
      $composableBuilder(column: $table.periodKey, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get budgetMode => $composableBuilder(
    column: $table.budgetMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => column,
  );

  GeneratedColumn<int> get allocationPercentage => $composableBuilder(
    column: $table.allocationPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get incomeBaseMode => $composableBuilder(
    column: $table.incomeBaseMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get incomeBaseAmountMinor => $composableBuilder(
    column: $table.incomeBaseAmountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get alertThresholdMinor => $composableBuilder(
    column: $table.alertThresholdMinor,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetsTable,
          Budget,
          $$BudgetsTableFilterComposer,
          $$BudgetsTableOrderingComposer,
          $$BudgetsTableAnnotationComposer,
          $$BudgetsTableCreateCompanionBuilder,
          $$BudgetsTableUpdateCompanionBuilder,
          (Budget, $$BudgetsTableReferences),
          Budget,
          PrefetchHooks Function({bool categoryId})
        > {
  $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> periodType = const Value.absent(),
                Value<String> periodKey = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> planId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String> budgetMode = const Value.absent(),
                Value<String?> allocationGroup = const Value.absent(),
                Value<int?> allocationPercentage = const Value.absent(),
                Value<int?> limitMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String?> incomeBaseMode = const Value.absent(),
                Value<int?> incomeBaseAmountMinor = const Value.absent(),
                Value<int?> alertThresholdMinor = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetsCompanion(
                id: id,
                periodType: periodType,
                periodKey: periodKey,
                categoryId: categoryId,
                planId: planId,
                name: name,
                budgetMode: budgetMode,
                allocationGroup: allocationGroup,
                allocationPercentage: allocationPercentage,
                limitMinor: limitMinor,
                currencyCode: currencyCode,
                incomeBaseMode: incomeBaseMode,
                incomeBaseAmountMinor: incomeBaseAmountMinor,
                alertThresholdMinor: alertThresholdMinor,
                isActive: isActive,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String periodType,
                required String periodKey,
                Value<String?> categoryId = const Value.absent(),
                Value<String?> planId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                required String budgetMode,
                Value<String?> allocationGroup = const Value.absent(),
                Value<int?> allocationPercentage = const Value.absent(),
                Value<int?> limitMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String?> incomeBaseMode = const Value.absent(),
                Value<int?> incomeBaseAmountMinor = const Value.absent(),
                Value<int?> alertThresholdMinor = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => BudgetsCompanion.insert(
                id: id,
                periodType: periodType,
                periodKey: periodKey,
                categoryId: categoryId,
                planId: planId,
                name: name,
                budgetMode: budgetMode,
                allocationGroup: allocationGroup,
                allocationPercentage: allocationPercentage,
                limitMinor: limitMinor,
                currencyCode: currencyCode,
                incomeBaseMode: incomeBaseMode,
                incomeBaseAmountMinor: incomeBaseAmountMinor,
                alertThresholdMinor: alertThresholdMinor,
                isActive: isActive,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BudgetsTable, Budget>(table),
                  $$BudgetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.categoryId,
                        referencedTable: $$BudgetsTableReferences
                            ._categoryIdTable(db),
                        referencedColumn: $$BudgetsTableReferences
                            ._categoryIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BudgetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetsTable,
      Budget,
      $$BudgetsTableFilterComposer,
      $$BudgetsTableOrderingComposer,
      $$BudgetsTableAnnotationComposer,
      $$BudgetsTableCreateCompanionBuilder,
      $$BudgetsTableUpdateCompanionBuilder,
      (Budget, $$BudgetsTableReferences),
      Budget,
      PrefetchHooks Function({bool categoryId})
    >;
typedef $$SavingsGoalsTableCreateCompanionBuilder =
    SavingsGoalsCompanion Function({
      required String id,
      required String name,
      required int targetMinor,
      Value<String> currencyCode,
      Value<DateTime?> deadlineAt,
      Value<String?> accountId,
      Value<String> status,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SavingsGoalsTableUpdateCompanionBuilder =
    SavingsGoalsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> targetMinor,
      Value<String> currencyCode,
      Value<DateTime?> deadlineAt,
      Value<String?> accountId,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SavingsGoalsTableReferences
    extends BaseReferences<_$AppDatabase, $SavingsGoalsTable, SavingsGoal> {
  $$SavingsGoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('savings_goals__account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get accountId {
    final $_column = $_itemColumn<String>('account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SavingsContributionsTable,
    List<SavingsContribution>
  >
  _savingsContributionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.savingsContributions,
        aliasName: 'savings_goals__id__savings_contributions__goal_id',
      );

  $$SavingsContributionsTableProcessedTableManager
  get savingsContributionsRefs {
    final manager = $$SavingsContributionsTableTableManager(
      $_db,
      $_db.savingsContributions,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _savingsContributionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SavingsGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> savingsContributionsRefs(
    Expression<bool> Function($$SavingsContributionsTableFilterComposer f) f,
  ) {
    final $$SavingsContributionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.savingsContributions,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsContributionsTableFilterComposer(
            $db: $db,
            $table: $db.savingsContributions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SavingsGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> savingsContributionsRefs<T extends Object>(
    Expression<T> Function($$SavingsContributionsTableAnnotationComposer a) f,
  ) {
    final $$SavingsContributionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.savingsContributions,
          getReferencedColumn: (t) => t.goalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SavingsContributionsTableAnnotationComposer(
                $db: $db,
                $table: $db.savingsContributions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SavingsGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsGoalsTable,
          SavingsGoal,
          $$SavingsGoalsTableFilterComposer,
          $$SavingsGoalsTableOrderingComposer,
          $$SavingsGoalsTableAnnotationComposer,
          $$SavingsGoalsTableCreateCompanionBuilder,
          $$SavingsGoalsTableUpdateCompanionBuilder,
          (SavingsGoal, $$SavingsGoalsTableReferences),
          SavingsGoal,
          PrefetchHooks Function({
            bool accountId,
            bool savingsContributionsRefs,
          })
        > {
  $$SavingsGoalsTableTableManager(_$AppDatabase db, $SavingsGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> targetMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime?> deadlineAt = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavingsGoalsCompanion(
                id: id,
                name: name,
                targetMinor: targetMinor,
                currencyCode: currencyCode,
                deadlineAt: deadlineAt,
                accountId: accountId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int targetMinor,
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime?> deadlineAt = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SavingsGoalsCompanion.insert(
                id: id,
                name: name,
                targetMinor: targetMinor,
                currencyCode: currencyCode,
                deadlineAt: deadlineAt,
                accountId: accountId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SavingsGoalsTable, SavingsGoal>(table),
                  $$SavingsGoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({accountId = false, savingsContributionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (savingsContributionsRefs) db.savingsContributions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountId,
                            referencedTable: $$SavingsGoalsTableReferences
                                ._accountIdTable(db),
                            referencedColumn: $$SavingsGoalsTableReferences
                                ._accountIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (savingsContributionsRefs)
                        await $_getPrefetchedDataByColumns<
                          SavingsGoal,
                          $SavingsGoalsTable,
                          SavingsContribution,
                          $SavingsContributionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SavingsGoalsTableReferences
                              ._savingsContributionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SavingsGoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).savingsContributionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'goal_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SavingsGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsGoalsTable,
      SavingsGoal,
      $$SavingsGoalsTableFilterComposer,
      $$SavingsGoalsTableOrderingComposer,
      $$SavingsGoalsTableAnnotationComposer,
      $$SavingsGoalsTableCreateCompanionBuilder,
      $$SavingsGoalsTableUpdateCompanionBuilder,
      (SavingsGoal, $$SavingsGoalsTableReferences),
      SavingsGoal,
      PrefetchHooks Function({bool accountId, bool savingsContributionsRefs})
    >;
typedef $$SavingsContributionsTableCreateCompanionBuilder =
    SavingsContributionsCompanion Function({
      required String id,
      required String goalId,
      Value<String?> transactionId,
      required int amountMinor,
      Value<String> currencyCode,
      required DateTime occurredAt,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$SavingsContributionsTableUpdateCompanionBuilder =
    SavingsContributionsCompanion Function({
      Value<String> id,
      Value<String> goalId,
      Value<String?> transactionId,
      Value<int> amountMinor,
      Value<String> currencyCode,
      Value<DateTime> occurredAt,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$SavingsContributionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SavingsContributionsTable,
          SavingsContribution
        > {
  $$SavingsContributionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SavingsGoalsTable _goalIdTable(_$AppDatabase db) => db.savingsGoals
      .createAlias('savings_contributions__goal_id__savings_goals__id');

  $$SavingsGoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<String>('goal_id')!;

    final manager = $$SavingsGoalsTableTableManager(
      $_db,
      $_db.savingsGoals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) => db
      .transactions
      .createAlias('savings_contributions__transaction_id__transactions__id');

  $$TransactionsTableProcessedTableManager? get transactionId {
    final $_column = $_itemColumn<String>('transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SavingsContributionsTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsContributionsTable> {
  $$SavingsContributionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SavingsGoalsTableFilterComposer get goalId {
    final $$SavingsGoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.savingsGoals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsGoalsTableFilterComposer(
            $db: $db,
            $table: $db.savingsGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsContributionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsContributionsTable> {
  $$SavingsContributionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SavingsGoalsTableOrderingComposer get goalId {
    final $$SavingsGoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.savingsGoals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsGoalsTableOrderingComposer(
            $db: $db,
            $table: $db.savingsGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsContributionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsContributionsTable> {
  $$SavingsContributionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SavingsGoalsTableAnnotationComposer get goalId {
    final $$SavingsGoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.savingsGoals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavingsGoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.savingsGoals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavingsContributionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsContributionsTable,
          SavingsContribution,
          $$SavingsContributionsTableFilterComposer,
          $$SavingsContributionsTableOrderingComposer,
          $$SavingsContributionsTableAnnotationComposer,
          $$SavingsContributionsTableCreateCompanionBuilder,
          $$SavingsContributionsTableUpdateCompanionBuilder,
          (SavingsContribution, $$SavingsContributionsTableReferences),
          SavingsContribution,
          PrefetchHooks Function({bool goalId, bool transactionId})
        > {
  $$SavingsContributionsTableTableManager(
    _$AppDatabase db,
    $SavingsContributionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsContributionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsContributionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SavingsContributionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> goalId = const Value.absent(),
                Value<String?> transactionId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavingsContributionsCompanion(
                id: id,
                goalId: goalId,
                transactionId: transactionId,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String goalId,
                Value<String?> transactionId = const Value.absent(),
                required int amountMinor,
                Value<String> currencyCode = const Value.absent(),
                required DateTime occurredAt,
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SavingsContributionsCompanion.insert(
                id: id,
                goalId: goalId,
                transactionId: transactionId,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SavingsContributionsTable, SavingsContribution>(
                    table,
                  ),
                  $$SavingsContributionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false, transactionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.goalId,
                        referencedTable: $$SavingsContributionsTableReferences
                            ._goalIdTable(db),
                        referencedColumn: $$SavingsContributionsTableReferences
                            ._goalIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (transactionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.transactionId,
                        referencedTable: $$SavingsContributionsTableReferences
                            ._transactionIdTable(db),
                        referencedColumn: $$SavingsContributionsTableReferences
                            ._transactionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SavingsContributionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsContributionsTable,
      SavingsContribution,
      $$SavingsContributionsTableFilterComposer,
      $$SavingsContributionsTableOrderingComposer,
      $$SavingsContributionsTableAnnotationComposer,
      $$SavingsContributionsTableCreateCompanionBuilder,
      $$SavingsContributionsTableUpdateCompanionBuilder,
      (SavingsContribution, $$SavingsContributionsTableReferences),
      SavingsContribution,
      PrefetchHooks Function({bool goalId, bool transactionId})
    >;
typedef $$RecurringPlansTableCreateCompanionBuilder =
    RecurringPlansCompanion Function({
      required String id,
      required String name,
      required String cadence,
      required DateTime startAt,
      required DateTime nextDueAt,
      Value<DateTime?> endAt,
      Value<String> status,
      required String templateKind,
      required String templateDataJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$RecurringPlansTableUpdateCompanionBuilder =
    RecurringPlansCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> cadence,
      Value<DateTime> startAt,
      Value<DateTime> nextDueAt,
      Value<DateTime?> endAt,
      Value<String> status,
      Value<String> templateKind,
      Value<String> templateDataJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$RecurringPlansTableFilterComposer
    extends Composer<_$AppDatabase, $RecurringPlansTable> {
  $$RecurringPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKind => $composableBuilder(
    column: $table.templateKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateDataJson => $composableBuilder(
    column: $table.templateDataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecurringPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $RecurringPlansTable> {
  $$RecurringPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKind => $composableBuilder(
    column: $table.templateKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateDataJson => $composableBuilder(
    column: $table.templateDataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecurringPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecurringPlansTable> {
  $$RecurringPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get cadence =>
      $composableBuilder(column: $table.cadence, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueAt =>
      $composableBuilder(column: $table.nextDueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get templateKind => $composableBuilder(
    column: $table.templateKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get templateDataJson => $composableBuilder(
    column: $table.templateDataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RecurringPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecurringPlansTable,
          RecurringPlan,
          $$RecurringPlansTableFilterComposer,
          $$RecurringPlansTableOrderingComposer,
          $$RecurringPlansTableAnnotationComposer,
          $$RecurringPlansTableCreateCompanionBuilder,
          $$RecurringPlansTableUpdateCompanionBuilder,
          (
            RecurringPlan,
            BaseReferences<_$AppDatabase, $RecurringPlansTable, RecurringPlan>,
          ),
          RecurringPlan,
          PrefetchHooks Function()
        > {
  $$RecurringPlansTableTableManager(
    _$AppDatabase db,
    $RecurringPlansTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecurringPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecurringPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecurringPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> cadence = const Value.absent(),
                Value<DateTime> startAt = const Value.absent(),
                Value<DateTime> nextDueAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> templateKind = const Value.absent(),
                Value<String> templateDataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecurringPlansCompanion(
                id: id,
                name: name,
                cadence: cadence,
                startAt: startAt,
                nextDueAt: nextDueAt,
                endAt: endAt,
                status: status,
                templateKind: templateKind,
                templateDataJson: templateDataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String cadence,
                required DateTime startAt,
                required DateTime nextDueAt,
                Value<DateTime?> endAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                required String templateKind,
                required String templateDataJson,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RecurringPlansCompanion.insert(
                id: id,
                name: name,
                cadence: cadence,
                startAt: startAt,
                nextDueAt: nextDueAt,
                endAt: endAt,
                status: status,
                templateKind: templateKind,
                templateDataJson: templateDataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecurringPlansTable, RecurringPlan>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $RecurringPlansTable,
                    RecurringPlan
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecurringPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecurringPlansTable,
      RecurringPlan,
      $$RecurringPlansTableFilterComposer,
      $$RecurringPlansTableOrderingComposer,
      $$RecurringPlansTableAnnotationComposer,
      $$RecurringPlansTableCreateCompanionBuilder,
      $$RecurringPlansTableUpdateCompanionBuilder,
      (
        RecurringPlan,
        BaseReferences<_$AppDatabase, $RecurringPlansTable, RecurringPlan>,
      ),
      RecurringPlan,
      PrefetchHooks Function()
    >;
typedef $$DetectedTransactionCandidatesTableCreateCompanionBuilder =
    DetectedTransactionCandidatesCompanion Function({
      required String id,
      required String source,
      Value<String?> sourceApp,
      Value<String?> sourceReference,
      required String normalizedKind,
      Value<String?> expenseBehavior,
      Value<String?> allocationGroup,
      Value<String?> allocationGroupName,
      required int amountMinor,
      Value<String> currencyCode,
      required DateTime occurredAt,
      Value<int?> occurredLocalOffsetMinutes,
      Value<String?> occurredTimezoneId,
      required String localDateKey,
      Value<String?> accountId,
      Value<String?> sourceAccountId,
      Value<String?> destinationAccountId,
      Value<String?> categoryId,
      Value<String?> paymentMethodId,
      Value<String?> description,
      Value<String?> partyDetails,
      Value<String?> sourceContext,
      Value<double> confidence,
      required String statusEvidence,
      Value<String> candidateState,
      Value<String?> duplicateOfTransactionId,
      Value<String?> confirmedTransactionId,
      required DateTime receivedAt,
      Value<String?> sourceMetadataJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$DetectedTransactionCandidatesTableUpdateCompanionBuilder =
    DetectedTransactionCandidatesCompanion Function({
      Value<String> id,
      Value<String> source,
      Value<String?> sourceApp,
      Value<String?> sourceReference,
      Value<String> normalizedKind,
      Value<String?> expenseBehavior,
      Value<String?> allocationGroup,
      Value<String?> allocationGroupName,
      Value<int> amountMinor,
      Value<String> currencyCode,
      Value<DateTime> occurredAt,
      Value<int?> occurredLocalOffsetMinutes,
      Value<String?> occurredTimezoneId,
      Value<String> localDateKey,
      Value<String?> accountId,
      Value<String?> sourceAccountId,
      Value<String?> destinationAccountId,
      Value<String?> categoryId,
      Value<String?> paymentMethodId,
      Value<String?> description,
      Value<String?> partyDetails,
      Value<String?> sourceContext,
      Value<double> confidence,
      Value<String> statusEvidence,
      Value<String> candidateState,
      Value<String?> duplicateOfTransactionId,
      Value<String?> confirmedTransactionId,
      Value<DateTime> receivedAt,
      Value<String?> sourceMetadataJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$DetectedTransactionCandidatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DetectedTransactionCandidatesTable,
          DetectedTransactionCandidate
        > {
  $$DetectedTransactionCandidatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountsTable _accountIdTable(_$AppDatabase db) => db.accounts
      .createAlias('detected_transaction_candidates__account_id__accounts__id');

  $$AccountsTableProcessedTableManager? get accountId {
    final $_column = $_itemColumn<String>('account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountsTable _sourceAccountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias(
        'detected_transaction_candidates__source_account_id__accounts__id',
      );

  $$AccountsTableProcessedTableManager? get sourceAccountId {
    final $_column = $_itemColumn<String>('source_account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountsTable _destinationAccountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias(
        'detected_transaction_candidates__destination_account_id__accounts__id',
      );

  $$AccountsTableProcessedTableManager? get destinationAccountId {
    final $_column = $_itemColumn<String>('destination_account_id');
    if ($_column == null) return null;
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _destinationAccountIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        'detected_transaction_candidates__category_id__categories__id',
      );

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PaymentMethodsTable _paymentMethodIdTable(
    _$AppDatabase db,
  ) => db.paymentMethods.createAlias(
    'detected_transaction_candidates__payment_method_id__payment_methods__id',
  );

  $$PaymentMethodsTableProcessedTableManager? get paymentMethodId {
    final $_column = $_itemColumn<String>('payment_method_id');
    if ($_column == null) return null;
    final manager = $$PaymentMethodsTableTableManager(
      $_db,
      $_db.paymentMethods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentMethodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _duplicateOfTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        'detected_transaction_candidates__duplicate_of_transaction_id__transactions__id',
      );

  $$TransactionsTableProcessedTableManager? get duplicateOfTransactionId {
    final $_column = $_itemColumn<String>('duplicate_of_transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _duplicateOfTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _confirmedTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        'detected_transaction_candidates__confirmed_transaction_id__transactions__id',
      );

  $$TransactionsTableProcessedTableManager? get confirmedTransactionId {
    final $_column = $_itemColumn<String>('confirmed_transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _confirmedTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $CandidateDuplicateLinksTable,
    List<CandidateDuplicateLink>
  >
  _candidateLinksTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.candidateDuplicateLinks,
    aliasName: 'detected_transaction_candidates__id__candidate_duplicate_links__candidate_id',
  );

  $$CandidateDuplicateLinksTableProcessedTableManager get candidateLinks {
    final manager = $$CandidateDuplicateLinksTableTableManager(
      $_db,
      $_db.candidateDuplicateLinks,
    ).filter((f) => f.candidateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_candidateLinksTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CandidateDuplicateLinksTable,
    List<CandidateDuplicateLink>
  >
  _relatedCandidateLinksTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.candidateDuplicateLinks,
        aliasName: 'detected_transaction_candidates__id__candidate_duplicate_links__related_candidate_id',
      );

  $$CandidateDuplicateLinksTableProcessedTableManager
  get relatedCandidateLinks {
    final manager =
        $$CandidateDuplicateLinksTableTableManager(
          $_db,
          $_db.candidateDuplicateLinks,
        ).filter(
          (f) => f.relatedCandidateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _relatedCandidateLinksTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CandidateFingerprintsTable,
    List<CandidateFingerprint>
  >
  _candidateFingerprintsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.candidateFingerprints,
        aliasName: 'detected_transaction_candidates__id__candidate_fingerprints__candidate_id',
      );

  $$CandidateFingerprintsTableProcessedTableManager
  get candidateFingerprintsRefs {
    final manager = $$CandidateFingerprintsTableTableManager(
      $_db,
      $_db.candidateFingerprints,
    ).filter((f) => f.candidateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _candidateFingerprintsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ImportRowsTable, List<ImportRow>>
  _importCandidatesTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.importRows,
    aliasName: 'detected_transaction_candidates__id__import_rows__candidate_id',
  );

  $$ImportRowsTableProcessedTableManager get importCandidates {
    final manager = $$ImportRowsTableTableManager(
      $_db,
      $_db.importRows,
    ).filter((f) => f.candidateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_importCandidatesTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DetectedTransactionCandidatesTableFilterComposer
    extends Composer<_$AppDatabase, $DetectedTransactionCandidatesTable> {
  $$DetectedTransactionCandidatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceApp => $composableBuilder(
    column: $table.sourceApp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalizedKind => $composableBuilder(
    column: $table.normalizedKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partyDetails => $composableBuilder(
    column: $table.partyDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceContext => $composableBuilder(
    column: $table.sourceContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusEvidence => $composableBuilder(
    column: $table.statusEvidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get candidateState => $composableBuilder(
    column: $table.candidateState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableFilterComposer get sourceAccountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableFilterComposer get destinationAccountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableFilterComposer get paymentMethodId {
    final $$PaymentMethodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableFilterComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get duplicateOfTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get confirmedTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.confirmedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> candidateLinks(
    Expression<bool> Function($$CandidateDuplicateLinksTableFilterComposer f) f,
  ) {
    final $$CandidateDuplicateLinksTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.candidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableFilterComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> relatedCandidateLinks(
    Expression<bool> Function($$CandidateDuplicateLinksTableFilterComposer f) f,
  ) {
    final $$CandidateDuplicateLinksTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.relatedCandidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableFilterComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> candidateFingerprintsRefs(
    Expression<bool> Function($$CandidateFingerprintsTableFilterComposer f) f,
  ) {
    final $$CandidateFingerprintsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateFingerprints,
          getReferencedColumn: (t) => t.candidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateFingerprintsTableFilterComposer(
                $db: $db,
                $table: $db.candidateFingerprints,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> importCandidates(
    Expression<bool> Function($$ImportRowsTableFilterComposer f) f,
  ) {
    final $$ImportRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.candidateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableFilterComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DetectedTransactionCandidatesTableOrderingComposer
    extends Composer<_$AppDatabase, $DetectedTransactionCandidatesTable> {
  $$DetectedTransactionCandidatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceApp => $composableBuilder(
    column: $table.sourceApp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalizedKind => $composableBuilder(
    column: $table.normalizedKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyDetails => $composableBuilder(
    column: $table.partyDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceContext => $composableBuilder(
    column: $table.sourceContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusEvidence => $composableBuilder(
    column: $table.statusEvidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get candidateState => $composableBuilder(
    column: $table.candidateState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableOrderingComposer get sourceAccountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableOrderingComposer get destinationAccountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableOrderingComposer get paymentMethodId {
    final $$PaymentMethodsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableOrderingComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get duplicateOfTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get confirmedTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.confirmedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetectedTransactionCandidatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetectedTransactionCandidatesTable> {
  $$DetectedTransactionCandidatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceApp =>
      $composableBuilder(column: $table.sourceApp, builder: (column) => column);

  GeneratedColumn<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get normalizedKind => $composableBuilder(
    column: $table.normalizedKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expenseBehavior => $composableBuilder(
    column: $table.expenseBehavior,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocationGroup => $composableBuilder(
    column: $table.allocationGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocationGroupName => $composableBuilder(
    column: $table.allocationGroupName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occurredLocalOffsetMinutes => $composableBuilder(
    column: $table.occurredLocalOffsetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get occurredTimezoneId => $composableBuilder(
    column: $table.occurredTimezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partyDetails => $composableBuilder(
    column: $table.partyDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceContext => $composableBuilder(
    column: $table.sourceContext,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusEvidence => $composableBuilder(
    column: $table.statusEvidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get candidateState => $composableBuilder(
    column: $table.candidateState,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceMetadataJson => $composableBuilder(
    column: $table.sourceMetadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableAnnotationComposer get sourceAccountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountsTableAnnotationComposer get destinationAccountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationAccountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentMethodsTableAnnotationComposer get paymentMethodId {
    final $$PaymentMethodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentMethodId,
      referencedTable: $db.paymentMethods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentMethodsTableAnnotationComposer(
            $db: $db,
            $table: $db.paymentMethods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get duplicateOfTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get confirmedTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.confirmedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> candidateLinks<T extends Object>(
    Expression<T> Function($$CandidateDuplicateLinksTableAnnotationComposer a)
    f,
  ) {
    final $$CandidateDuplicateLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.candidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> relatedCandidateLinks<T extends Object>(
    Expression<T> Function($$CandidateDuplicateLinksTableAnnotationComposer a)
    f,
  ) {
    final $$CandidateDuplicateLinksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateDuplicateLinks,
          getReferencedColumn: (t) => t.relatedCandidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateDuplicateLinksTableAnnotationComposer(
                $db: $db,
                $table: $db.candidateDuplicateLinks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> candidateFingerprintsRefs<T extends Object>(
    Expression<T> Function($$CandidateFingerprintsTableAnnotationComposer a) f,
  ) {
    final $$CandidateFingerprintsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.candidateFingerprints,
          getReferencedColumn: (t) => t.candidateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CandidateFingerprintsTableAnnotationComposer(
                $db: $db,
                $table: $db.candidateFingerprints,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> importCandidates<T extends Object>(
    Expression<T> Function($$ImportRowsTableAnnotationComposer a) f,
  ) {
    final $$ImportRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.candidateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DetectedTransactionCandidatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetectedTransactionCandidatesTable,
          DetectedTransactionCandidate,
          $$DetectedTransactionCandidatesTableFilterComposer,
          $$DetectedTransactionCandidatesTableOrderingComposer,
          $$DetectedTransactionCandidatesTableAnnotationComposer,
          $$DetectedTransactionCandidatesTableCreateCompanionBuilder,
          $$DetectedTransactionCandidatesTableUpdateCompanionBuilder,
          (
            DetectedTransactionCandidate,
            $$DetectedTransactionCandidatesTableReferences,
          ),
          DetectedTransactionCandidate,
          PrefetchHooks Function({
            bool accountId,
            bool sourceAccountId,
            bool destinationAccountId,
            bool categoryId,
            bool paymentMethodId,
            bool duplicateOfTransactionId,
            bool confirmedTransactionId,
            bool candidateLinks,
            bool relatedCandidateLinks,
            bool candidateFingerprintsRefs,
            bool importCandidates,
          })
        > {
  $$DetectedTransactionCandidatesTableTableManager(
    _$AppDatabase db,
    $DetectedTransactionCandidatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetectedTransactionCandidatesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DetectedTransactionCandidatesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> sourceApp = const Value.absent(),
                Value<String?> sourceReference = const Value.absent(),
                Value<String> normalizedKind = const Value.absent(),
                Value<String?> expenseBehavior = const Value.absent(),
                Value<String?> allocationGroup = const Value.absent(),
                Value<String?> allocationGroupName = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
                Value<String?> occurredTimezoneId = const Value.absent(),
                Value<String> localDateKey = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<String?> sourceAccountId = const Value.absent(),
                Value<String?> destinationAccountId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> paymentMethodId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> partyDetails = const Value.absent(),
                Value<String?> sourceContext = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> statusEvidence = const Value.absent(),
                Value<String> candidateState = const Value.absent(),
                Value<String?> duplicateOfTransactionId = const Value.absent(),
                Value<String?> confirmedTransactionId = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
                Value<String?> sourceMetadataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DetectedTransactionCandidatesCompanion(
                id: id,
                source: source,
                sourceApp: sourceApp,
                sourceReference: sourceReference,
                normalizedKind: normalizedKind,
                expenseBehavior: expenseBehavior,
                allocationGroup: allocationGroup,
                allocationGroupName: allocationGroupName,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                occurredLocalOffsetMinutes: occurredLocalOffsetMinutes,
                occurredTimezoneId: occurredTimezoneId,
                localDateKey: localDateKey,
                accountId: accountId,
                sourceAccountId: sourceAccountId,
                destinationAccountId: destinationAccountId,
                categoryId: categoryId,
                paymentMethodId: paymentMethodId,
                description: description,
                partyDetails: partyDetails,
                sourceContext: sourceContext,
                confidence: confidence,
                statusEvidence: statusEvidence,
                candidateState: candidateState,
                duplicateOfTransactionId: duplicateOfTransactionId,
                confirmedTransactionId: confirmedTransactionId,
                receivedAt: receivedAt,
                sourceMetadataJson: sourceMetadataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String source,
                Value<String?> sourceApp = const Value.absent(),
                Value<String?> sourceReference = const Value.absent(),
                required String normalizedKind,
                Value<String?> expenseBehavior = const Value.absent(),
                Value<String?> allocationGroup = const Value.absent(),
                Value<String?> allocationGroupName = const Value.absent(),
                required int amountMinor,
                Value<String> currencyCode = const Value.absent(),
                required DateTime occurredAt,
                Value<int?> occurredLocalOffsetMinutes = const Value.absent(),
                Value<String?> occurredTimezoneId = const Value.absent(),
                required String localDateKey,
                Value<String?> accountId = const Value.absent(),
                Value<String?> sourceAccountId = const Value.absent(),
                Value<String?> destinationAccountId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> paymentMethodId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> partyDetails = const Value.absent(),
                Value<String?> sourceContext = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                required String statusEvidence,
                Value<String> candidateState = const Value.absent(),
                Value<String?> duplicateOfTransactionId = const Value.absent(),
                Value<String?> confirmedTransactionId = const Value.absent(),
                required DateTime receivedAt,
                Value<String?> sourceMetadataJson = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DetectedTransactionCandidatesCompanion.insert(
                id: id,
                source: source,
                sourceApp: sourceApp,
                sourceReference: sourceReference,
                normalizedKind: normalizedKind,
                expenseBehavior: expenseBehavior,
                allocationGroup: allocationGroup,
                allocationGroupName: allocationGroupName,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredAt: occurredAt,
                occurredLocalOffsetMinutes: occurredLocalOffsetMinutes,
                occurredTimezoneId: occurredTimezoneId,
                localDateKey: localDateKey,
                accountId: accountId,
                sourceAccountId: sourceAccountId,
                destinationAccountId: destinationAccountId,
                categoryId: categoryId,
                paymentMethodId: paymentMethodId,
                description: description,
                partyDetails: partyDetails,
                sourceContext: sourceContext,
                confidence: confidence,
                statusEvidence: statusEvidence,
                candidateState: candidateState,
                duplicateOfTransactionId: duplicateOfTransactionId,
                confirmedTransactionId: confirmedTransactionId,
                receivedAt: receivedAt,
                sourceMetadataJson: sourceMetadataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $DetectedTransactionCandidatesTable,
                    DetectedTransactionCandidate
                  >(table),
                  $$DetectedTransactionCandidatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountId = false,
                sourceAccountId = false,
                destinationAccountId = false,
                categoryId = false,
                paymentMethodId = false,
                duplicateOfTransactionId = false,
                confirmedTransactionId = false,
                candidateLinks = false,
                relatedCandidateLinks = false,
                candidateFingerprintsRefs = false,
                importCandidates = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (candidateLinks) db.candidateDuplicateLinks,
                    if (relatedCandidateLinks) db.candidateDuplicateLinks,
                    if (candidateFingerprintsRefs) db.candidateFingerprints,
                    if (importCandidates) db.importRows,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._accountIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._accountIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (sourceAccountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceAccountId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._sourceAccountIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._sourceAccountIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (destinationAccountId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.destinationAccountId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._destinationAccountIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._destinationAccountIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._categoryIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (paymentMethodId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.paymentMethodId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._paymentMethodIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._paymentMethodIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (duplicateOfTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.duplicateOfTransactionId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._duplicateOfTransactionIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._duplicateOfTransactionIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (confirmedTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.confirmedTransactionId,
                            referencedTable:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._confirmedTransactionIdTable(db),
                            referencedColumn:
                                $$DetectedTransactionCandidatesTableReferences
                                    ._confirmedTransactionIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (candidateLinks)
                        await $_getPrefetchedDataByColumns<
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable,
                          CandidateDuplicateLink,
                          $CandidateDuplicateLinksTable
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DetectedTransactionCandidatesTableReferences
                                  ._candidateLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetectedTransactionCandidatesTableReferences(
                                db,
                                table,
                                p0,
                              ).candidateLinks,
                          currentColumn: 'id',
                          referencedColumn: 'candidate_id',
                          typedResults: items,
                        ),
                      if (relatedCandidateLinks)
                        await $_getPrefetchedDataByColumns<
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable,
                          CandidateDuplicateLink,
                          $CandidateDuplicateLinksTable
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DetectedTransactionCandidatesTableReferences
                                  ._relatedCandidateLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetectedTransactionCandidatesTableReferences(
                                db,
                                table,
                                p0,
                              ).relatedCandidateLinks,
                          currentColumn: 'id',
                          referencedColumn: 'related_candidate_id',
                          typedResults: items,
                        ),
                      if (candidateFingerprintsRefs)
                        await $_getPrefetchedDataByColumns<
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable,
                          CandidateFingerprint,
                          $CandidateFingerprintsTable
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DetectedTransactionCandidatesTableReferences
                                  ._candidateFingerprintsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetectedTransactionCandidatesTableReferences(
                                db,
                                table,
                                p0,
                              ).candidateFingerprintsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'candidate_id',
                          typedResults: items,
                        ),
                      if (importCandidates)
                        await $_getPrefetchedDataByColumns<
                          DetectedTransactionCandidate,
                          $DetectedTransactionCandidatesTable,
                          ImportRow,
                          $ImportRowsTable
                        >(
                          currentTable: table,
                          referencedTable:
                              $$DetectedTransactionCandidatesTableReferences
                                  ._importCandidatesTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetectedTransactionCandidatesTableReferences(
                                db,
                                table,
                                p0,
                              ).importCandidates,
                          currentColumn: 'id',
                          referencedColumn: 'candidate_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DetectedTransactionCandidatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetectedTransactionCandidatesTable,
      DetectedTransactionCandidate,
      $$DetectedTransactionCandidatesTableFilterComposer,
      $$DetectedTransactionCandidatesTableOrderingComposer,
      $$DetectedTransactionCandidatesTableAnnotationComposer,
      $$DetectedTransactionCandidatesTableCreateCompanionBuilder,
      $$DetectedTransactionCandidatesTableUpdateCompanionBuilder,
      (
        DetectedTransactionCandidate,
        $$DetectedTransactionCandidatesTableReferences,
      ),
      DetectedTransactionCandidate,
      PrefetchHooks Function({
        bool accountId,
        bool sourceAccountId,
        bool destinationAccountId,
        bool categoryId,
        bool paymentMethodId,
        bool duplicateOfTransactionId,
        bool confirmedTransactionId,
        bool candidateLinks,
        bool relatedCandidateLinks,
        bool candidateFingerprintsRefs,
        bool importCandidates,
      })
    >;
typedef $$CandidateDuplicateLinksTableCreateCompanionBuilder =
    CandidateDuplicateLinksCompanion Function({
      required String id,
      required String candidateId,
      Value<String?> relatedTransactionId,
      Value<String?> relatedCandidateId,
      required String fingerprintType,
      required double similarityScore,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CandidateDuplicateLinksTableUpdateCompanionBuilder =
    CandidateDuplicateLinksCompanion Function({
      Value<String> id,
      Value<String> candidateId,
      Value<String?> relatedTransactionId,
      Value<String?> relatedCandidateId,
      Value<String> fingerprintType,
      Value<double> similarityScore,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CandidateDuplicateLinksTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CandidateDuplicateLinksTable,
          CandidateDuplicateLink
        > {
  $$CandidateDuplicateLinksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DetectedTransactionCandidatesTable _candidateIdTable(
    _$AppDatabase db,
  ) => db.detectedTransactionCandidates.createAlias(
    'candidate_duplicate_links__candidate_id__detected_transaction_candidates__id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager get candidateId {
    final $_column = $_itemColumn<String>('candidate_id')!;

    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_candidateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _relatedTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        'candidate_duplicate_links__related_transaction_id__transactions__id',
      );

  $$TransactionsTableProcessedTableManager? get relatedTransactionId {
    final $_column = $_itemColumn<String>('related_transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _relatedTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DetectedTransactionCandidatesTable _relatedCandidateIdTable(
    _$AppDatabase db,
  ) => db.detectedTransactionCandidates.createAlias(
    'candidate_duplicate_links__related_candidate_id__detected_transaction_candidates__id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager?
  get relatedCandidateId {
    final $_column = $_itemColumn<String>('related_candidate_id');
    if ($_column == null) return null;
    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedCandidateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CandidateDuplicateLinksTableFilterComposer
    extends Composer<_$AppDatabase, $CandidateDuplicateLinksTable> {
  $$CandidateDuplicateLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fingerprintType => $composableBuilder(
    column: $table.fingerprintType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get similarityScore => $composableBuilder(
    column: $table.similarityScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DetectedTransactionCandidatesTableFilterComposer get candidateId {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableFilterComposer get relatedTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableFilterComposer get relatedCandidateId {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relatedCandidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateDuplicateLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $CandidateDuplicateLinksTable> {
  $$CandidateDuplicateLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fingerprintType => $composableBuilder(
    column: $table.fingerprintType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get similarityScore => $composableBuilder(
    column: $table.similarityScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DetectedTransactionCandidatesTableOrderingComposer get candidateId {
    final $$DetectedTransactionCandidatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableOrderingComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableOrderingComposer get relatedTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableOrderingComposer get relatedCandidateId {
    final $$DetectedTransactionCandidatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relatedCandidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableOrderingComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateDuplicateLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $CandidateDuplicateLinksTable> {
  $$CandidateDuplicateLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fingerprintType => $composableBuilder(
    column: $table.fingerprintType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get similarityScore => $composableBuilder(
    column: $table.similarityScore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DetectedTransactionCandidatesTableAnnotationComposer get candidateId {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get relatedTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableAnnotationComposer
  get relatedCandidateId {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relatedCandidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateDuplicateLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CandidateDuplicateLinksTable,
          CandidateDuplicateLink,
          $$CandidateDuplicateLinksTableFilterComposer,
          $$CandidateDuplicateLinksTableOrderingComposer,
          $$CandidateDuplicateLinksTableAnnotationComposer,
          $$CandidateDuplicateLinksTableCreateCompanionBuilder,
          $$CandidateDuplicateLinksTableUpdateCompanionBuilder,
          (CandidateDuplicateLink, $$CandidateDuplicateLinksTableReferences),
          CandidateDuplicateLink,
          PrefetchHooks Function({
            bool candidateId,
            bool relatedTransactionId,
            bool relatedCandidateId,
          })
        > {
  $$CandidateDuplicateLinksTableTableManager(
    _$AppDatabase db,
    $CandidateDuplicateLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CandidateDuplicateLinksTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CandidateDuplicateLinksTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CandidateDuplicateLinksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> candidateId = const Value.absent(),
                Value<String?> relatedTransactionId = const Value.absent(),
                Value<String?> relatedCandidateId = const Value.absent(),
                Value<String> fingerprintType = const Value.absent(),
                Value<double> similarityScore = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CandidateDuplicateLinksCompanion(
                id: id,
                candidateId: candidateId,
                relatedTransactionId: relatedTransactionId,
                relatedCandidateId: relatedCandidateId,
                fingerprintType: fingerprintType,
                similarityScore: similarityScore,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String candidateId,
                Value<String?> relatedTransactionId = const Value.absent(),
                Value<String?> relatedCandidateId = const Value.absent(),
                required String fingerprintType,
                required double similarityScore,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CandidateDuplicateLinksCompanion.insert(
                id: id,
                candidateId: candidateId,
                relatedTransactionId: relatedTransactionId,
                relatedCandidateId: relatedCandidateId,
                fingerprintType: fingerprintType,
                similarityScore: similarityScore,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $CandidateDuplicateLinksTable,
                    CandidateDuplicateLink
                  >(table),
                  $$CandidateDuplicateLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                candidateId = false,
                relatedTransactionId = false,
                relatedCandidateId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (candidateId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.candidateId,
                            referencedTable:
                                $$CandidateDuplicateLinksTableReferences
                                    ._candidateIdTable(db),
                            referencedColumn:
                                $$CandidateDuplicateLinksTableReferences
                                    ._candidateIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (relatedTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.relatedTransactionId,
                            referencedTable:
                                $$CandidateDuplicateLinksTableReferences
                                    ._relatedTransactionIdTable(db),
                            referencedColumn:
                                $$CandidateDuplicateLinksTableReferences
                                    ._relatedTransactionIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (relatedCandidateId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.relatedCandidateId,
                            referencedTable:
                                $$CandidateDuplicateLinksTableReferences
                                    ._relatedCandidateIdTable(db),
                            referencedColumn:
                                $$CandidateDuplicateLinksTableReferences
                                    ._relatedCandidateIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$CandidateDuplicateLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CandidateDuplicateLinksTable,
      CandidateDuplicateLink,
      $$CandidateDuplicateLinksTableFilterComposer,
      $$CandidateDuplicateLinksTableOrderingComposer,
      $$CandidateDuplicateLinksTableAnnotationComposer,
      $$CandidateDuplicateLinksTableCreateCompanionBuilder,
      $$CandidateDuplicateLinksTableUpdateCompanionBuilder,
      (CandidateDuplicateLink, $$CandidateDuplicateLinksTableReferences),
      CandidateDuplicateLink,
      PrefetchHooks Function({
        bool candidateId,
        bool relatedTransactionId,
        bool relatedCandidateId,
      })
    >;
typedef $$CandidateFingerprintsTableCreateCompanionBuilder =
    CandidateFingerprintsCompanion Function({
      required String id,
      required String candidateId,
      required String fingerprintHash,
      Value<int> fingerprintVersion,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CandidateFingerprintsTableUpdateCompanionBuilder =
    CandidateFingerprintsCompanion Function({
      Value<String> id,
      Value<String> candidateId,
      Value<String> fingerprintHash,
      Value<int> fingerprintVersion,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CandidateFingerprintsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CandidateFingerprintsTable,
          CandidateFingerprint
        > {
  $$CandidateFingerprintsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DetectedTransactionCandidatesTable _candidateIdTable(
    _$AppDatabase db,
  ) => db.detectedTransactionCandidates.createAlias(
    'candidate_fingerprints__candidate_id__detected_transaction_candidates__id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager get candidateId {
    final $_column = $_itemColumn<String>('candidate_id')!;

    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_candidateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CandidateFingerprintsTableFilterComposer
    extends Composer<_$AppDatabase, $CandidateFingerprintsTable> {
  $$CandidateFingerprintsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fingerprintHash => $composableBuilder(
    column: $table.fingerprintHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fingerprintVersion => $composableBuilder(
    column: $table.fingerprintVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DetectedTransactionCandidatesTableFilterComposer get candidateId {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateFingerprintsTableOrderingComposer
    extends Composer<_$AppDatabase, $CandidateFingerprintsTable> {
  $$CandidateFingerprintsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fingerprintHash => $composableBuilder(
    column: $table.fingerprintHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fingerprintVersion => $composableBuilder(
    column: $table.fingerprintVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DetectedTransactionCandidatesTableOrderingComposer get candidateId {
    final $$DetectedTransactionCandidatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableOrderingComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateFingerprintsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CandidateFingerprintsTable> {
  $$CandidateFingerprintsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fingerprintHash => $composableBuilder(
    column: $table.fingerprintHash,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fingerprintVersion => $composableBuilder(
    column: $table.fingerprintVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DetectedTransactionCandidatesTableAnnotationComposer get candidateId {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CandidateFingerprintsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CandidateFingerprintsTable,
          CandidateFingerprint,
          $$CandidateFingerprintsTableFilterComposer,
          $$CandidateFingerprintsTableOrderingComposer,
          $$CandidateFingerprintsTableAnnotationComposer,
          $$CandidateFingerprintsTableCreateCompanionBuilder,
          $$CandidateFingerprintsTableUpdateCompanionBuilder,
          (CandidateFingerprint, $$CandidateFingerprintsTableReferences),
          CandidateFingerprint,
          PrefetchHooks Function({bool candidateId})
        > {
  $$CandidateFingerprintsTableTableManager(
    _$AppDatabase db,
    $CandidateFingerprintsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CandidateFingerprintsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CandidateFingerprintsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CandidateFingerprintsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> candidateId = const Value.absent(),
                Value<String> fingerprintHash = const Value.absent(),
                Value<int> fingerprintVersion = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CandidateFingerprintsCompanion(
                id: id,
                candidateId: candidateId,
                fingerprintHash: fingerprintHash,
                fingerprintVersion: fingerprintVersion,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String candidateId,
                required String fingerprintHash,
                Value<int> fingerprintVersion = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CandidateFingerprintsCompanion.insert(
                id: id,
                candidateId: candidateId,
                fingerprintHash: fingerprintHash,
                fingerprintVersion: fingerprintVersion,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $CandidateFingerprintsTable,
                    CandidateFingerprint
                  >(table),
                  $$CandidateFingerprintsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({candidateId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (candidateId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.candidateId,
                        referencedTable: $$CandidateFingerprintsTableReferences
                            ._candidateIdTable(db),
                        referencedColumn: $$CandidateFingerprintsTableReferences
                            ._candidateIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CandidateFingerprintsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CandidateFingerprintsTable,
      CandidateFingerprint,
      $$CandidateFingerprintsTableFilterComposer,
      $$CandidateFingerprintsTableOrderingComposer,
      $$CandidateFingerprintsTableAnnotationComposer,
      $$CandidateFingerprintsTableCreateCompanionBuilder,
      $$CandidateFingerprintsTableUpdateCompanionBuilder,
      (CandidateFingerprint, $$CandidateFingerprintsTableReferences),
      CandidateFingerprint,
      PrefetchHooks Function({bool candidateId})
    >;
typedef $$ImportBatchesTableCreateCompanionBuilder =
    ImportBatchesCompanion Function({
      required String id,
      required String fileName,
      Value<String> sourceType,
      required String status,
      required DateTime createdAt,
      Value<DateTime?> committedAt,
      Value<int> rowid,
    });
typedef $$ImportBatchesTableUpdateCompanionBuilder =
    ImportBatchesCompanion Function({
      Value<String> id,
      Value<String> fileName,
      Value<String> sourceType,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime?> committedAt,
      Value<int> rowid,
    });

final class $$ImportBatchesTableReferences
    extends BaseReferences<_$AppDatabase, $ImportBatchesTable, ImportBatche> {
  $$ImportBatchesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ImportRowsTable, List<ImportRow>>
  _importRowsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.importRows,
    aliasName: 'import_batches__id__import_rows__batch_id',
  );

  $$ImportRowsTableProcessedTableManager get importRowsRefs {
    final manager = $$ImportRowsTableTableManager(
      $_db,
      $_db.importRows,
    ).filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_importRowsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ImportBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $ImportBatchesTable> {
  $$ImportBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get committedAt => $composableBuilder(
    column: $table.committedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> importRowsRefs(
    Expression<bool> Function($$ImportRowsTableFilterComposer f) f,
  ) {
    final $$ImportRowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableFilterComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImportBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImportBatchesTable> {
  $$ImportBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get committedAt => $composableBuilder(
    column: $table.committedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImportBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImportBatchesTable> {
  $$ImportBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get committedAt => $composableBuilder(
    column: $table.committedAt,
    builder: (column) => column,
  );

  Expression<T> importRowsRefs<T extends Object>(
    Expression<T> Function($$ImportRowsTableAnnotationComposer a) f,
  ) {
    final $$ImportRowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.importRows,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportRowsTableAnnotationComposer(
            $db: $db,
            $table: $db.importRows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImportBatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImportBatchesTable,
          ImportBatche,
          $$ImportBatchesTableFilterComposer,
          $$ImportBatchesTableOrderingComposer,
          $$ImportBatchesTableAnnotationComposer,
          $$ImportBatchesTableCreateCompanionBuilder,
          $$ImportBatchesTableUpdateCompanionBuilder,
          (ImportBatche, $$ImportBatchesTableReferences),
          ImportBatche,
          PrefetchHooks Function({bool importRowsRefs})
        > {
  $$ImportBatchesTableTableManager(_$AppDatabase db, $ImportBatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImportBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImportBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImportBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> committedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImportBatchesCompanion(
                id: id,
                fileName: fileName,
                sourceType: sourceType,
                status: status,
                createdAt: createdAt,
                committedAt: committedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fileName,
                Value<String> sourceType = const Value.absent(),
                required String status,
                required DateTime createdAt,
                Value<DateTime?> committedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImportBatchesCompanion.insert(
                id: id,
                fileName: fileName,
                sourceType: sourceType,
                status: status,
                createdAt: createdAt,
                committedAt: committedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ImportBatchesTable, ImportBatche>(table),
                  $$ImportBatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({importRowsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (importRowsRefs) db.importRows],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (importRowsRefs)
                    await $_getPrefetchedDataByColumns<
                      ImportBatche,
                      $ImportBatchesTable,
                      ImportRow,
                      $ImportRowsTable
                    >(
                      currentTable: table,
                      referencedTable: $$ImportBatchesTableReferences
                          ._importRowsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ImportBatchesTableReferences(
                            db,
                            table,
                            p0,
                          ).importRowsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'batch_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ImportBatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImportBatchesTable,
      ImportBatche,
      $$ImportBatchesTableFilterComposer,
      $$ImportBatchesTableOrderingComposer,
      $$ImportBatchesTableAnnotationComposer,
      $$ImportBatchesTableCreateCompanionBuilder,
      $$ImportBatchesTableUpdateCompanionBuilder,
      (ImportBatche, $$ImportBatchesTableReferences),
      ImportBatche,
      PrefetchHooks Function({bool importRowsRefs})
    >;
typedef $$ImportRowsTableCreateCompanionBuilder = ImportRowsCompanion Function({
  required String id,
  required String batchId,
  required int rowNumber,
  Value<String?> parsedKind,
  Value<int?> parsedAmountMinor,
  Value<String?> parsedCurrencyCode,
  Value<DateTime?> parsedOccurredAt,
  Value<int?> parsedLocalOffsetMinutes,
  Value<String?> parsedTimezoneId,
  Value<String?> localDateKey,
  Value<String?> parsedAccountName,
  Value<String?> parsedCategoryName,
  Value<String?> parseErrorsJson,
  Value<String?> duplicateOfTransactionId,
  Value<String> userDecision,
  Value<String?> candidateId,
  Value<String?> committedTransactionId,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$ImportRowsTableUpdateCompanionBuilder = ImportRowsCompanion Function({
  Value<String> id,
  Value<String> batchId,
  Value<int> rowNumber,
  Value<String?> parsedKind,
  Value<int?> parsedAmountMinor,
  Value<String?> parsedCurrencyCode,
  Value<DateTime?> parsedOccurredAt,
  Value<int?> parsedLocalOffsetMinutes,
  Value<String?> parsedTimezoneId,
  Value<String?> localDateKey,
  Value<String?> parsedAccountName,
  Value<String?> parsedCategoryName,
  Value<String?> parseErrorsJson,
  Value<String?> duplicateOfTransactionId,
  Value<String> userDecision,
  Value<String?> candidateId,
  Value<String?> committedTransactionId,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$ImportRowsTableReferences
    extends BaseReferences<_$AppDatabase, $ImportRowsTable, ImportRow> {
  $$ImportRowsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ImportBatchesTable _batchIdTable(_$AppDatabase db) =>
      db.importBatches.createAlias('import_rows__batch_id__import_batches__id');

  $$ImportBatchesTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$ImportBatchesTableTableManager(
      $_db,
      $_db.importBatches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _duplicateOfTransactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        'import_rows__duplicate_of_transaction_id__transactions__id',
      );

  $$TransactionsTableProcessedTableManager? get duplicateOfTransactionId {
    final $_column = $_itemColumn<String>('duplicate_of_transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _duplicateOfTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DetectedTransactionCandidatesTable _candidateIdTable(
    _$AppDatabase db,
  ) => db.detectedTransactionCandidates.createAlias(
    'import_rows__candidate_id__detected_transaction_candidates__id',
  );

  $$DetectedTransactionCandidatesTableProcessedTableManager? get candidateId {
    final $_column = $_itemColumn<String>('candidate_id');
    if ($_column == null) return null;
    final manager = $$DetectedTransactionCandidatesTableTableManager(
      $_db,
      $_db.detectedTransactionCandidates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_candidateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _committedTransactionIdTable(_$AppDatabase db) => db
      .transactions
      .createAlias('import_rows__committed_transaction_id__transactions__id');

  $$TransactionsTableProcessedTableManager? get committedTransactionId {
    final $_column = $_itemColumn<String>('committed_transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _committedTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ImportRowsTableFilterComposer
    extends Composer<_$AppDatabase, $ImportRowsTable> {
  $$ImportRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rowNumber => $composableBuilder(
    column: $table.rowNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedKind => $composableBuilder(
    column: $table.parsedKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parsedAmountMinor => $composableBuilder(
    column: $table.parsedAmountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedCurrencyCode => $composableBuilder(
    column: $table.parsedCurrencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get parsedOccurredAt => $composableBuilder(
    column: $table.parsedOccurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parsedLocalOffsetMinutes => $composableBuilder(
    column: $table.parsedLocalOffsetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedTimezoneId => $composableBuilder(
    column: $table.parsedTimezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedAccountName => $composableBuilder(
    column: $table.parsedAccountName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedCategoryName => $composableBuilder(
    column: $table.parsedCategoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parseErrorsJson => $composableBuilder(
    column: $table.parseErrorsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userDecision => $composableBuilder(
    column: $table.userDecision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ImportBatchesTableFilterComposer get batchId {
    final $$ImportBatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.importBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportBatchesTableFilterComposer(
            $db: $db,
            $table: $db.importBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get duplicateOfTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableFilterComposer get candidateId {
    final $$DetectedTransactionCandidatesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableFilterComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableFilterComposer get committedTransactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.committedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImportRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $ImportRowsTable> {
  $$ImportRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rowNumber => $composableBuilder(
    column: $table.rowNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedKind => $composableBuilder(
    column: $table.parsedKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parsedAmountMinor => $composableBuilder(
    column: $table.parsedAmountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedCurrencyCode => $composableBuilder(
    column: $table.parsedCurrencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get parsedOccurredAt => $composableBuilder(
    column: $table.parsedOccurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parsedLocalOffsetMinutes => $composableBuilder(
    column: $table.parsedLocalOffsetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedTimezoneId => $composableBuilder(
    column: $table.parsedTimezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedAccountName => $composableBuilder(
    column: $table.parsedAccountName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedCategoryName => $composableBuilder(
    column: $table.parsedCategoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parseErrorsJson => $composableBuilder(
    column: $table.parseErrorsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userDecision => $composableBuilder(
    column: $table.userDecision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ImportBatchesTableOrderingComposer get batchId {
    final $$ImportBatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.importBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportBatchesTableOrderingComposer(
            $db: $db,
            $table: $db.importBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get duplicateOfTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableOrderingComposer get candidateId {
    final $$DetectedTransactionCandidatesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableOrderingComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableOrderingComposer get committedTransactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.committedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImportRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImportRowsTable> {
  $$ImportRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rowNumber =>
      $composableBuilder(column: $table.rowNumber, builder: (column) => column);

  GeneratedColumn<String> get parsedKind => $composableBuilder(
    column: $table.parsedKind,
    builder: (column) => column,
  );

  GeneratedColumn<int> get parsedAmountMinor => $composableBuilder(
    column: $table.parsedAmountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsedCurrencyCode => $composableBuilder(
    column: $table.parsedCurrencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get parsedOccurredAt => $composableBuilder(
    column: $table.parsedOccurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get parsedLocalOffsetMinutes => $composableBuilder(
    column: $table.parsedLocalOffsetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsedTimezoneId => $composableBuilder(
    column: $table.parsedTimezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localDateKey => $composableBuilder(
    column: $table.localDateKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsedAccountName => $composableBuilder(
    column: $table.parsedAccountName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parsedCategoryName => $composableBuilder(
    column: $table.parsedCategoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parseErrorsJson => $composableBuilder(
    column: $table.parseErrorsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userDecision => $composableBuilder(
    column: $table.userDecision,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ImportBatchesTableAnnotationComposer get batchId {
    final $$ImportBatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.importBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImportBatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.importBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get duplicateOfTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.duplicateOfTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetectedTransactionCandidatesTableAnnotationComposer get candidateId {
    final $$DetectedTransactionCandidatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.candidateId,
          referencedTable: $db.detectedTransactionCandidates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DetectedTransactionCandidatesTableAnnotationComposer(
                $db: $db,
                $table: $db.detectedTransactionCandidates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get committedTransactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.committedTransactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImportRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImportRowsTable,
          ImportRow,
          $$ImportRowsTableFilterComposer,
          $$ImportRowsTableOrderingComposer,
          $$ImportRowsTableAnnotationComposer,
          $$ImportRowsTableCreateCompanionBuilder,
          $$ImportRowsTableUpdateCompanionBuilder,
          (ImportRow, $$ImportRowsTableReferences),
          ImportRow,
          PrefetchHooks Function({
            bool batchId,
            bool duplicateOfTransactionId,
            bool candidateId,
            bool committedTransactionId,
          })
        > {
  $$ImportRowsTableTableManager(_$AppDatabase db, $ImportRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImportRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImportRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImportRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<int> rowNumber = const Value.absent(),
                Value<String?> parsedKind = const Value.absent(),
                Value<int?> parsedAmountMinor = const Value.absent(),
                Value<String?> parsedCurrencyCode = const Value.absent(),
                Value<DateTime?> parsedOccurredAt = const Value.absent(),
                Value<int?> parsedLocalOffsetMinutes = const Value.absent(),
                Value<String?> parsedTimezoneId = const Value.absent(),
                Value<String?> localDateKey = const Value.absent(),
                Value<String?> parsedAccountName = const Value.absent(),
                Value<String?> parsedCategoryName = const Value.absent(),
                Value<String?> parseErrorsJson = const Value.absent(),
                Value<String?> duplicateOfTransactionId = const Value.absent(),
                Value<String> userDecision = const Value.absent(),
                Value<String?> candidateId = const Value.absent(),
                Value<String?> committedTransactionId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImportRowsCompanion(
                id: id,
                batchId: batchId,
                rowNumber: rowNumber,
                parsedKind: parsedKind,
                parsedAmountMinor: parsedAmountMinor,
                parsedCurrencyCode: parsedCurrencyCode,
                parsedOccurredAt: parsedOccurredAt,
                parsedLocalOffsetMinutes: parsedLocalOffsetMinutes,
                parsedTimezoneId: parsedTimezoneId,
                localDateKey: localDateKey,
                parsedAccountName: parsedAccountName,
                parsedCategoryName: parsedCategoryName,
                parseErrorsJson: parseErrorsJson,
                duplicateOfTransactionId: duplicateOfTransactionId,
                userDecision: userDecision,
                candidateId: candidateId,
                committedTransactionId: committedTransactionId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String batchId,
                required int rowNumber,
                Value<String?> parsedKind = const Value.absent(),
                Value<int?> parsedAmountMinor = const Value.absent(),
                Value<String?> parsedCurrencyCode = const Value.absent(),
                Value<DateTime?> parsedOccurredAt = const Value.absent(),
                Value<int?> parsedLocalOffsetMinutes = const Value.absent(),
                Value<String?> parsedTimezoneId = const Value.absent(),
                Value<String?> localDateKey = const Value.absent(),
                Value<String?> parsedAccountName = const Value.absent(),
                Value<String?> parsedCategoryName = const Value.absent(),
                Value<String?> parseErrorsJson = const Value.absent(),
                Value<String?> duplicateOfTransactionId = const Value.absent(),
                Value<String> userDecision = const Value.absent(),
                Value<String?> candidateId = const Value.absent(),
                Value<String?> committedTransactionId = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ImportRowsCompanion.insert(
                id: id,
                batchId: batchId,
                rowNumber: rowNumber,
                parsedKind: parsedKind,
                parsedAmountMinor: parsedAmountMinor,
                parsedCurrencyCode: parsedCurrencyCode,
                parsedOccurredAt: parsedOccurredAt,
                parsedLocalOffsetMinutes: parsedLocalOffsetMinutes,
                parsedTimezoneId: parsedTimezoneId,
                localDateKey: localDateKey,
                parsedAccountName: parsedAccountName,
                parsedCategoryName: parsedCategoryName,
                parseErrorsJson: parseErrorsJson,
                duplicateOfTransactionId: duplicateOfTransactionId,
                userDecision: userDecision,
                candidateId: candidateId,
                committedTransactionId: committedTransactionId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ImportRowsTable, ImportRow>(table),
                  $$ImportRowsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                batchId = false,
                duplicateOfTransactionId = false,
                candidateId = false,
                committedTransactionId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (batchId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.batchId,
                            referencedTable: $$ImportRowsTableReferences
                                ._batchIdTable(db),
                            referencedColumn: $$ImportRowsTableReferences
                                ._batchIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (duplicateOfTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.duplicateOfTransactionId,
                            referencedTable: $$ImportRowsTableReferences
                                ._duplicateOfTransactionIdTable(db),
                            referencedColumn: $$ImportRowsTableReferences
                                ._duplicateOfTransactionIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (candidateId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.candidateId,
                            referencedTable: $$ImportRowsTableReferences
                                ._candidateIdTable(db),
                            referencedColumn: $$ImportRowsTableReferences
                                ._candidateIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (committedTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.committedTransactionId,
                            referencedTable: $$ImportRowsTableReferences
                                ._committedTransactionIdTable(db),
                            referencedColumn: $$ImportRowsTableReferences
                                ._committedTransactionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ImportRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImportRowsTable,
      ImportRow,
      $$ImportRowsTableFilterComposer,
      $$ImportRowsTableOrderingComposer,
      $$ImportRowsTableAnnotationComposer,
      $$ImportRowsTableCreateCompanionBuilder,
      $$ImportRowsTableUpdateCompanionBuilder,
      (ImportRow, $$ImportRowsTableReferences),
      ImportRow,
      PrefetchHooks Function({
        bool batchId,
        bool duplicateOfTransactionId,
        bool candidateId,
        bool committedTransactionId,
      })
    >;
typedef $$UserSettingsTableCreateCompanionBuilder =
    UserSettingsCompanion Function({
      required String key,
      required String valueJson,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UserSettingsTableUpdateCompanionBuilder =
    UserSettingsCompanion Function({
      Value<String> key,
      Value<String> valueJson,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UserSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get valueJson =>
      $composableBuilder(column: $table.valueJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsTable,
          UserSetting,
          $$UserSettingsTableFilterComposer,
          $$UserSettingsTableOrderingComposer,
          $$UserSettingsTableAnnotationComposer,
          $$UserSettingsTableCreateCompanionBuilder,
          $$UserSettingsTableUpdateCompanionBuilder,
          (
            UserSetting,
            BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
          ),
          UserSetting,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> valueJson = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserSettingsCompanion(
                key: key,
                valueJson: valueJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String valueJson,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserSettingsCompanion.insert(
                key: key,
                valueJson: valueJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserSettingsTable, UserSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $UserSettingsTable,
                    UserSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsTable,
      UserSetting,
      $$UserSettingsTableFilterComposer,
      $$UserSettingsTableOrderingComposer,
      $$UserSettingsTableAnnotationComposer,
      $$UserSettingsTableCreateCompanionBuilder,
      $$UserSettingsTableUpdateCompanionBuilder,
      (
        UserSetting,
        BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
      ),
      UserSetting,
      PrefetchHooks Function()
    >;
typedef $$LocalBackupMetadataTableCreateCompanionBuilder =
    LocalBackupMetadataCompanion Function({
      required String id,
      required String backupFileName,
      required DateTime createdAt,
      required String fileHash,
      required String checksumAlgorithm,
      Value<bool> encrypted,
      Value<String?> notes,
      Value<bool> valid,
      Value<int> rowid,
    });
typedef $$LocalBackupMetadataTableUpdateCompanionBuilder =
    LocalBackupMetadataCompanion Function({
      Value<String> id,
      Value<String> backupFileName,
      Value<DateTime> createdAt,
      Value<String> fileHash,
      Value<String> checksumAlgorithm,
      Value<bool> encrypted,
      Value<String?> notes,
      Value<bool> valid,
      Value<int> rowid,
    });

class $$LocalBackupMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $LocalBackupMetadataTable> {
  $$LocalBackupMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backupFileName => $composableBuilder(
    column: $table.backupFileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksumAlgorithm => $composableBuilder(
    column: $table.checksumAlgorithm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get encrypted => $composableBuilder(
    column: $table.encrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get valid => $composableBuilder(
    column: $table.valid,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalBackupMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalBackupMetadataTable> {
  $$LocalBackupMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backupFileName => $composableBuilder(
    column: $table.backupFileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksumAlgorithm => $composableBuilder(
    column: $table.checksumAlgorithm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get encrypted => $composableBuilder(
    column: $table.encrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get valid => $composableBuilder(
    column: $table.valid,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalBackupMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalBackupMetadataTable> {
  $$LocalBackupMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get backupFileName => $composableBuilder(
    column: $table.backupFileName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get fileHash =>
      $composableBuilder(column: $table.fileHash, builder: (column) => column);

  GeneratedColumn<String> get checksumAlgorithm => $composableBuilder(
    column: $table.checksumAlgorithm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get encrypted =>
      $composableBuilder(column: $table.encrypted, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get valid =>
      $composableBuilder(column: $table.valid, builder: (column) => column);
}

class $$LocalBackupMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalBackupMetadataTable,
          LocalBackupMetadataData,
          $$LocalBackupMetadataTableFilterComposer,
          $$LocalBackupMetadataTableOrderingComposer,
          $$LocalBackupMetadataTableAnnotationComposer,
          $$LocalBackupMetadataTableCreateCompanionBuilder,
          $$LocalBackupMetadataTableUpdateCompanionBuilder,
          (
            LocalBackupMetadataData,
            BaseReferences<
              _$AppDatabase,
              $LocalBackupMetadataTable,
              LocalBackupMetadataData
            >,
          ),
          LocalBackupMetadataData,
          PrefetchHooks Function()
        > {
  $$LocalBackupMetadataTableTableManager(
    _$AppDatabase db,
    $LocalBackupMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBackupMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBackupMetadataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalBackupMetadataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> backupFileName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> fileHash = const Value.absent(),
                Value<String> checksumAlgorithm = const Value.absent(),
                Value<bool> encrypted = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> valid = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalBackupMetadataCompanion(
                id: id,
                backupFileName: backupFileName,
                createdAt: createdAt,
                fileHash: fileHash,
                checksumAlgorithm: checksumAlgorithm,
                encrypted: encrypted,
                notes: notes,
                valid: valid,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String backupFileName,
                required DateTime createdAt,
                required String fileHash,
                required String checksumAlgorithm,
                Value<bool> encrypted = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> valid = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalBackupMetadataCompanion.insert(
                id: id,
                backupFileName: backupFileName,
                createdAt: createdAt,
                fileHash: fileHash,
                checksumAlgorithm: checksumAlgorithm,
                encrypted: encrypted,
                notes: notes,
                valid: valid,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $LocalBackupMetadataTable,
                    LocalBackupMetadataData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $LocalBackupMetadataTable,
                    LocalBackupMetadataData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalBackupMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalBackupMetadataTable,
      LocalBackupMetadataData,
      $$LocalBackupMetadataTableFilterComposer,
      $$LocalBackupMetadataTableOrderingComposer,
      $$LocalBackupMetadataTableAnnotationComposer,
      $$LocalBackupMetadataTableCreateCompanionBuilder,
      $$LocalBackupMetadataTableUpdateCompanionBuilder,
      (
        LocalBackupMetadataData,
        BaseReferences<
          _$AppDatabase,
          $LocalBackupMetadataTable,
          LocalBackupMetadataData
        >,
      ),
      LocalBackupMetadataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$SubcategoriesTableTableManager get subcategories =>
      $$SubcategoriesTableTableManager(_db, _db.subcategories);
  $$PaymentMethodsTableTableManager get paymentMethods =>
      $$PaymentMethodsTableTableManager(_db, _db.paymentMethods);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
  $$SavingsGoalsTableTableManager get savingsGoals =>
      $$SavingsGoalsTableTableManager(_db, _db.savingsGoals);
  $$SavingsContributionsTableTableManager get savingsContributions =>
      $$SavingsContributionsTableTableManager(_db, _db.savingsContributions);
  $$RecurringPlansTableTableManager get recurringPlans =>
      $$RecurringPlansTableTableManager(_db, _db.recurringPlans);
  $$DetectedTransactionCandidatesTableTableManager
  get detectedTransactionCandidates =>
      $$DetectedTransactionCandidatesTableTableManager(
        _db,
        _db.detectedTransactionCandidates,
      );
  $$CandidateDuplicateLinksTableTableManager get candidateDuplicateLinks =>
      $$CandidateDuplicateLinksTableTableManager(
        _db,
        _db.candidateDuplicateLinks,
      );
  $$CandidateFingerprintsTableTableManager get candidateFingerprints =>
      $$CandidateFingerprintsTableTableManager(_db, _db.candidateFingerprints);
  $$ImportBatchesTableTableManager get importBatches =>
      $$ImportBatchesTableTableManager(_db, _db.importBatches);
  $$ImportRowsTableTableManager get importRows =>
      $$ImportRowsTableTableManager(_db, _db.importRows);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
  $$LocalBackupMetadataTableTableManager get localBackupMetadata =>
      $$LocalBackupMetadataTableTableManager(_db, _db.localBackupMetadata);
}
