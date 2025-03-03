import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color adaptiveBackgroundColor(bool isUseImageBackground) =>
      isUseImageBackground ? Colors.transparent : this;
}
