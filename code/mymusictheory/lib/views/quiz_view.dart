import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

import 'package:mymusictheory/views/quiz_end.dart';

/// The number of note positions on the staff that are recognized by the app
const _positionNum = 13;

/// All possible notes in standard western music theory
const List<String> _notes = ['C♭','C','C#','D♭','D','D#','E♭','E','E#','F♭','F','F#','G♭','G','G#','A♭','A','A#','B♭','B','B#'];

/// All possible (major) key signatures
const List<String> _signatures = ['A','A♭','B','B♭','C','C#','C♭','D','D♭','E','E♭','F','F#','G','G♭'];

/// Maps the given (major) key signature to another map that maps the given note position
/// to a String representation of that note
const Map<String, Map<int, String>> _signatureAndPositionToNote = {
    'A':{0:'C#',1:'D',2:'E',3:'F#',4:'G#',5:'A',6:'B',7:'C#',8:'D',9:'E',10:'F#',11:'G#',12:'A'},
    'A♭':{0:'C',1:'D♭',2:'E♭',3:'F',4:'G',5:'A♭',6:'B♭',7:'C',8:'D♭',9:'E♭',10:'F',11:'G',12:'A♭'},
    'B':{0:'C#',1:'D#',2:'E',3:'F#',4:'G#',5:'A#',6:'B',7:'C#',8:'D#',9:'E',10:'F#',11:'G#',12:'A#'},
    'B♭':{0:'C',1:'D',2:'E♭',3:'F',4:'G',5:'A',6:'B♭',7:'C',8:'D',9:'E♭',10:'F',11:'G',12:'A'},
    'C':{0:'C',1:'D',2:'E',3:'F',4:'G',5:'A',6:'B',7:'C',8:'D',9:'E',10:'F',11:'G',12:'A'},
    'C#':{0:'C#',1:'D#',2:'E#',3:'F#',4:'G#',5:'A#',6:'B#',7:'C#',8:'D#',9:'E#',10:'F#',11:'G#',12:'A#'},
    'C♭':{0:'C♭',1:'D♭',2:'E♭',3:'F♭',4:'G♭',5:'A♭',6:'B♭',7:'C♭',8:'D♭',9:'E♭',10:'F♭',11:'G♭',12:'A♭'},
    'D':{0:'C#',1:'D',2:'E',3:'F#',4:'G',5:'A',6:'B',7:'C#',8:'D',9:'E',10:'F#',11:'G',12:'A'},
    'D♭':{0:'C',1:'D♭',2:'E♭',3:'F',4:'G♭',5:'A♭',6:'B♭',7:'C',8:'D♭',9:'E♭',10:'F',11:'G♭',12:'A♭'},
    'E':{0:'C#',1:'D#',2:'E',3:'F#',4:'G#',5:'A',6:'B',7:'C#',8:'D#',9:'E',10:'F#',11:'G#',12:'A'},
    'E♭':{0:'C',1:'D',2:'E♭',3:'F',4:'G',5:'A♭',6:'B♭',7:'C',8:'D',9:'E♭',10:'F',11:'G',12:'A♭'},
    'F':{0:'C',1:'D',2:'E',3:'F',4:'G',5:'A',6:'B♭',7:'C',8:'D',9:'E',10:'F',11:'G',12:'A'},
    'F#':{0:'C#',1:'D#',2:'E#',3:'F#',4:'G#',5:'A#',6:'B',7:'C#',8:'D#',9:'E#',10:'F#',11:'G#',12:'A#'},
    'G':{0:'C',1:'D',2:'E',3:'F#',4:'G',5:'A',6:'B',7:'C',8:'D',9:'E',10:'F#',11:'G',12:'A'},
    'G♭':{0:'C♭',1:'D♭',2:'E♭',3:'F',4:'G♭',5:'A♭',6:'B♭',7:'C♭',8:'D♭',9:'E♭',10:'F',11:'G♭',12:'A♭'}
};

/// This class defines the quiz view where the user will make their quiz attempt
class QuizView extends StatefulWidget {
  final int totalQuestions;
  static ButtonStyle buttonStyle = ButtonStyle(minimumSize: WidgetStateProperty.all(Size(120, 120)));
  static const TextStyle buttonTextStyle = TextStyle(fontSize: 32, );

  /// Creates a new instance of QuizView with the given number of questions
  /// Parameters:
  /// - this.totalQuestions - the total number of questions that this widget tree
  /// will display to the user before ending the quiz, defaults to 20
  const QuizView({super.key, this.totalQuestions = 20});

  @override
  State<QuizView> createState() => _QuizViewState();
}

/// This class defines the state of the quiz view
class _QuizViewState extends State<QuizView> {
  final Random random = Random();
  final AudioPlayer player = AudioPlayer();

  int questionsComplete = 0;
  int questionsCorrect = 0;
  bool questionAnswered = false;
  bool correct = false;

