// creates a language object that contains all necessary text for the app in the right language

/// Maps a shared general key to a Spanish specific String
const Map<String, String> _spanishText = {
  'language': 'Spanish',
  'homescreen': 'PLACEHOLDER',
  'quizStart': 'Nota Prueba!',
  'highScore': 'Puntuación Mas Alta: ',
  'start': 'Empezar!',
  'currentWeather': 'Clima Actual: ',
  'tips': 'Consejos para instrumentos/vocales: ',
  'button1': 'Restablecer datos',
  'button2': 'Cambiar el Idioma a Inglés',
  'question': '¿Qué nota es esta?',
  'results': 'Resultados',
  'score': 'Puntuación',
  'tryAgain': 'Inténtalo de Nuevo'
};

/// Maps a shared general key to an English specific String
const Map<String, String> _englishText = {
  // what language text is in
  'language':'English',

  // display text for homescreen
  'homescreen':'PLACEHOLDER',

  // display text for quiz start
  'quizStart':'Note Test!',

  // display text for high score
  'highScore':'High Score: ',

  // display text for start button
  'start':'Start!',

  // display text for current weather
  'currentWeather':'Current Weather: ',

  // display text for tips
  'tips':'Tips For Instruments/Vocals: ',

  // display text for reset data button
  'button1':'Reset Data',

  // display text for language toggle button
  'button2':'Switch Language to Spanish',
  
  // display text for quiz questions
  'question':'What note is this?',

  // display text for quiz results
  'results':'Results',

  // display text for quiz score
  'score':'Score: ',
  
  // display text for try again message
  'tryAgain':'Try Again'
};

/// This class stores information regarding how different pieces of text will appear
/// depending on the selected language
class TextForLanguage {
  // if the text will be in Spanish or English
  String language;

  // creates a new TextForLanguage object with parameter pertaining to what language it is
  TextForLanguage(this.language);

  /// Gets the String associated with the given key
  /// Parameters:
  /// - String toGet - the key that is associated with the desired String
  /// Returns: a String that is associated with the given key depending on what
  /// language the app is set to
  String get(String toGet) {
    if (language == 'English') {
      return _englishText[toGet]!;
    } else {
      return _spanishText[toGet]!;
    }
  }
}