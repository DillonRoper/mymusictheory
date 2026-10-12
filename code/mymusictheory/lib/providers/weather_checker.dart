import 'dart:convert';
import 'weather_provider.dart';
import 'package:http/http.dart' as http;
import 'weather_conditions.dart';

//ignore_for_file: avoid_print

// WeatherChecker queries NWS to return live weather information for its 
// attached WeatherProvider

class WeatherChecker {
  // Associated WeatherProvider to give live weather information too
  final WeatherProvider weatherProvider;

  // Coordinated of Allen Center for init
  double _latitude = 47.96649;
  double _longitude = -122.34318;

  // Client to access NWS information
  http.Client? client;

// Constructor to create new WeatherChecker with associated WeatherProvider and Client
  WeatherChecker(this.weatherProvider, {this.client});

// Fetches live weather information from NWS and updates it in associated 
// WeatherProvider. Will set WeatherProvider to default values 0 and unknown for 
// temperature and condition if information cannot be accessed
  Future<void> fetchAndUpdateCurrentSeattleWeather() async {
    try {
      final http.Client client = this.client ?? http.Client();
      final gridResponse = await client.get(
          Uri.parse('https://api.weather.gov/points/$_latitude,$_longitude'));
      final gridParsed = (jsonDecode(gridResponse.body));
      final String? forecastURL = gridParsed['properties']?['forecast'];
      if (forecastURL == null) {
        // do nothing
      } else {
        final weatherResponse = await client.get(Uri.parse(forecastURL));
        final weatherParsed = jsonDecode(weatherResponse.body);
        final currentPeriod = weatherParsed['properties']?['periods']?[0];
        if (currentPeriod != null) {
          final temperature = currentPeriod['temperature'];
          final shortForecast = currentPeriod['shortForecast'];
          print(
              'Got the weather at ${DateTime.now()}. $temperature F and $shortForecast');
          if (temperature != null && shortForecast != null) {
            final condition = _shortForecastToCondition(shortForecast);
            weatherProvider.updateWeather(temperature, condition);
          }
        }
      }
    } catch (_) {
      weatherProvider.updateWeather(0, WeatherCondition.unknown);
    } finally {
      client?.close();
      client = null;
    }
  }

// Determines the weather condition status depending on what NWS reports
  WeatherCondition _shortForecastToCondition(String shortForecast) {
    final lowercased = shortForecast.toLowerCase();
    if (lowercased.startsWith('rain')) return WeatherCondition.rainy;
    if (lowercased.startsWith('sun') || lowercased.startsWith('partly')) {
      return WeatherCondition.sunny;
    }
    return WeatherCondition.gloomy;
  }

  // updates the location we are currently checking the weather at 
  void updateLocation(double latitude, double longitude){
    _latitude = latitude; 
    _longitude = longitude;
  }
}
