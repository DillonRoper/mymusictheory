import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mymusictheory/providers/language_provider.dart';
import '../providers/weather_conditions.dart';

// Creates widget to display weather condition and corresponding icon depending
// on what the current condition is based on device location
class WeatherConditionWidget extends StatelessWidget {

  // Creates new weather condition widget that displays condition and 
  // corresponding icon
  const WeatherConditionWidget({required this.condition, super.key});

  // Provider keeps current text and its language updated

  // current state of the weather
  final WeatherCondition condition;

  // builds widget and matches condition to appropriate display icon/text
  @override
  Widget build(BuildContext context) {
    // icon and text to show when the widget is constructed
    final IconData iconToShow;
    final String textToShow;

    switch(condition){
      case WeatherCondition.sunny: 
        iconToShow = Icons.sunny;
        if(context.read<LanguageProvider>().get('language') == 'Spanish'){
          textToShow = 'Soleada';
        } else{
          textToShow = 'Sunny';
        }
        break;

      case WeatherCondition.gloomy:
        iconToShow = Icons.cloud;
        if(context.read<LanguageProvider>().get('language') == 'Spanish'){
          textToShow = 'Sombrío';
        } else{
          textToShow = 'Gloomy';
        }
        break;

      case WeatherCondition.rainy:
        iconToShow = Icons.water_drop;
        if(context.read<LanguageProvider>().get('language') == 'Spanish'){
          textToShow = 'LLuviosa';
        } else{
          textToShow = 'Rainy';
        }
        break;

      default: 
        iconToShow = Icons.question_mark;
        if(context.read<LanguageProvider>().get('language') == 'Spanish'){
          textToShow = 'Clima desconocido';
        } else{
          textToShow = 'Unknown Weather';
        }
        break;
    }

// Returns widget displaying weather symbol and relevant icon
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconToShow,
        size: 50),
        Text(
          textToShow,
        ),
      ]
    );
    
  }
}