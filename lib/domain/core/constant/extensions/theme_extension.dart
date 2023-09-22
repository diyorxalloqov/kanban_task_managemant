import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get brightness {
    final currentBrightness = Theme.of(this).brightness;
    return currentBrightness == Brightness.dark ? true : false;
  }
}
