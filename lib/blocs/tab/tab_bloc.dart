import 'package:bloc/bloc.dart';
import 'package:pylot/models/app_tab.dart';

import 'bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.quizzes;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is TabPressed) {
      yield event.tab;
    }
  }
}
