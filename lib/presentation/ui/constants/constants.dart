import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Constants {
  static const appBarHeight = 80.0;
  static const customScrollCacheExtent = 3500.0;
  static final fadeInTransition = <Effect>[
    FadeEffect(curve: Curves.easeInOut, duration: 750.ms),
  ];
}
