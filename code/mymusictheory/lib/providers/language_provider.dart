import '../models/text_for_language.dart';
import 'package:flutter/material.dart';
//import 'dart:async';

// Provider reports what language is supposed to be displayed throughout the app
// and updates depending on language toggles via settings
class LanguageProvider extends ChangeNotifier{
  // current TextForLanguage 
  final TextForLanguage _text;

  LanguageProvider(): _text = TextForLanguage('English');

  /// Gets the String associated with the given key
  /// Parameters:
  /// - String toGet - the key that is associated with the desired String
  /// Returns: a String that is associated with the given key depending on what
  /// language the app is set to
  String get(String toGet) {
    return _text.get(toGet);
  }

  /// Changes the current language setting for the app (only between English/Spanish)
  void changeLanguage(){
    // swap language and notify listeners
    if (_text.language == 'English') {
      _text.language = 'Spanish';
    } else {
      _text.language = 'English';
    }
    notifyListeners();
  }
}