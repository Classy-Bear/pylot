import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pylot/models/theme/theme_model.dart';
import 'bloc.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    return super.initialState ?? ThemeInitial();
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield ThemeLoading(); // This is called because we can't yield the same state
      yield ThemeLoaded(themeModel: ThemeModel(theme: event.theme));
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    try {
      final themeData = ThemeModel.fromJson(json);
      return ThemeLoaded(themeModel: themeData);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    if (state is ThemeLoaded) {
      return state.themeModel.toJson();
    } else {
      return null;
    }
  }
}
