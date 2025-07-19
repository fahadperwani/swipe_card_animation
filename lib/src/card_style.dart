import 'package:flutter/material.dart';

class CardStyle {
  final double cardWidth;
  final double cardHeight;
  final Color activeColor;
  final Color inactiveColor;
  final BorderRadius borderRadius;

  const CardStyle({
    this.cardWidth = 300,
    this.cardHeight = 400,
    this.activeColor = const Color(0xFFFFFFFF),
    this.inactiveColor = const Color(0xFFE0E0E0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  CardStyle copyWith({
    double? cardWidth,
    double? cardHeight,
    Color? activeColor,
    Color? inactiveColor,
    BorderRadius? borderRadius,
  }) {
    return CardStyle(
      cardWidth: cardWidth ?? this.cardWidth,
      cardHeight: cardHeight ?? this.cardHeight,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
