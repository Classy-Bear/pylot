import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/planets.dart';
import 'package:pylot/repositories/repositories.dart';

import 'bloc.dart';

class PlanetsBloc extends Bloc<PlanetsEvent, PlanetsState> {
  final Repository repository;

  PlanetsBloc({@required this.repository}) : assert(repository != null);

  @override
  PlanetsState get initialState => PlanetsLoading();

  @override
  Stream<PlanetsState> mapEventToState(PlanetsEvent event) async* {
    if (event is PlanetsFetched) {
      yield* _mapQuizzesFetchedToState(event);
    }
  }

  Stream<PlanetsState> _mapQuizzesFetchedToState(PlanetsFetched event) async* {
    try {
      final List<Planet> quizzes = await repository.getPlanets();
      yield PlanetsLoadSuccess(planets: quizzes);
    } catch (_) {
      yield PlanetsLoadFailure();
    }
  }
}
