import 'package:flutter/material.dart';

/// This class provides a generic home view for the user when the first open the
/// app
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  /// Builds the widget tree for the home view
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: A view that contains a simple welcome message
  @override
  Widget build(BuildContext context){
    return 
        Column( 
          children: [
            Text('Welcome!', style: TextStyle(fontSize: 24, color: Colors.black)),
            Text("It's always a good day for music!", style: TextStyle(fontSize: 24, color: Colors.black))
          ] 
        );
  }
}
