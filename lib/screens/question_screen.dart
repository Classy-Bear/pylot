import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/question/bloc.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/widgets/question.dart';
import 'package:pylot/widgets/quiz_result.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        if (state is QuestionLoadInProgress) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is QuestionLoadSuccess) {
          return Scaffold(
            appBar: AppBar(
              title:
                  Text("Question ${state.index + 1}/${state.planets.length}"),
              automaticallyImplyLeading: false, // Don't show the leading button

              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    BlocProvider.of<QuestionBloc>(context)
                        .add(QuestionReloaded());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            body: Question(
              question: state.planets[state.index].question,
              answers: state.planets[state.index].answer,
              onQuestionSelected: (answer) {
                BlocProvider.of<QuestionBloc>(context).add(QuestionAnswered(
                  isCorrect: answer,
                ));
              },
              onPreviousSelected: state.index == 0
                  ? null
                  : () {
                      BlocProvider.of<QuestionBloc>(context)
                          .add(QuestionPreviousPressed());
                    },
            ),
          );
        }
        if (state is QuestionResult) {
          return QuizResult(
            score: state.score,
            onFinishedPressed: () {
              Navigator.popUntil(
                  context, (Route<dynamic> route) => route.isFirst);
            },
            onRetakePressed: () {
              BlocProvider.of<QuestionBloc>(context)
                  .add(QuestionFetched(planet: args.title));
            },
          );
        }
        return Container();
      },
    );
  }
}
