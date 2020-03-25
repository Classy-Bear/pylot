import 'package:flutter/material.dart';
import 'package:pylot/models/planet_quiz.dart';

class Question extends StatefulWidget {
  final String question;
  final List<Answer> answers;
  final Function(bool) onQuestionSelected;
  final Function onPreviousSelected;

  Question(
      {this.question,
      this.answers,
      this.onQuestionSelected,
      this.onPreviousSelected})
      : assert(question != null),
        assert(answers != null),
        assert(onQuestionSelected != null);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int _answerSelected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Text(widget.question, style: Theme.of(context).textTheme.headline4),
        SizedBox(
          height: 32,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Text(
                widget.answers[index].option,
                style: Theme.of(context).textTheme.body1,
              ),
              trailing: Radio(
                value: index,
                groupValue: _answerSelected,
                onChanged: (int value) {
                  setState(() {
                    print("Answer selected = ${widget.answers[index].option}");
                    setState(() {
                      _answerSelected = value;
                    });
                  });
                },
              ),
            );
          },
          shrinkWrap: true,
          itemCount: widget.answers.length,
          physics: NeverScrollableScrollPhysics(),
        ),
        ButtonBar(
          buttonPadding: EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            FlatButton(
              child: Text("previous".toUpperCase()),
              onPressed: widget.onPreviousSelected,
            ),
            RaisedButton(
              child: Text("next".toUpperCase()),
              onPressed: _answerSelected == -1
                  ? null
                  : () {
                      widget.onQuestionSelected(
                          widget.answers[_answerSelected].isCorrect);
                      setState(() {
                        _answerSelected = -1;
                      });
                    },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ],
        )
      ],
    );
  }
}
