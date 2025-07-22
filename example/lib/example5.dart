import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_card_animation.dart';

void main() => runApp(const CentralShuffleAnimationApp());

class CentralShuffleAnimationApp extends StatelessWidget {
  const CentralShuffleAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF8E24AA);
    const inactiveColor = Color(0xFFCE93D8);

    return MaterialApp(
      title: 'Central Shuffle Animation',
      home: Scaffold(
        backgroundColor: const Color(0xFFF3E5F5),
        appBar: AppBar(
          title: const Text('Central Shuffle Animation'),
          backgroundColor: activeColor,
        ),
        body: Center(
          child: CardAnimation(
            animationType: CardAnimationType.shuffle,
            cardStyle: const CardStyle(
              height: 400,
              width: 300,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              borderRadius: 20,
            ),
            totalCards: 5,
            builder: (context, index) => Center(
              child: Text(
                'Central Shuffle $index',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
