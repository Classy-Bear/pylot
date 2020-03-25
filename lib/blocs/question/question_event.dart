import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class QuestionAnswered extends QuestionEvent {
  final bool isCorrect;

  QuestionAnswered({@required this.isCorrect}) : assert(isCorrect != null);

  @override
  List<Object> get props => [isCorrect];

  @override
  bool get stringify => true;
}

class QuestionFetched extends QuestionEvent {
  final String planet;

  QuestionFetched({@required this.planet}) : assert(planet != null);

  @override
  List<Object> get props => [planet];

  @override
  bool get stringify => true;
}

class QuestionReloaded extends QuestionEvent {}

class QuestionPreviousPressed extends QuestionEvent {}
