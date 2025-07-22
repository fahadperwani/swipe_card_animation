# Swipe Card Animation Examples

This folder contains various usage examples of the `swipe_card_animation` Flutter package. Each example demonstrates different use-cases for `ShuffleCardAnimation`, `StackCardAnimation`, and `CardAnimation` with the `CardAnimationType` enum.

## 🌀 Examples Showcase

### Shuffle Animation

<img src="https://raw.githubusercontent.com/fahadperwani/swipe_card_animation/main/assets/example1.gif" alt="Shuffle Animation" height="400"/>

```dart
// ShuffleCardAnimationApp
import 'package:flutter/material.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

void main() => runApp(const ShuffleFeaturesApp());

class ShuffleFeaturesApp extends StatelessWidget {
  const ShuffleFeaturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'icon': Icons.star,
        'title': 'Premium Support',
        'desc': '24/7 priority customer support for all your needs.',
        'colors': [Color(0xFF43CEA2), Color(0xFF185A9D)],
      },
      {
        'icon': Icons.cloud_upload,
        'title': 'Cloud Backup',
        'desc': 'Automatic daily backups to keep your data safe.',
        'colors': [Color(0xFFFFAF7B), Color(0xFFD76D77)],
      },
      {
        'icon': Icons.security,
        'title': 'Advanced Security',
        'desc': 'Multi-layered protection for your account.',
        'colors': [Color(0xFF36D1C4), Color(0xFF1E5799)],
      },
      {
        'icon': Icons.speed,
        'title': 'Faster Performance',
        'desc': 'Optimized servers for blazing fast speed.',
        'colors': [Color(0xFFFC5C7D), Color(0xFF6A82FB)],
      },
      {
        'icon': Icons.extension,
        'title': 'Exclusive Integrations',
        'desc': 'Connect with premium third-party services.',
        'colors': [Color(0xFFF7971E), Color(0xFFFFD200)],
      },
    ];

    return MaterialApp(
      title: 'Plan Features Shuffle',
      home: Scaffold(
        backgroundColor: const Color(0xFF181A20),
        appBar: AppBar(
          title: const Text('Plan Features Shuffle'),
          backgroundColor: const Color(0xFF23272F),
        ),
        body: Center(
          child: CardAnimation(
            animationType: CardAnimationType.shuffle,
            cardStyle: const CardStyle(
              height: 320,
              width: 260,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
              borderRadius: 28,
            ),
            totalCards: features.length,
            builder: (context, index) {
              if (index < 0 || index >= features.length) {
                // Return an empty container or handle the out-of-range case gracefully
                return const SizedBox.shrink();
              }
              final feature = features[index];
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: feature['colors'] as List<Color>,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: (feature['colors'] as List<Color>).last.withAlpha(
                        64,
                      ),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        feature['icon'] as IconData,
                        size: 56,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        feature['title'] as String,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        feature['desc'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

---

### Stack Animation

<img src="https://raw.githubusercontent.com/fahadperwani/swipe_card_animation/main/assets/example2.gif" alt="Stack Animation" height="400"/>

```dart
// StackCardQuotesApp
import 'package:flutter/material.dart';
import 'package:swipe_card_animation/swipe_card_animation.dart';

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
```

---

### How to Run Examples

Each file is available inside the `example/` folder of this package.

To run a specific example:

```bash
cd example
flutter run -t lib/filename.dart
```

Replace `filename.dart` with the example you want to run.

## License

MIT License © 2024
