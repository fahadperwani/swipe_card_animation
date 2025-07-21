import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'card_animation_type.dart';

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
    Key? key,
    required this.animationType,
    required this.cardStyle,
    required this.totalCards,
    required this.builder,
  }) : super(key: key);

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
