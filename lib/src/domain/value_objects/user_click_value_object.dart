import 'dart:ui';
import 'package:equatable/equatable.dart';

class UserClick extends Equatable {
  final String widgetName;
  final Offset offset;
  final DateTime time;
  UserClick(this.widgetName, this.offset) : time = DateTime.now();

  @override
  List<Object> get props => [widgetName, offset];
}
