import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                final index = controller.currentCardIndex.value;
                final int cardIndex = (entry.key + index) % cardOrder.length;
                final int cardValue = cardOrder[cardIndex];

                if (cardValue == -1) return const SizedBox.shrink();

                final offset = controller.currentOffset.value;

                double left = 0;
                if (cardIndex == index) left = offset;
                if (cardIndex == (index + 1) % cardOrder.length) {
                  if (offset < 0) {
                    left = (offset - 5.w) * -1;
                  } else {
                    left = 5.w;
                  }
                }
                if (cardIndex ==
                    (index - 2 + cardOrder.length) % cardOrder.length) {
                  if (offset > 0) {
                    left = (offset + 5.w) * -1;
                  } else {
                    left = -5.w;
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
                      child: buildCard(
                        cardValue,
                        cardIndex,
                        (cardIndex - index) == 0,
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

  Widget buildCard(int value, int index, bool isTopCard) {
    return AnimatedContainer(
      key: ValueKey(value),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.symmetric(horizontal: horizontalOffset),
      decoration: BoxDecoration(
        color: isTopCard ? Color(0xFFFFFFFF) : Color(0xFFE0E0E0),
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
