// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationsModel _$AnimationsModelFromJson(Map<String, dynamic> json) {
  return AnimationsModel(
    animations: _$enumDecodeNullable(_$AnimationsEnumMap, json['animations']),
  );
}

Map<String, dynamic> _$AnimationsModelToJson(AnimationsModel instance) =>
    <String, dynamic>{
      'animations': _$AnimationsEnumMap[instance.animations],
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

const _$AnimationsEnumMap = {
  Animations.on: 'on',
  Animations.off: 'off',
};
