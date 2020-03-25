import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/blocs.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/widgets/user_preferences.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is ThemeLoaded) {
        return UserPreferences(
          state: state.themeModel.theme,
          onChangedTheme: (theme) {
            BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: theme));
          },
          animationBlocBuilder: AnimationBlocBuilder(),
        );
      }
      return UserPreferences(
        state: AppTheme.LightBlue,
        onChangedTheme: (theme) {
          BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: theme));
        },
        animationBlocBuilder: AnimationBlocBuilder(),
      );
    });
  }
}

class AnimationBlocBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationsBloc, AnimationsState>(
      builder: (context, state) {
        if (state is AnimationsLoaded) {
          return Switch(
            value: state.animationsModel.animations == Animations.on
                ? true
                : false,
            onChanged: (value) {
              BlocProvider.of<AnimationsBloc>(context).add(AnimationsSwitch(
                  animations: state.animationsModel.animations == Animations.on
                      ? Animations.off
                      : Animations.on));
            },
          );
        }
        return Switch(
          value: true,
          onChanged: (value) {
            BlocProvider.of<AnimationsBloc>(context)
                .add(AnimationsSwitch(animations: Animations.off));
          },
        );
      },
    );
  }
}
