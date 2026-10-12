import 'package:flutter/material.dart';

/// This class allows for the creation of a line graph that contains score data
class ScoreGraphPainter extends CustomPainter {
  final List<int> scores;

  const ScoreGraphPainter({required this.scores});

  /// Generates a graph on the given Canvas within the given Size filled with the scores
  /// defined for this instance
  /// Parameters:
  /// - Canvas canvas - where the painter will draw the graph
  /// - Size size - the bounds of the painter such that it doesn't draw outside of its bounds
  @override
  void paint(Canvas canvas, Size size) {
    final int minScore = scores.reduce((a,b) => a < b ? a : b);
    final int maxScore = scores.reduce((a,b) => a > b ? a : b);

    // Draw the graph background and numbers
    final int verticalLines = maxScore - minScore + 1;
    final int horizontalLines = scores.length;

    final gridPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromPoints(Offset(20, 20), Offset(20, size.height - 20)), blackPaint);
    canvas.drawRect(Rect.fromPoints(Offset(20, size.height - 20), Offset(size.width - 20, size.height - 20)), blackPaint);

    final double verticalSpace = size.width - 40;
    final double verticalGap = verticalSpace / verticalLines;

    final double horizontalSpace = size.height - 40;
    final double horizontalGap = horizontalSpace / horizontalLines;

    for (int i = 0; i < verticalLines; i++) {
      final numberPainter = TextPainter(
        text: TextSpan(text: '${scores[i]}', style: TextStyle(fontSize: 12))
      );
      numberPainter.paint(canvas, Offset(0, 20 + verticalGap * i));
      canvas.drawRect(Rect.fromPoints(Offset(20, 20 + verticalGap * i), Offset(size.width - 20, 20 + verticalGap * i)), gridPaint);
    }
    for (int i = 0; i < horizontalLines; i++) {
      canvas.drawRect(Rect.fromPoints(Offset(20 + horizontalGap * i, 20), Offset(20 + horizontalGap * i, size.height - 20)), gridPaint);
    }

    
  }

  /// Determines whether the graph needs to be repainted
  /// Parameters:
  /// - covariant ScoreGraphPainter oldDelegate - the old instance of ScoreGraphPainter,
  /// its state will determine whether the canvas is repainted
  /// Returns: true if the scores that are meant to be displayed change, false otherwise
  @override
  bool shouldRepaint(covariant ScoreGraphPainter oldDelegate) {
    return oldDelegate.scores.length != scores.length;
  }
}