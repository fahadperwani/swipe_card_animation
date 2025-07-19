import 'dart:async';
import 'package:get/get.dart';

class ShuffleCardController extends GetxController {
  var cardOrder = [0, 1, 2, -1].obs;
  var currentCardIndex = 0.obs;
  var currentOffset = 0.0.obs;
  RxnDouble startOffset = RxnDouble(null);
  RxnBool isLeftSwipe = RxnBool(null);

  void cycleCardsRight() {
    swap(
      (currentCardIndex.value + cardOrder.length - 1) % cardOrder.length,
      (currentCardIndex.value + cardOrder.length - 2) % cardOrder.length,
    );
    currentCardIndex.value =
        (currentCardIndex.value - 1 + cardOrder.length) % cardOrder.length;
    animateBack();
  }

  void cycleCardsLeft() {
    swap(
      currentCardIndex.value,
      (currentCardIndex.value + cardOrder.length - 1) % cardOrder.length,
    );
    currentCardIndex.value = (currentCardIndex.value + 1) % cardOrder.length;
    animateBack();
  }

  void animateBack() {
    // Smooth reset to 0
    currentOffset.value = 0.0;
  }

  void swap(int i, int j) {
    final newList = [...cardOrder];
    var temp = newList[i];
    newList[i] = newList[j];
    newList[j] = temp;
    cardOrder.assignAll(newList);
  }
}
