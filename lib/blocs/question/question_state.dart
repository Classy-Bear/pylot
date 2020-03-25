import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/planet_quiz.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionLoadInProgress extends QuestionState {}

class QuestionPreview extends QuestionState {}

class QuestionLoadSuccess extends QuestionState {
  final List<PlanetQuestion> planets;
  final int index;
  final int score;
  final String planet;

  const QuestionLoadSuccess(
      {@required this.planets,
      @required this.index,
      @required this.score,
      @required this.planet})
      : assert(planets != null),
        assert(index != null),
        assert(score != null),
        assert(planet != null);

  @override
  List<Object> get props => [planets, index, score];

  @override
  String toString() => "QuestionLoadSuccess(index: $index, score: $score)";
}

class QuestionLoadFailure extends QuestionState {}

class QuestionResult extends QuestionState {
  final String score;

  QuestionResult({this.score}) : assert(score != null);
}

class QuestionCorrect extends QuestionState {
  final int score;

  QuestionCorrect({this.score}) : assert(score != null);
}
