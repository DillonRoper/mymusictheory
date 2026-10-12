import 'package:flutter/material.dart';
import 'weather_conditions.dart';
import 'weather_checker.dart';
import 'dart:async';

// WeatherProvider checks condition at the Allen Center every minute and updates
// the temperature in Fahrenheit
class WeatherProvider extends ChangeNotifier {
  // current temperature, default value 0
  int tempInFahrenheit = 0;
  // current condition, default value unknown
  WeatherCondition condition = WeatherCondition.unknown;
  // WeatherChecker to report live weather information
  late WeatherChecker _weatherChecker;
  // Timer to run a weather check every minute
  late Timer weatherCheckerTimer;
  // Bool storing whether or not intiial weather information has been loaded
  bool hasLoaded = false;

  // Creates new Weatherprovider with an attached WeatherChecker
  WeatherProvider(){
    _weatherChecker = WeatherChecker(this);
    _weatherChecker.fetchAndUpdateCurrentSeattleWeather();
    // ignore: unused_local_variable
    weatherCheckerTimer = Timer.periodic(const Duration(seconds: 60), 
      (weatherCheckerTimer) {_weatherChecker.fetchAndUpdateCurrentSeattleWeather();});
      // constructs timer that checks live weather data every minute
  }

  // Checks and updates live weather information into the provider and updates
  // state of app
  void updateWeather(int newTempFahrenheit, WeatherCondition newCondition) {
    tempInFahrenheit = newTempFahrenheit;
    condition = newCondition;
    hasLoaded = true;
    notifyListeners();
  }

// updates the current location that we are checking the weather at,
// and the waether at that location
  void updateCurrLocation(double lat, double long){
    _weatherChecker.updateLocation(lat, long);
    _weatherChecker.fetchAndUpdateCurrentSeattleWeather();
  }
}
