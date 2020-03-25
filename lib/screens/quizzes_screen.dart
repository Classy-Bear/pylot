import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/quizzes/bloc.dart';
import 'package:pylot/models/screen_arguments.dart';
import 'package:pylot/utils/strings_resources.dart';
import 'package:pylot/widgets/widgets.dart';

class QuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizzesBloc, QuizzesState>(
      builder: (context, state) {
        if (state is QuizzesLoadSuccess) {
          final quizzes = state.quizzes;
          return ListView.builder(
            itemBuilder: (context, index) {
              return QuizCard(
                title: quizzes[index].title,
                description: quizzes[index].description,
                image: quizzes[index].image,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    StringResources.quizDetailScreenId,
                    arguments: ScreenArguments(
                        title: quizzes[index].planet, message: quizzes[index]),
                  );
                },
              );
            },
            itemCount: quizzes.length,
          );
        }
        if (state is QuizzesLoading) {
          BlocProvider.of<QuizzesBloc>(context).add(QuizzesFetched());
          return Center(child: CircularProgressIndicator());
        }
        return LoadFailure(
          onPressed: () {
            BlocProvider.of<QuizzesBloc>(context).add(QuizzesFetched());
          },
        );
      },
    );
  }
}
