import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/tab/bloc.dart';
import 'package:pylot/models/app_tab.dart';
import 'package:pylot/screens/screens.dart';
import 'package:pylot/widgets/home_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: SelectedItem(activeTab),
          bottomNavigationBar: HomeNavigationBar(
            currentIndex: AppTab.values.indexOf(activeTab),
            onTap: (int index) => BlocProvider.of<TabBloc>(context)
                .add(TabPressed(tab: AppTab.values[index])),
          ),
        );
      },
    );
  }
}

class SelectedItem extends StatelessWidget {
  final AppTab currentTab;

  SelectedItem(this.currentTab);

  @override
  Widget build(BuildContext context) {
    if (currentTab == AppTab.quizzes) {
      return QuizzesScreen();
    }
    if (currentTab == AppTab.planets) {
      return PlanetsScreen();
    }
    if (currentTab == AppTab.settings) {
      return PreferencesScreen();
    }
    return Center(child: Text('Open an issue if you see this in your app.'));
  }
}
