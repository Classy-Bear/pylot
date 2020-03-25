import 'package:equatable/equatable.dart';

abstract class PlanetsEvent extends Equatable {
  const PlanetsEvent();
  @override
  List<Object> get props => [];
}

class PlanetsFetched extends PlanetsEvent {}
