import 'package:flutter/material.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

void main() => runApp(const ShuffleCardAnimationApp());

class ShuffleCardAnimationApp extends StatelessWidget {
  const ShuffleCardAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFFF5F5F5); // light grey
    const inactiveColor = Color(0xFFE0E0E0); // slightly darker grey

    return MaterialApp(
      title: 'Shuffle Card Animation',
      home: Scaffold(
        backgroundColor: const Color(0xFFF3E5F5),
        appBar: AppBar(
          title: const Text('Shuffle Card Animation'),
          backgroundColor: activeColor,
        ),
        body: Center(
          child: ShuffleCardAnimation(
            cardStyle: const CardStyle(
              height: 300,
              width: 300,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              borderRadius: 20,
            ),
            totalCards: 5,
            builder: (context, index) => Center(
              child: Text(
                'Shuffle $index',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.brown,
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
