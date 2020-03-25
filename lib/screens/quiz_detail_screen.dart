import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/blocs.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/utils/strings_resources.dart';
import 'package:pylot/widgets/quiz_detail.dart';

class QuizDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final Quiz quiz = args.message;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          return QuizDetail(
            title: quiz.title,
            planet: args.title,
            description: quiz.description,
            image: quiz.image,
            links: quiz.links,
            onPressed: () {
              final currentState = state;
              var planet;
              if (currentState is QuestionLoadSuccess) {
                if (currentState.planet != args.title) {
                  planet = args.title;
                  print(planet);
                } else {
                  planet = currentState.planet;
                  print(planet);
                }
              }
              BlocProvider.of<QuestionBloc>(context)
                  .add(QuestionFetched(planet: planet ?? args.title));
              Navigator.pushNamed(context, StringResources.questionScreenId,
                  arguments: ScreenArguments(title: planet ?? args.title));
            },
          );
        },
      ),
    );
  }
}
