import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/quiz.dart';
import 'package:pylot/repositories/repositories.dart';

import 'bloc.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final Repository repository;

  QuizzesBloc({@required this.repository}) : assert(repository != null);

  @override
  QuizzesState get initialState => QuizzesLoading();

  @override
  Stream<QuizzesState> mapEventToState(QuizzesEvent event) async* {
    if (event is QuizzesFetched) {
      yield* _mapQuizzesFetchedToState(event);
      return;
    }
  }

  Stream<QuizzesState> _mapQuizzesFetchedToState(QuizzesFetched event) async* {
    try {
      final List<Quiz> quizzes = await repository.getQuizzes();
      yield QuizzesLoadSuccess(quizzes: quizzes);
    } catch (_) {
      yield QuizzesLoadFailure();
    }
  }
}
