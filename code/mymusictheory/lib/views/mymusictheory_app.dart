import 'package:flutter/material.dart';
import 'package:mymusictheory/views/quiz_start.dart';
import 'package:mymusictheory/views/settings.dart';
import 'weather_view.dart';
import 'home.dart';

/// This class defines the view governing the main navigation elements
class MyMusicTheoryApp extends StatefulWidget {
  const MyMusicTheoryApp({super.key});

  /// Creates the initial state of this widget
  @override
  State<MyMusicTheoryApp> createState() => AppState();
}

/// This class defines the state of the main app view which shows content for the
/// home, quiz_start, weather, and settings views
class AppState extends State<MyMusicTheoryApp> {
  Widget currDisplay;

  AppState(): currDisplay = HomeView();

  /// Builds the widget tree that will contain all of the main widgets/views in the app
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: A Scaffold widget containing a widget tree that shows whichever
  /// view is currently selected for viewing
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('MyMusicTheory', style: TextStyle(fontSize: 32, color: Colors.white)), backgroundColor: Color.fromRGBO(126, 160, 183, 1)),
          body: Center(child: currDisplay),
          bottomNavigationBar: _navbar()
        ),
      ),
    );
  }

  /// Creates a BottomNavigationBar that will be present for most views
  /// Returns: a new BottomNavigationBar filled with the relevant items such
  /// that it can switch the state of this widget between views
  BottomNavigationBar _navbar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Color.fromRGBO(126, 160, 183, 1)),
        BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Theory Quiz', backgroundColor: Color.fromRGBO(126, 160, 183, 1)),
        BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Weather', backgroundColor: Color.fromRGBO(126, 160, 183, 1)),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings', backgroundColor: Color.fromRGBO(126, 160, 183, 1)),
      ],
      onTap: (i) {
        setState(() {
          switch(i) {
            case 0: 
              // navigate to home
              currDisplay = HomeView();
            case 1:
              // navigate to quiz
              currDisplay = QuizStart();
            case 2:
              // navigate to weather
              currDisplay = WeatherView();
            default:  // case 3
              // navigate to settings
              currDisplay = SettingsView();
          }
        }); 
      }
    );
  }

}
