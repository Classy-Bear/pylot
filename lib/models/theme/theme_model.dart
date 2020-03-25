import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import 'app_theme.dart';

part 'theme_model.g.dart';

@JsonSerializable()
class ThemeModel {
  final AppTheme theme;

  ThemeModel({
    @required this.theme,
  }) : super();

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
