import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/animations/animations_model.dart';

abstract class AnimationsState extends Equatable {
  const AnimationsState();

  @override
  List<Object> get props => [];
}

class AnimationsLoading extends AnimationsState {}

class AnimationsInitial extends AnimationsState {}

class AnimationsLoaded extends AnimationsState {
  final AnimationsModel animationsModel;

  AnimationsLoaded({
    @required this.animationsModel,
  }) : assert(animationsModel != null);
}
