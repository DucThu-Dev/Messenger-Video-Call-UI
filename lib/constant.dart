import 'package:flutter/material.dart';

enum MessengerAnimationMode {
  focus,
  expand,
  hide,
}

const BorderRadius kBorderRadius12 = BorderRadius.all(Radius.circular(12));
const BorderRadius kBorderRadius24 = BorderRadius.all(Radius.circular(24));
const BorderRadius kBorderRadius36 = BorderRadius.all(Radius.circular(36));

const EdgeInsets kPadding12 = EdgeInsets.all(12);

const SizedBox kSpace8 = SizedBox.square(dimension: 8);
const SizedBox kSpace12 = SizedBox.square(dimension: 12);

const double kTinyMeVideoCallViewHeight = 180;
const double kTinyMeVideoCallViewWidth = 120;

const double kDraggableZeroHeightFraction = 0.0;
const double kDraggableMinHeightFraction = 0.2;
const double kDraggableMaxHeightFraction = 0.7;

const Duration draggableBottomSheetAnimateDuration =
    Duration(milliseconds: 250);
const Curve draggableBottomSheetCurve = Curves.linear;
