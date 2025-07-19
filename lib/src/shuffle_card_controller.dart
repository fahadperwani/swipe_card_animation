import 'dart:async';
import 'package:get/get.dart';

class ShuffleCardController extends GetxController {
  var cardOrder = [-1, 0, 1, 2, -1].obs;
  var currentCardIndex = 0.obs;
  var currentOffset = 0.0.obs;
  var startIndex = 0.obs;
  var isLeftSwiping = false.obs;
  RxnDouble startOffset = RxnDouble(null);
  RxnBool isLeftSwipe = RxnBool(null);

  void cycleCardsRight() {
    swap(
      startIndex.value,
      (startIndex.value - 2 + cardOrder.length) % cardOrder.length,
    );
    isLeftSwipe.value = false;
    Timer(const Duration(milliseconds: 100), () {
      currentOffset.value = 0.0;
    });
    Timer(const Duration(milliseconds: 300), () {
      startIndex.value = startIndex.value - 1 < 0
          ? cardOrder.length - 1
          : startIndex.value - 1;
      isLeftSwipe.value = null;
      // var newList = [
      //   cardOrder[3],
      //   cardOrder[0],
      //   cardOrder[1],
      //   cardOrder[2],
      //   cardOrder[4],
      // ];
      // cardOrder.assignAll(newList);
    });
  }

  void cycleCardsLeft() {
    swap(
      (startIndex.value + 1) % cardOrder.length,
      (startIndex.value + 4) % cardOrder.length,
    );
    isLeftSwipe.value = true;
    Timer(const Duration(milliseconds: 100), () {
      currentOffset.value = 0.0;
    });
    Timer(const Duration(milliseconds: 300), () {
      startIndex.value = (startIndex.value + 1) % cardOrder.length;
      isLeftSwipe.value = null;
      // var newList = [
      //   cardOrder[0],
      //   cardOrder[2],
      //   cardOrder[3],
      //   cardOrder[4],
      //   cardOrder[1],
      // ];
      // cardOrder.assignAll(newList);
    });
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
