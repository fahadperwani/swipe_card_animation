import 'package:flutter/material.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

void main() => runApp(const CentralStackAnimationApp());

class CentralStackAnimationApp extends StatelessWidget {
  const CentralStackAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF26C6DA);
    const inactiveColor = Color(0xFF80DEEA);

    return MaterialApp(
      title: 'Central Stack Animation',
      home: Scaffold(
        backgroundColor: const Color(0xFFE0F7FA),
        appBar: AppBar(
          title: const Text('Central Stack Animation'),
          backgroundColor: activeColor,
        ),
        body: Center(
          child: CardAnimation(
            animationType: CardAnimationType.stack,
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
                'Central Stack $index',
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
