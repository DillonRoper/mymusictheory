import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mymusictheory/providers/quiz_provider.dart';
import 'package:mymusictheory/providers/language_provider.dart';
import 'package:mymusictheory/models/graph_painter.dart';

/// This class defines the view which displays information to the user after
/// they complete a quiz
class QuizEnd extends StatefulWidget {
  final int score;

  const QuizEnd({super.key, required this.score});

  @override
  State<QuizEnd> createState() => _QuizEndState();
}

/// This class defines the state of the QuizEnd class
class _QuizEndState extends State<QuizEnd> {
  late int highScore;
  List<int> scoresToShow = [];

  /// Declares the initial state of this widget such that the score is added
  /// to the database and the high score value is recalculated
  @override
  void initState() {
    super.initState();
    context.read<QuizProvider>().addScore(widget.score);
    highScore = context.read<QuizProvider>().highScore;
  }

  /// Builds the widget tree for the quiz_end view
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: a widget tree that shows information about previous attempts
  /// and allows the user to return to the main app view
  @override
  Widget build(BuildContext context) {
    return Center(child: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            _popToStart(context);
          }
        ),
        title: Text('Results'),
      ),

      body: Column(
        children: [
          _makeGraph(),
          Text('${context.read<LanguageProvider>().get('score')}${widget.score}'),
          Text('${context.read<LanguageProvider>().get('highScore')}$highScore'),
        ],
      ),

    ));
  }

  /// Makes a graph that displays information regarding current and past scores
  /// influenced by user panning.
  /// Returns: A widget that shows past score data and allows for user interaction
  Widget _makeGraph() {
    return GestureDetector(
      onScaleEnd: (details) {
        if (details.pointerCount == 2) {
          setState(() async {
            final int targetSize = scoresToShow.length + details.scaleVelocity.toInt();
            scoresToShow = await context.read<QuizProvider>().getScores(targetSize);
          });
        }
      },
      child: CustomPaint(
        painter: ScoreGraphPainter(scores: scoresToShow),
        willChange: true
      )
    );
  }

  /// Returns the user to the main app view as defined in mymusictheory_app.dart
  /// Parameters:
  /// - BuildContext context - the context that will be popped off the navigator stack
  void _popToStart(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}