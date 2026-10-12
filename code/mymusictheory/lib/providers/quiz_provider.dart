import 'package:flutter/material.dart';

import 'package:mymusictheory/models/quiz_database.dart';

/// This class manages data interactions related to the QuizDatabase class.
class QuizProvider extends ChangeNotifier {
  final QuizDatabase database;
  int highScore;
  bool dataLoading;

  /// Constructs an instance of QuizProvider
  QuizProvider(this.database): dataLoading = true, highScore = -1 {
    dataLoading = true;
    _loadQuizData();
  }

  /// Loads all rows of the QuizDatabase and the high score into memory.
  Future<void> _loadQuizData() async {
    List<QuizTableData> data = await database.select(database.quizTable).get();
    for (QuizTableData d in data) {
      if (d.score > highScore) {
        highScore = d.score;
      }
    }
    dataLoading = false;
    notifyListeners();
  }

  /// Adds the given score as a unique entry to the QuizDatabase.
  /// Parameters:
  /// - int score - the score that will be added to the database.
  Future<void> addScore(int score) async {
    dataLoading = true;
    notifyListeners();
    await database.managers.quizTable.create((o) => o(score: score));
    await _loadQuizData();
  }

  /// Finds the given number of logged scores
  /// Parameters:
  /// - int amount - the number of past scores to get
  /// Returns: a list of past scores where length == amount
  Future<List<int>> getScores(int amount) async {
    final List<int> retval = [];
    final List<QuizTableData> table = await database.managers.quizTable.get(limit: amount);
    for (QuizTableData data in table) {
      retval.add(data.score);
    }
    return retval;
  }

  /// Clears all data associated with QuizDatabase.
  Future<void> clearData() async {
    dataLoading = true;
    notifyListeners();
    await database.managers.quizTable.delete();
    dataLoading = false;
    notifyListeners();
  }
}