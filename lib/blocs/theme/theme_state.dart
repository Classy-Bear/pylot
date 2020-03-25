import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/theme/theme_model.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeLoading extends ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeModel themeModel;

  ThemeLoaded({
    @required this.themeModel,
  });

  @override
  List<Object> get props => [themeModel];
}
