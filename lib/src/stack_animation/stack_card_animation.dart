import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';

class StackCardAnimation extends StatelessWidget {
  final CardStyle cardStyle;
  final int totalCards;
  final Widget Function(BuildContext, int)
  builder; // Builder function to customize card content
  final controller = Get.put(StackCardController());

  StackCardAnimation({
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
              .take(3) // still only 3 in the stack
              .map((entry) {
                final layer = entry.key; // 0,1,2
                final index = controller.currentCardIndex.value;
                final cardIndex = (layer + index) % controller.cardOrder.length;
                final cardValue = controller.cardOrder[cardIndex];
                final offset = controller.currentOffset.value.abs();

                // base scale for each layer: 1.0, 0.9, 0.8
                final baseScale = (1.0 - layer * 0.1).clamp(0.0, 1.0);
                // scale of the “layer above” (for layer>0): layer1→layer0, layer2→layer1
                final prevLayerScale = layer > 0
                    ? (1.0 - (layer - 1) * 0.1).clamp(0.0, 1.0)
                    : 1.0;

                // lerp t from 0→1 as you drag the top card
                final t = (offset / 300).clamp(0.0, 1.0);

                // if it’s layer 0 (top), always full size
                // if layer 1 or 2, lerp from its baseScale → prevLayerScale
                final scale = layer == 0
                    ? 1.0
                    : baseScale + (prevLayerScale - baseScale) * t;

                // same idea for opacity, if you want it to fade in
                final baseOpacity = baseScale;
                final prevOpacity = prevLayerScale;
                final opacity = layer == 0
                    ? 1.0
                    : baseOpacity + (prevOpacity - baseOpacity) * t;

                final left = cardIndex == index
                    ? controller.currentOffset.value
                    : 0.0;

                return AnimatedPositioned(
                  key: ValueKey(cardValue),
                  duration: const Duration(milliseconds: 200),
                  bottom: 30.0 * layer,
                  left: left,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: opacity,
                    child: Transform.translate(
                      offset: Offset(left, 0),
                      child: Transform.scale(
                        scale: scale,
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (d) =>
                              controller.currentOffset.value += d.delta.dx,
                          onHorizontalDragEnd: (d) {
                            final o = controller.currentOffset.value;
                            if (o > 100) {
                              controller.cycleCardsRight();
                            } else if (o < -100) {
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
                            builder: (ctx) => builder(ctx, cardValue),
                            isTopCard: cardIndex == index,
                          ),
                        ),
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
