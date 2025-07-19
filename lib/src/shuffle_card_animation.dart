import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shuffle_card_controller.dart';

class ShuffleCardAnimation extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  final double horizontalOffset;
  final controller = Get.put(ShuffleCardController());

  ShuffleCardAnimation({
    super.key,
    this.cardHeight = 400,
    this.cardWidth = 300,
    this.horizontalOffset = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight + 100,
      width: double.infinity,
      child: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: controller.cardOrder
              .asMap()
              .entries
              .map((entry) {
                final cardOrder = controller.cardOrder;
                final int cardIndex = entry.key;
                final startIndex = controller.startIndex.value;
                final actualIndex = (startIndex + cardIndex) % cardOrder.length;
                final int cardValue =
                    cardOrder[(startIndex + cardIndex) % cardOrder.length];
                final offset = controller.currentOffset.value;

                bool isTopCard =
                    actualIndex == (startIndex + 1) % cardOrder.length;
                double left = 0;

                if (isTopCard) left = controller.currentOffset.value;
                if (cardValue == -1) {
                  left = (cardIndex == 0)
                      ? -1 * controller.currentOffset.value
                      : controller.currentOffset.value;
                }
                if (offset < 0 &&
                    ((startIndex + 2) % cardOrder.length) == actualIndex) {
                  left = -1 * controller.currentOffset.value;
                }
                if (offset > 0 &&
                    ((startIndex + 3) % cardOrder.length) == actualIndex) {
                  left = -1 * controller.currentOffset.value;
                }

                return AnimatedPositioned(
                  top: 50,
                  duration: const Duration(milliseconds: 200),
                  left: left,
                  child: Opacity(
                    opacity: cardValue == -1 ? 0 : 1,
                    child: Transform.translate(
                      offset: Offset(left, 0),
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          controller.currentOffset.value += details.delta.dx;
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
                        child: buildCard(cardValue, cardIndex),
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

  Widget buildCard(int value, int index) {
    final cardOrder = controller.cardOrder;
    final startIndex = controller.startIndex.value;
    final actualIndex = (startIndex + index) % cardOrder.length;
    bool isTopCard = actualIndex == (startIndex + 1) % cardOrder.length;
    bool? isLeftSwipe = controller.isLeftSwipe.value;
    if (isLeftSwipe != null && isLeftSwipe) {
      isTopCard = actualIndex == (startIndex + 2) % cardOrder.length;
    }
    if (isLeftSwipe != null && !isLeftSwipe) {
      isTopCard = actualIndex == startIndex;
    }

    return AnimatedContainer(
      key: ValueKey(value),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.symmetric(horizontal: horizontalOffset),
      decoration: BoxDecoration(
        color:
            isTopCard ||
                (value == -1 &&
                    (actualIndex != startIndex ||
                        controller.currentOffset.value == 0))
            ? Color(0xFFFFFFFF)
            : Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Center(
        child: Text(
          'Card ${value + 1}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
