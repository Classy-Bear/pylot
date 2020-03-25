import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/quiz.dart';

abstract class QuizzesState extends Equatable {
  const QuizzesState();
  @override
  List<Object> get props => [];
}

class QuizzesLoading extends QuizzesState {}

class QuizzesLoadSuccess extends QuizzesState {
  final List<Quiz> quizzes;

  const QuizzesLoadSuccess({@required this.quizzes}) : assert(quizzes != null);

  @override
  List<Object> get props => [quizzes];
}

class QuizzesLoadFailure extends QuizzesState {}
