///
/// Copyright (c) 2020 arconsis IT-Solutions GmbH
/// Licensed under MIT (https://github.com/arconsis/measurements/blob/master/LICENSE)
///

import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:measurements/measurement_controller.dart';
import 'package:measurements/measurements.dart';
import 'package:measurements/style/magnification_style.dart';

abstract class MetadataEvent extends Equatable {
}

class MetadataBackgroundEvent extends MetadataEvent {
  final ui.Image backgroundImage;
  final Size size;

  MetadataBackgroundEvent(this.backgroundImage, this.size);

  @override
  List<Object> get props => [backgroundImage, size];

  @override
  String toString() {
    return super.toString() + " size: $size, backgroundImage: $backgroundImage";
  }
}

class MetadataStartedEvent extends MetadataEvent {
  final bool measure;
  final bool showDistances;
  final MeasurementInformation measurementInformation;
  final MagnificationStyle magnificationStyle;
  final MeasurementController controller;

  MetadataStartedEvent({
    @required this.measure,
    @required this.showDistances,
    @required this.measurementInformation,
    @required this.magnificationStyle,
    @required this.controller,
  });

  @override
  List<Object> get props => [measurementInformation, controller, measure, showDistances, magnificationStyle];

  @override
  String toString() {
    return super.toString() + " MeasurementInformation: $measurementInformation, measure: $measure, showDistances: $showDistances, magnificationStyle: $magnificationStyle";
  }
}

class MetadataOrientationEvent extends MetadataEvent {
  final Orientation orientation;

  MetadataOrientationEvent(this.orientation);

  @override
  List<Object> get props => [orientation];

  @override
  String toString() {
    return super.toString() + " orientation: $orientation";
  }
}

class MetadataUpdatedEvent extends MetadataEvent {
  final bool measure;
  final Orientation orientation;
  final double zoom;
  final double maxZoom;

  MetadataUpdatedEvent(this.measure, this.orientation, this.zoom, this.maxZoom);

  @override
  List<Object> get props => [measure, orientation, zoom, maxZoom];

  @override
  String toString() {
    return super.toString() + " measure: $measure, orientation: $orientation, zoom: $zoom, maxZoom: $maxZoom";
  }
}