import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import 'package:provider/provider.dart';
import '../providers/weather_conditions.dart';
import 'weather_condition_widget.dart';
import '../providers/language_provider.dart';
import 'package:mymusictheory/providers/position_provider.dart';
//import 'package:google_fonts/google_fonts.dart';

// WeatherDisplay displays Today's Weather alongside the weather status with a relevant icon
class WeatherView extends StatelessWidget{
  // WeatherView constructor
  const WeatherView({super.key});

// Builds WeatherDisplay
  @override
  Widget build(BuildContext context){
    return Consumer2<WeatherProvider, PositionProvider>(
        builder: (context, weatherProvider, positionProvider, child){
          weatherProvider.updateCurrLocation(positionProvider.latitude, positionProvider.longitude);
          return Container(
            height: 200, 
            color: _backgroundColorForCondition(weatherProvider.condition),
            // frame color changes based on weather condition
            child: Column(
              spacing: 4,
              children: [
                Container(height: 25),
                Text(
                  context.read<LanguageProvider>().get('currentWeather'),
                  textAlign: TextAlign.center,
                  style: TextStyle(//potential font change later? 
                    fontSize: 40
                  )
                ), 
                // displays the weather and associated icon
                WeatherConditionWidget(condition: weatherProvider.condition)
              ],),
            );
        }
    );
  }

// Selects a background color for the WeatherDisplay depending on current weather condition
  Color _backgroundColorForCondition(WeatherCondition condition) {
    return switch (condition){
      WeatherCondition.sunny =>const Color.fromARGB(255, 255, 217, 105),
      WeatherCondition.gloomy => const Color.fromARGB(255, 174, 174, 208),
      WeatherCondition.rainy => const Color.fromARGB(255, 119, 137, 255),
      WeatherCondition.unknown => const Color.fromARGB(255, 255, 136, 199),
    };
  }
}