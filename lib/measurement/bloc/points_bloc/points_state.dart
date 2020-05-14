import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:measurements/measurement/drawing_holder.dart';
import 'package:measurements/measurement/overlay/holder.dart';

abstract class PointsState extends Equatable {
}

class PointsEmptyState extends PointsState {
  @override
  List<Object> get props => null;
}

class PointsSingleState extends PointsState {
  final Offset point;

  PointsSingleState(this.point);

  @override
  List<Object> get props => [point];

  @override
  String toString() {
    return super.toString() + " point: $point";
  }
}

class PointsOnlyState extends PointsState {
  final List<Offset> points;

  PointsOnlyState(this.points);

  @override
  List<Object> get props => [points];

  @override
  String toString() {
    return super.toString() + " points: $points";
  }
}

class PointsAndDistanceState extends PointsState {
  final List<Holder> holders;
  final Offset viewCenter;

  PointsAndDistanceState(this.holders, this.viewCenter);

  @override
  List<Object> get props => [holders, viewCenter];

  @override
  String toString() {
    return super.toString() + " drawingHolder: $holders -- viewCenter: $viewCenter";
  }
}

class PointsAndDistanceActiveState extends PointsAndDistanceState {
  final List<int> nullIndices;

  PointsAndDistanceActiveState(List<Holder> holders, Offset viewCenter, this.nullIndices) : super(holders, viewCenter);

  @override
  List<Object> get props => [holders, viewCenter, nullIndices];

  @override
  String toString() {
    return super.toString() + " -- nullIndex: $nullIndices";
  }
}