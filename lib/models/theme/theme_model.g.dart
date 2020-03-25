// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) {
  return ThemeModel(
    theme: _$enumDecodeNullable(_$AppThemeEnumMap, json['theme']),
  );
}

Map<String, dynamic> _$ThemeModelToJson(ThemeModel instance) =>
    <String, dynamic>{
      'theme': _$AppThemeEnumMap[instance.theme],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AppThemeEnumMap = {
  AppTheme.LightBlue: 'LightBlue',
  AppTheme.DarkBlue: 'DarkBlue',
  AppTheme.RedLight: 'RedLight',
  AppTheme.RedDark: 'RedDark',
};
