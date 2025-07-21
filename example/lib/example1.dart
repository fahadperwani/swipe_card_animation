import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

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
                      color: (feature['colors'] as List<Color>).last
                          .withOpacity(0.25),
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
