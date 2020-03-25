class StringResources {
  static final homeScreenId = "home_screen";
  static final planetDetailsScreenId = "planet_details_screen";
  static final webPlanetScreenId = "web_planet_screen";
  static final questionScreenId = "question_screen";
  static final quizDetailScreenId = "quiz_detail_screen";
  static final resultScreenId = "result_screen";
  static final planetScreenId = "planet_screen";
  static final planetsUrl =
      'https://raw.githubusercontent.com/Classy-Bear/json/master/planets.json';
  static final quizzesUrl =
      'https://raw.githubusercontent.com/Classy-Bear/json/master/quizzes.json';

  static questionPlanetUrl(String planet) {
    return 'https://raw.githubusercontent.com/Classy-Bear/json/master/quizzes_$planet.json';
  }
}
