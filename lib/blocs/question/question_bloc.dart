import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/planet_quiz.dart';
import 'package:pylot/repositories/repositories.dart';

import './bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final Repository repository;

  QuestionBloc({@required this.repository}) : assert(repository != null);

  @override
  QuestionState get initialState => QuestionLoadInProgress();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    if (event is QuestionFetched) {
      yield* _mapQuestionLoadingToState(event);
    }
    if (event is QuestionReloaded) {
      yield* _mapQuestionReloadedToState(event);
    }
    if (event is QuestionAnswered) {
      yield* _mapQuestionAnsweredToState(event);
    }
    if (event is QuestionPreviousPressed) {
      yield* _mapQuestionPreviousToState(event);
    }
  }

  Stream<QuestionState> _mapQuestionLoadingToState(
      QuestionFetched event) async* {
    try {
      yield QuestionLoadInProgress();
      List<PlanetQuestion> planetQuestions =
          await repository.getPlanetQuiz(event.planet);
      yield QuestionLoadSuccess(
          planets: planetQuestions, index: 0, score: 0, planet: event.planet);
    } catch (_) {
      yield QuestionLoadFailure();
    }
  }

  Stream<QuestionState> _mapQuestionReloadedToState(
      QuestionReloaded event) async* {
    final currentState = state;
    yield QuestionLoadInProgress();
    if (currentState is QuestionLoadSuccess) {
      yield QuestionLoadSuccess(
          planets: currentState.planets,
          index: 0,
          score: currentState.score,
          planet: currentState.planet);
    }
  }

  Stream<QuestionState> _mapQuestionPreviousToState(
      QuestionPreviousPressed event) async* {
    final currentState = state;
    yield QuestionPreview();
    if (currentState is QuestionLoadSuccess) {
      final newIndex = currentState.index - 1;
      var newScore = currentState.score;
      if(currentState.index <= currentState.score){
        newScore--;
      }
      yield QuestionLoadSuccess(
          planets: currentState.planets,
          index: newIndex,
          score: newScore,
          planet: currentState.planet);
    }
  }

  Stream<QuestionState> _mapQuestionAnsweredToState(
    QuestionAnswered event,
  ) async* {
    final currentState = state;
    if (currentState is QuestionLoadSuccess) {
      var newScore = currentState.score;
      if (currentState.index + 1 <= currentState.planets.length) {
        if (event.isCorrect) {
          newScore = currentState.score + 1;
        }
      }
      if (currentState.index + 1 == currentState.planets.length) {
        yield QuestionResult(score: "$newScore/${currentState.planets.length}");
      } else {
        final index = currentState.index + 1;
        yield QuestionLoadSuccess(
          planets: currentState.planets,
          index: index,
          score: newScore,
          planet: currentState.planet,
        );
      }
    }
  }
}
