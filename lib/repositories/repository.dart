import 'package:meta/meta.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/utils/strings_resources.dart';

import 'repositories.dart';

class Repository {
  final ApiClient apiClient;

  Repository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<Planet>> getPlanets() async {
    final jsonResponse = await apiClient.getJson(StringResources.planetsUrl);
    final jsonParsed = PlanetList.fromJson(jsonResponse);
    return jsonParsed.planets;
  }

  Future<List<Quiz>> getQuizzes() async {
    final jsonResponse = await apiClient.getJson(StringResources.quizzesUrl);
    final jsonParsed = QuizzesList.fromJson(jsonResponse);
    return jsonParsed.quizzes;
  }

  Future<List<PlanetQuestion>> getPlanetQuiz(String planet) async {
    final jsonResponse = await apiClient
        .getJson(StringResources.questionPlanetUrl(planet.toLowerCase()));
    final jsonParsed = PlanetQuestionList.fromJson(jsonResponse);
    return jsonParsed.planetQuizzes;
  }
}
