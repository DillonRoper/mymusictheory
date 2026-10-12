*Course Topics Application*
- The six features we chose to implement were: sensors, APIs, drawing, gesture detection, data persistence, internationalization

Sensors: 
Our usage of sensors is reflected in the weather page of our app. Our Weather provider and checkers utiliza GPS sensing information in order to correctly identify the location of the device and give location-specific weather information.

API's: 
The API we chose to use was Drift to implement persistence in keeping quiz scores. Each entry into the database has an ID and a score. A high score is recorded, and all scores are used later in a graph summarizing the user's progress overtime.

Drawing: 
There is a graph that draws out the results of previous user scores as points connected by lines. It's a custom display for each user, and continues to be drawn as the user makes progress over time.

Gesture Detection: 
The main gesture detections here are button pressed for various thing such as naviagting through the app, or toggling settings. The most noticable one is taking the quiz, where depending on which button you press, you are either correct or incorrect in your selection. 

Data Persistence: 
As mentioned before in the API section, our data persistence is implemented through Drift. The data comes back in the form of a high score as well as a graph summarizing user progress and scores.

Internationalization:
Our feature is implementing a language toggle for all the text in the app between English and Spanish. By pressing the language toggle (second button) in Settings, you're able to shift all the text to English or Spanish. This includes messages included in the quizzes, as well as general labels and information.

How this reflects inclusive design: 
The app is very easy to use and intuitive in terms of navigation, and the buttons are intentionally large so that they can easily be seen. It's screen reader accessible in its relevant languages, and has appropriately large tap areas for all buttons, including settings toggles and quiz answer buttons.

*Resources Used*
- The logic used to design out the quiz function (selecting notes and gauging correctness) was referenced from a prior project of Dillon's

*Challenges*
- Something that was a challenge for this project was figuring out how to implement the language toggle and not hard code all of the text. This meant implementing a custom language class and provider to be able to eliminate that hard coding element, and deeveloping a system to implement that was an interesting facet of app design that we hadn't really had to face before. Another understanding that was deepened was having buttons that did more than just navigate between pages or increase a number. Implementing a quiz and having the onpressed function be variable between selections brought up critical ideas on how to match randomized quiz behavior to specific buttons, so that the functionality was more tied to the button's contents than its location in the scaffold.


*What Changed During The Process*
- One of the first changes we made from our original concept wireframes was that we removed the feature of the day streak and decided to just have a welcome screen. We decided to do that to reduce the amount of providers and stored data that we needed to handle and instead focus that effort on the more challenging components like the quiz functionality and language toggle. We actually kept a lot of the original designs from our initial sketches when it came to aesthetics. An idea that was scrapped as well was the 'tips' idea to display weather dependent tips for the user on the weather page, because we realized the realm of music was too broad to be able to find effective tips for a given user without knowing their musical focus.

*Future Work*
- expanding the learning activities and contents
An idea we had was to expand the learning activities to cover a wider breadth of content. Our app only covers notes right now, but there are many other facts of music theory that are just as useful and important to learn that are not currently represented in the app. Some content to add would include rhythm exercises and a new quiz allowing users to practice identifying various keys.
Another idea that could take this app in a new direction would be to provide more specialized information. This includes providing different learning tools depending on instrument (some instruments read bass clef, some treble clef for example), or vocal specific note exercises (some vocalists tend to focus more on harmonies than their instrumental counterparts do).