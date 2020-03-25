import 'package:equatable/equatable.dart';
import 'package:pylot/models/app_tab.dart';
import 'package:meta/meta.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabPressed extends TabEvent {
  final AppTab tab;

  const TabPressed({@required this.tab}) : assert(tab != null);

  @override
  List<Object> get props => [tab];

  @override
  bool get stringify => true;
}
