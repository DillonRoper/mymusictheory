import 'package:flutter/material.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// Provider class that contains information related to the position of the device
class PositionProvider extends ChangeNotifier {
  double longitude = double.infinity;
  double latitude = double.infinity;
  Exception? error;

  /// Creates a new instance of PositionProvider based on the current position of
  /// the device. Sends an updated position every 30 seconds, sets longitude and
  /// latitude to infinity while loading or if an error occurs.
  PositionProvider() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      _determinePosition().then((Position val) { 
        longitude = val.longitude;
        latitude = val.latitude;
        error = null;
        
      }).catchError((err) {
        longitude = double.infinity;
        latitude = double.infinity;
        error = err;
      });
      notifyListeners();
    });
  }


  /// The _determinePosition() method was provided by baseflow at https://pub.dev/packages/geolocator
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

}