import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'package:mymusictheory/providers/quiz_provider.dart';
import 'package:mymusictheory/models/consumer_text.dart';

/// This class defines the view for the settings menu
class SettingsView extends StatelessWidget{

  const SettingsView({super.key});

  /// Builds the widget tree for the settings view
  /// Parameters:
  /// - BuildContext context - The widget that will become the parents of this widget tree once built
  /// Returns: A widget tree that contains buttons for the user to modify aspects of the app's functionality
  @override
  Widget build(BuildContext context){
    return Column(
      spacing: 12,
      children: [
        SizedBox(height: 12),
        ElevatedButton(
          child: ConsumerText('button1', style: TextStyle(fontSize: 20)),
          onPressed: (){
            context.read<QuizProvider>().clearData();
          } 
        ),
        ElevatedButton(
          child: ConsumerText('button2', style: TextStyle(fontSize: 20)),
          onPressed: (){
            context.read<LanguageProvider>().changeLanguage();
          }
        )
      ],);
  }
}
