import 'package:flutter/material.dart';

class CardStyle {
  final double height;
  final double width;
  final Color activeColor;
  final Color inactiveColor;
  final double borderRadius;

  const CardStyle({
    required this.height,
    required this.width,
    required this.activeColor,
    required this.inactiveColor,
    required this.borderRadius,
  });
}
