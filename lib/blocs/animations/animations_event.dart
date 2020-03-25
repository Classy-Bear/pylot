import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pylot/models/animations/animtions_enum.dart';

abstract class AnimationsEvent extends Equatable {}

class AnimationsSwitch extends AnimationsEvent {
  final Animations animations;

  AnimationsSwitch({
    @required this.animations,
  }) : assert(animations != null);

  @override
  List<Object> get props => [animations];

  @override
  bool get stringify => true;
}
