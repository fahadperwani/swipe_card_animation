import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  final Color activeColor;
  final Color inactiveColor;
  final double borderRadius;
  final Widget Function(BuildContext context) builder;
  final bool isTopCard;

  const CardItem({
    Key? key,
    required this.cardHeight,
    required this.cardWidth,
    required this.activeColor,
    required this.inactiveColor,
    required this.borderRadius,
    required this.builder,
    required this.isTopCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalMargin = (screenWidth - cardWidth) / 2;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      decoration: BoxDecoration(
        color: isTopCard ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: builder(context),
    );
  }
}
