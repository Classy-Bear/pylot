import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/blocs.dart';
import 'package:pylot/widgets/widgets.dart';

class PlanetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetsBloc, PlanetsState>(
      builder: (context, state) {
        if (state is PlanetsLoading) {
          BlocProvider.of<PlanetsBloc>(context).add(PlanetsFetched());
          return Center(child: CircularProgressIndicator());
        }
        if (state is PlanetsLoadSuccess) {
          final quizzes = state.planets;
          return ListView.builder(
            itemBuilder: (context, index) {
              return PlanetListItem(
                planet: quizzes[index],
              );
            },
            itemCount: quizzes.length,
          );
        }
        return LoadFailure(
          onPressed: () {
            BlocProvider.of<PlanetsBloc>(context).add(PlanetsFetched());
          },
        );
      },
    );
  }
}
