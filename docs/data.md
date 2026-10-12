# Data Design

## Providers
  *WeatherProvider*
  - This class will provide the application with the weather data that it needs by making API calls as has been done in previous projects.

  *QuizProvider*
  - This class will act as an intermediate between the views that read/write data and the database that stores that data long term.

  *LanguageProvider*
  - This class serves as the provider for all text within the app for language toggles. On toggling the language setting, this provider will update its listeners to change all text throughout the app to the appropriate language.

  *PositionProvider*
  - This class retrieves and updates live position data to give to the weather provider so that it will get location-specific weather data depending on where the user is.

## Databases

  *QuizDatabase*
  - This class will enable the app to store information about the user's high scores in the quiz section of the app so that users can see how they have grown over time.

## Assets

  *Images*
  - This directory holds all of the images for the quiz which displays

# Data Flow

 *Weather*
 - To provide the user with information regarding the weather we must first request data from the device's gps to find the user's location. With that data we can send a call to a web service to retrieve weather data that is accurate to the user's location. This information is then assessed by the WeatherProvider class to determine the general kind of weather that is being experienced and how it might effect instruments. The relevent information from the provider is passed along to the user through the widget tree in weather_view.

 *Quiz*
 - To ensure that information regarding the user's progress is stored across time, we have a quiz provider that loads in quiz data, stores the high score, and keeps all past scores. Any time a quiz is loaded, the high score is updated depending on if the user has topped their previous score. Scores are also added to the database via the provider as users finish quizzes, and the provider can also reset the data, something that's called through the "reset data" button in settings.

 *Internationalization*
 - text_for_language.dart contains our text that will be displayed. The class contains two maps that retrieve the relevant piece of text for the display by retrieving it using a key denoting what the text technically is (for example, getting the current weather display label in spanish requires retrieving the value associated with key 'currentWeather' from the spanishText map) in the current language setting.