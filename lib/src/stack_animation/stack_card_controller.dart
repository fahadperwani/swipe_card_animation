import 'package:get/get.dart';

class StackCardController extends GetxController {
  var cardOrder = <int>[];
  var currentCardIndex = 0.obs;
  var currentOffset = 0.0.obs;
  RxnDouble startOffset = RxnDouble(null);

  void setTotalCards(int totalCards) {
    cardOrder = List.generate(totalCards, (index) => index);
    print("Card order: $cardOrder");
  }

  void cycleCardsRight() {
    currentCardIndex.value = (currentCardIndex.value + 1) % cardOrder.length;
    animateBack();
  }

  void cycleCardsLeft() {
    currentCardIndex.value = (currentCardIndex.value + 1) % cardOrder.length;
    animateBack();
  }

  void animateBack() {
    currentOffset.value = 0.0;
  }
}
