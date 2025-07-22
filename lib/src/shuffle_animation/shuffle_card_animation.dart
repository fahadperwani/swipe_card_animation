import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

class ShuffleCardAnimation extends StatelessWidget {
  final CardStyle cardStyle;
  final int totalCards;
  final Widget Function(BuildContext, int)
  builder; // Builder function to customize card content
  final controller = Get.put(ShuffleCardController());

  ShuffleCardAnimation({
    super.key,
    required this.cardStyle,
    required this.totalCards,
    required this.builder, // Accept the builder function
  }) : assert(totalCards >= 3, 'totalCards must be greater than 3') {
    controller.setTotalCards(totalCards); // Set total cards dynamically
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardStyle.height + 100,
      width: double.infinity,
      child: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: controller.cardOrder
              .asMap()
              .entries
              .map((entry) {
                final index = controller.currentCardIndex.value;
                final cardIndex =
                    (entry.key + index) % controller.cardOrder.length;
                final cardValue = controller.cardOrder[cardIndex];

                // if (cardValue == -1) return const SizedBox.shrink();

                final offset = controller.currentOffset.value;

                double left = 0;
                if (cardIndex == index) left = offset;
                if (cardIndex == (index + 1) % controller.cardOrder.length) {
                  if (offset < 0) {
                    left = (offset - 5) * -1;
                  } else {
                    left = 5;
                  }
                }
                if (cardIndex ==
                    (index - 2 + controller.cardOrder.length) %
                        controller.cardOrder.length) {
                  if (offset > 0) {
                    left = (offset + 5) * -1;
                  } else {
                    left = -5;
                  }
                }

                return AnimatedPositioned(
                  key: ValueKey(cardValue),
                  top: 50,
                  duration: const Duration(milliseconds: 200),
                  left: left,
                  child: Transform.translate(
                    key: ValueKey(cardValue),
                    offset: Offset(left, 0),
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        controller.currentOffset.value +=
                            details.primaryDelta ?? 0;
                      },
                      onHorizontalDragEnd: (details) {
                        final offset = controller.currentOffset.value;
                        if (offset > 100) controller.cycleCardsRight();
                        if (offset < -100) {
                          controller.cycleCardsLeft();
                        } else {
                          controller.animateBack();
                        }
                      },
                      child: CardItem(
                        cardHeight: cardStyle.height,
                        cardWidth: cardStyle.width,
                        activeColor: cardStyle.activeColor,
                        inactiveColor: cardStyle.inactiveColor,
                        borderRadius: cardStyle.borderRadius,
                        builder: (context) => builder(
                          context,
                          cardValue,
                        ), // Use the builder to render content
                        isTopCard: cardIndex == index,
                      ),
                    ),
                  ),
                );
              })
              .toList()
              .reversed
              .toList(),
        );
      }),
    );
  }
}
