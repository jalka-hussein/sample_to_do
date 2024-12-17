import 'package:flutter/material.dart';

extension SpaceExtensions on int? {
  int validate({int value = 10}) {
    return this ?? value;
  }

  Widget get h => SizedBox(
        height: this?.toDouble(),
      );

  Widget get w => SizedBox(
        width: this?.toDouble(),
      );
}
