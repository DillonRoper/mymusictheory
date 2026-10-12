// External
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// Internal
import 'package:mymusictheory/views/mymusictheory_app.dart';
import 'package:mymusictheory/providers/weather_provider.dart';
import 'package:mymusictheory/providers/language_provider.dart';
import 'package:mymusictheory/providers/quiz_provider.dart';
import 'package:mymusictheory/models/quiz_database.dart';
import 'package:mymusictheory/providers/position_provider.dart';

/// The database that is shared amongst different views in the quiz parts of this
/// app. See models/quiz_table.dart and models/quiz_database.dart for more info
QuizDatabase? _database;

/// Initializes the database and runs the app
void main() {
  _database = QuizDatabase();
  runApp(const MainApp());
}

/// This class holds the entire app's widget tree
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// Builds the widget tree for the MyMusicTheory app
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: the widget tree for the whole app with all of the necessary providers and views
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(create: (_) => WeatherProvider()),
        ChangeNotifierProvider<LanguageProvider>(create: (_) => LanguageProvider()),
        ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider(_database!)),
        ChangeNotifierProvider<PositionProvider>(create: (_) => PositionProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, counter, child) => MyMusicTheoryApp()
      ),
    );
  }
}
