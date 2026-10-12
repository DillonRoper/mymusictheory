import 'package:drift/drift.dart';
import 'package:mymusictheory/models/quiz_table.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'quiz_database.g.dart';

/// This class defines the database for storing permanent information regarding
/// the user's performance in quizzes
@DriftDatabase(tables: [QuizTable])
class QuizDatabase extends _$QuizDatabase {
  /// Constructor tells drift where the database should
  /// be stored
  QuizDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // given in starter guide
  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'journal_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}