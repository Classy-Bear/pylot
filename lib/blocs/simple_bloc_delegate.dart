import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SimpleBlocDelegate extends HydratedBlocDelegate {
  SimpleBlocDelegate(HydratedStorage storage) : super(storage);
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print("Event triggered: $event on: ${bloc.runtimeType}}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("$transition on: ${bloc.runtimeType}");
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print("Error: $error on: ${bloc.runtimeType}; $stacktrace");
  }
}
