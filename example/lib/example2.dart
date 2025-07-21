import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

void main() => runApp(const StackCardQuotesApp());

class StackCardQuotesApp extends StatelessWidget {
  const StackCardQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF26C6DA);

    return MaterialApp(
      title: 'Inspirational Quotes Cards',
      home: Scaffold(
        backgroundColor: const Color(0xFFE0F7FA),
        appBar: AppBar(
          title: const Text('Inspirational Quotes'),
          backgroundColor: activeColor,
        ),
        body: const Center(child: QuotesCardStack()),
      ),
    );
  }
}

class QuotesCardStack extends StatefulWidget {
  const QuotesCardStack({super.key});

  @override
  State<QuotesCardStack> createState() => _QuotesCardStackState();
}

class _QuotesCardStackState extends State<QuotesCardStack> {
  final List<String> quotes = [
    "The best way to get started is to quit talking and begin doing.",
    "Success is not in what you have, but who you are.",
    "Opportunities don't happen, you create them.",
    "Don't watch the clock; do what it does. Keep going.",
    "Great things never come from comfort zones.",
  ];

  late List<String> shuffledQuotes;

  @override
  void initState() {
    super.initState();
    shuffledQuotes = List.from(quotes);
  }

  void reshuffle() {
    setState(() {
      shuffledQuotes.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF26C6DA);
    const inactiveColor = Color(0xFF80DEEA);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StackCardAnimation(
          cardStyle: const CardStyle(
            height: 300,
            width: 250,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            borderRadius: 24,
          ),
          totalCards: shuffledQuotes.length,
          builder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Text(
                shuffledQuotes[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: reshuffle,
          icon: const Icon(Icons.shuffle),
          label: const Text("Shuffle Quotes"),
          style: ElevatedButton.styleFrom(
            backgroundColor: activeColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
