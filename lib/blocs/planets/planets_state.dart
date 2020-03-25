import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/planets.dart';

abstract class PlanetsState extends Equatable {
  const PlanetsState();
  @override
  List<Object> get props => [];
}

class PlanetsLoading extends PlanetsState {}

class PlanetsLoadSuccess extends PlanetsState {
  final List<Planet> planets;

  const PlanetsLoadSuccess({@required this.planets}) : assert(planets != null);

  @override
  List<Object> get props => [planets];
}

class PlanetsLoadFailure extends PlanetsState {}
