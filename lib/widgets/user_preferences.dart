import 'package:flutter/material.dart';
import 'package:pylot/models/models.dart';

class UserPreferences extends StatelessWidget {
  final AppTheme state;
  final Function(AppTheme) onChangedTheme;
  final StatelessWidget animationBlocBuilder;

  UserPreferences({this.state, this.onChangedTheme, this.animationBlocBuilder})
      : assert(state != null),
        assert(onChangedTheme != null),
        assert(animationBlocBuilder != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Theme preferences",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          itemCount: AppTheme.values.length,
          itemBuilder: (context, index) {
            final itemAppTheme = AppTheme.values[index];
            return ListTile(
              title: Text(
                pascalToSpaces(itemAppTheme.toString()),
              ),
              trailing: Radio(
                value: itemAppTheme,
                groupValue: state,
                onChanged: (AppTheme theme) {
                  onChangedTheme(theme);
                },
              ),
              onTap: () {
                onChangedTheme(itemAppTheme);
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Animations preferences",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ListTile(
          title: Text("Photo animation"),
          trailing: animationBlocBuilder,
        ),
      ],
    );
  }
}

String pascalToSpaces(String input) {
  final theme = input.substring(input.toString().indexOf(".") + 1);
  final beforeCapitalLetter = RegExp(r"(?=[A-Z])");
  final split = theme.split(beforeCapitalLetter);
  final buffer = new StringBuffer();
  for (String word in split) {
    buffer.write(word);
    buffer.write(" ");
  }
  return buffer.toString();
}
