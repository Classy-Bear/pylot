import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/theme/app_theme.dart';

abstract class ThemeEvent extends Equatable {}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme,
  });

  @override
  List<Object> get props => [theme];

  @override
  bool get stringify => true;
}
