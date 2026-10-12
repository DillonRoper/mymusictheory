// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_database.dart';

// ignore_for_file: type=lint
class $QuizTableTable extends QuizTable
    with TableInfo<$QuizTableTable, QuizTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, score];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
    );
  }

  @override
  $QuizTableTable createAlias(String alias) {
    return $QuizTableTable(attachedDatabase, alias);
  }
}

class QuizTableData extends DataClass implements Insertable<QuizTableData> {
  final int id;
  final int score;
  const QuizTableData({required this.id, required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['score'] = Variable<int>(score);
    return map;
  }

  QuizTableCompanion toCompanion(bool nullToAbsent) {
    return QuizTableCompanion(id: Value(id), score: Value(score));
  }

  factory QuizTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizTableData(
      id: serializer.fromJson<int>(json['id']),
      score: serializer.fromJson<int>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'score': serializer.toJson<int>(score),
    };
  }

  QuizTableData copyWith({int? id, int? score}) =>
      QuizTableData(id: id ?? this.id, score: score ?? this.score);
  QuizTableData copyWithCompanion(QuizTableCompanion data) {
    return QuizTableData(
      id: data.id.present ? data.id.value : this.id,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizTableData(')
          ..write('id: $id, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizTableData &&
          other.id == this.id &&
          other.score == this.score);
}

class QuizTableCompanion extends UpdateCompanion<QuizTableData> {
  final Value<int> id;
  final Value<int> score;
  const QuizTableCompanion({
    this.id = const Value.absent(),
    this.score = const Value.absent(),
  });
  QuizTableCompanion.insert({
    this.id = const Value.absent(),
    required int score,
  }) : score = Value(score);
  static Insertable<QuizTableData> custom({
    Expression<int>? id,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (score != null) 'score': score,
    });
  }

  QuizTableCompanion copyWith({Value<int>? id, Value<int>? score}) {
    return QuizTableCompanion(id: id ?? this.id, score: score ?? this.score);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizTableCompanion(')
          ..write('id: $id, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuizDatabase extends GeneratedDatabase {
  _$QuizDatabase(QueryExecutor e) : super(e);
  $QuizDatabaseManager get managers => $QuizDatabaseManager(this);
  late final $QuizTableTable quizTable = $QuizTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quizTable];
}

typedef $$QuizTableTableCreateCompanionBuilder =
    QuizTableCompanion Function({Value<int> id, required int score});
typedef $$QuizTableTableUpdateCompanionBuilder =
    QuizTableCompanion Function({Value<int> id, Value<int> score});

class $$QuizTableTableFilterComposer
    extends Composer<_$QuizDatabase, $QuizTableTable> {
  $$QuizTableTableFilterComposer({
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

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizTableTableOrderingComposer
    extends Composer<_$QuizDatabase, $QuizTableTable> {
  $$QuizTableTableOrderingComposer({
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

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizTableTableAnnotationComposer
    extends Composer<_$QuizDatabase, $QuizTableTable> {
  $$QuizTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);
}

class $$QuizTableTableTableManager
    extends
        RootTableManager<
          _$QuizDatabase,
          $QuizTableTable,
          QuizTableData,
          $$QuizTableTableFilterComposer,
          $$QuizTableTableOrderingComposer,
          $$QuizTableTableAnnotationComposer,
          $$QuizTableTableCreateCompanionBuilder,
          $$QuizTableTableUpdateCompanionBuilder,
          (
            QuizTableData,
            BaseReferences<_$QuizDatabase, $QuizTableTable, QuizTableData>,
          ),
          QuizTableData,
          PrefetchHooks Function()
        > {
  $$QuizTableTableTableManager(_$QuizDatabase db, $QuizTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> score = const Value.absent(),
              }) => QuizTableCompanion(id: id, score: score),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required int score}) =>
                  QuizTableCompanion.insert(id: id, score: score),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizTableTableProcessedTableManager =
    ProcessedTableManager<
      _$QuizDatabase,
      $QuizTableTable,
      QuizTableData,
      $$QuizTableTableFilterComposer,
      $$QuizTableTableOrderingComposer,
      $$QuizTableTableAnnotationComposer,
      $$QuizTableTableCreateCompanionBuilder,
      $$QuizTableTableUpdateCompanionBuilder,
      (
        QuizTableData,
        BaseReferences<_$QuizDatabase, $QuizTableTable, QuizTableData>,
      ),
      QuizTableData,
      PrefetchHooks Function()
    >;

class $QuizDatabaseManager {
  final _$QuizDatabase _db;
  $QuizDatabaseManager(this._db);
  $$QuizTableTableTableManager get quizTable =>
      $$QuizTableTableTableManager(_db, _db.quizTable);
}