  /// Builds the widget tree for the quiz view
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: either a new question or information regarding the previously answered question depending
  /// on the state of this widget
  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (questionAnswered) {
      body = _buildAnswer();
    } else {
      body = _nextQuestion();
    }
    return SafeArea(
      child: Scaffold(
        body: Center(child: body)
      )
    );
  }

  /// Builds the widget tree for a randomly generated question
  /// Returns: a widget tree with a randomly generated question
  Widget _nextQuestion() {
    final String signature = _signatures[random.nextInt(_signatures.length)];
    final int notePos = random.nextInt(_positionNum);
    final int buttonPos = random.nextInt(4);  // Random int between [0,3]

    final List<String> incorrectNotes = [];
    while (incorrectNotes.length < 4) {
      String randNote = _notes[random.nextInt(_notes.length)];
      while(incorrectNotes.contains(randNote) || randNote == _signatureAndPositionToNote[signature]![notePos]!) {
        randNote = _notes[random.nextInt(_notes.length)];
      }
      incorrectNotes.add(randNote);
    }

    final Column retval = Column(
      spacing: 12,
      children: [
        Text('Question: $questionsComplete/${widget.totalQuestions}', style: TextStyle(fontSize: 24, color: Colors.black)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/$signature-major.png', fit: BoxFit.contain)),
            Expanded(child: Image.asset('assets/images/note$notePos.png', fit: BoxFit.contain)),
          ],
        ),
        Text('What note is this?', style: TextStyle(fontSize: 24, color: Colors.black)),
        Row(
          spacing: 12,
          children: [
            (buttonPos == 0)? _correctButton(notePos, signature) : _incorrectButton(incorrectNotes[0]),
            (buttonPos == 1)? _correctButton(notePos, signature) : _incorrectButton(incorrectNotes[1]),
          ]
        ),
        Row(
          spacing: 12,
          children: [
            (buttonPos == 2)? _correctButton(notePos, signature) : _incorrectButton(incorrectNotes[2]),
            (buttonPos == 3)? _correctButton(notePos, signature) : _incorrectButton(incorrectNotes[3]),
          ]
        )
      ]
    );
    _noteToSound(notePos, signature);
    return retval;
  }

  /// Builds a new button widget for a unique note that is incorrect for the current
  /// question
  /// Parameters:
  /// - String note - the note that will be displayed by this button
  /// Returns: a button that will log an incorrect answer when pressed
  Widget _incorrectButton(String note) {
    return Expanded(child: ElevatedButton(
      style: QuizView.buttonStyle,
      onPressed: () {_questionAnswered(false);},
      child: Text(note, style: QuizView.buttonTextStyle),
    ));
  }

  /// Builds a new button widget for the note that is correct for the current question
  /// Parameters:
  /// - int notePos - where the note is relative to the number of positions from
  /// the bottom of the staff.
  /// - String signature - the (major) key signature that this note is being played in
  /// Returns: a button widget that is associated with the correct answer
  Widget _correctButton(int notePos, String signature) {
    String note = _signatureAndPositionToNote[signature]![notePos]!;

    return Expanded(child: ElevatedButton(
      style: QuizView.buttonStyle,
      onPressed: () {_questionAnswered(true);},
      child: Text(note, style: QuizView.buttonTextStyle),
    ));
  }

  /// Calls whenever the user submits an answer for the current question
  /// Parameters:
  /// - bool correctAns - did the user pick the right answer?
  void _questionAnswered(bool correctAns) {
    if (questionsComplete == widget.totalQuestions - 1) {
      _endQuiz(context);
      correct = correctAns;
      if (correct) {
        questionsCorrect++;
      }
      return;
    }
    setState(() {
        questionsComplete++;
        correct = correctAns;
        if (correct) {
          questionsCorrect++;
        }
        questionAnswered = true;
      }
    );
  }

  /// Builds the answer subview based on whether the answer given for the previous
  /// question was correct or not
  /// Returns: a widget tree that tells the user whether they were correct or not
  Widget _buildAnswer() {
    final String topText;
    if (correct) {
      topText = 'Correct!';
    } else {
      topText = 'Incorrect';
    }

    return Column(
      spacing: 24,
      children: [
        Text(topText, style: TextStyle(fontSize: 24, color: Colors.black)),
        ElevatedButton(
          style: QuizView.buttonStyle,
          onPressed: () {
            if (questionsComplete == widget.totalQuestions) {
              _endQuiz(context);
              return;
            }
            setState(() {
              questionAnswered = false;
            });
          },
          child: Text('Continue', style: QuizView.buttonTextStyle),
        )
      ]
    );
  }

  /// Plays the mp3 associated with the given notePos on the given signature
  /// Parameters:
  /// - int notePos - where the note is relative to the number of positions from
  /// the bottom of the staff.
  /// - String signature - the (major) key signature that this note is being played in
  void _noteToSound(int notePos, String signature) {
    String note = _signatureAndPositionToNote[signature]![notePos]!;
    final String fileName;

    switch(note) {
      case 'C♭':
        note = 'B';
      case 'D♭':
        note = 'C#';
      case 'E♭':
        note = 'D#';
      case 'F♭':
        note = 'E';
      case 'G♭':
        note = 'F#';
      case 'A♭':
        note = 'G#';
      case 'B♭':
        note = 'A#';
    }

    if (notePos < 7) {
      if (note == 'B') {
        fileName = 'B3';
      } else {
        fileName = '${note}4';
      }
    } else {
      fileName = '${note}5';
    }
    player.play(AssetSource('sounds/$fileName.mp3'));
  }

  /// Ends the quiz and navigates to the quiz_end view
  /// Parameters:
  /// - BuildContext context - the context that the quiz_end view will be pushed onto
  Future<void> _endQuiz(BuildContext context) async {
    int score = questionsCorrect;

    questionsComplete = 0;
    questionsCorrect = 0;
    questionAnswered = false;
    correct = false;

    await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => QuizEnd(score: score)));
  }
}
