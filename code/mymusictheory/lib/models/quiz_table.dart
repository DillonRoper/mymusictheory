import 'package:drift/drift.dart';

/// This class defines the table that contains information regarding how well
/// users perform on quizzes
class QuizTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get score => integer().named('score')();
}