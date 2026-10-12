import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mymusictheory/providers/quiz_provider.dart';
import 'package:mymusictheory/views/quiz_view.dart';

/// This class defines the quiz's start screen where the user can choose
/// to begin a new attempt
class QuizStart extends StatelessWidget {
  const QuizStart({super.key});

  /// Builds the widget tree for the quiz_start view
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: a widget tree that allows the user to start a new quiz attempt
  @override
  Widget build(BuildContext context) {
    String highScore = context.read<QuizProvider>().highScore.toString();
    if (highScore == '-1') {
      highScore = 'N/A';
    }

    return Column(
      children: [
        Text('Test Your Knowledge!'),
        Consumer<QuizProvider>(builder: (context, provider, child) {
          String highScore = provider.highScore.toString();
          if (highScore == '-1') {
            highScore = 'N/A';
          }
          return Text(highScore);
        }),
        ElevatedButton(
          style: ButtonStyle(),
          onPressed: () {_startQuiz(context);},
          child: Text('Start'),
        )
      ],
    );
  }

  /// Pushes the quiz_view widget tree onto the navigator stack and waits for it
  /// to return
  /// Parameters:
  /// - BuildContext context - the context that the quiz_view widget will be built upon
  Future<void> _startQuiz(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => QuizView(totalQuestions: 20)));
  }
}