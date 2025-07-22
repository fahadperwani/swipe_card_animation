import 'package:flutter/material.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

/// A universal widget to display card animations.
///
/// [animationType] selects the animation (stack or shuffle).
/// [cardStyle], [totalCards], and [builder] are passed to the underlying animation.
class CardAnimation extends StatelessWidget {
  final CardAnimationType animationType;
  final CardStyle cardStyle;
  final int totalCards;
  final Widget Function(BuildContext, int) builder;

  const CardAnimation({
    super.key,
    required this.animationType,
    required this.cardStyle,
    required this.totalCards,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    switch (animationType) {
      case CardAnimationType.stack:
        return StackCardAnimation(
          cardStyle: cardStyle,
          totalCards: totalCards,
          builder: builder,
        );
      case CardAnimationType.shuffle:
        return ShuffleCardAnimation(
          cardStyle: cardStyle,
          totalCards: totalCards,
          builder: builder,
        );
    }
  }
}
