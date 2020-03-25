import 'package:equatable/equatable.dart';

abstract class QuizzesEvent extends Equatable {
  const QuizzesEvent();
  @override
  List<Object> get props => [];
}

class QuizzesFetched extends QuizzesEvent {}
