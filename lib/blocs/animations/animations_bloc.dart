import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pylot/models/animations/animations_model.dart';

import 'bloc.dart';

class AnimationsBloc extends HydratedBloc<AnimationsEvent, AnimationsState> {
  @override
  AnimationsState get initialState {
    return super.initialState ?? AnimationsInitial();
  }

  @override
  Stream<AnimationsState> mapEventToState(AnimationsEvent event) async* {
    if (event is AnimationsSwitch) {
      yield AnimationsLoading(); // This is called because we can't yield the same state
      yield AnimationsLoaded(
        animationsModel: AnimationsModel(animations: event.animations),
      );
    }
  }

  @override
  AnimationsState fromJson(Map<String, dynamic> json) {
    try {
      final themeData = AnimationsModel.fromJson(json);
      return AnimationsLoaded(animationsModel: themeData);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AnimationsState state) {
    if (state is AnimationsLoaded) {
      return state.animationsModel.toJson();
    } else {
      return null;
    }
  }
}
