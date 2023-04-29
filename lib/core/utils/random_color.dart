import 'dart:math' as math;
import 'package:flutter/material.dart';

class RandomColor {
  static int seedIncrement = 0;
  static Color get randomColor {
    math.Random rand = math.Random(seedIncrement++);
    return Color((rand.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
