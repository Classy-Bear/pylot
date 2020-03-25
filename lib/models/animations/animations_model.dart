import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import 'animtions_enum.dart';

part 'animations_model.g.dart';

@JsonSerializable()
class AnimationsModel {
  final Animations animations;

  AnimationsModel({
    @required this.animations,
  });

  factory AnimationsModel.fromJson(Map<String, dynamic> json) =>
      _$AnimationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationsModelToJson(this);
}
