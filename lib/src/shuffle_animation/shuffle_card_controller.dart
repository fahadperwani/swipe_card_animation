import 'package:get/get.dart';

class ShuffleCardController extends GetxController {
  var cardOrder = <int>[];
  var currentCardIndex = 0.obs;
  var currentOffset = 0.0.obs;
  RxnDouble startOffset = RxnDouble(null);

  void setTotalCards(int totalCards) {
    cardOrder = List.generate(totalCards + 1, (index) => index);
  }

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
    currentOffset.value = 0.0;
  }

  void swap(int i, int j) {
    final newList = List<int>.from(cardOrder);
    var temp = newList[i];
    newList[i] = newList[j];
    newList[j] = temp;
    cardOrder.assignAll(newList);
  }
}
