import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipe_cards/src/shuffle_card_animation.dart';

void main() {
  runApp(const SwipeCardExampleApp());
}

class SwipeCardExampleApp extends StatelessWidget {
  const SwipeCardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Cards Demo',
      home: const SwipeCardDemo(),
    );
  }
}

class SwipeCardDemo extends StatelessWidget {
  const SwipeCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 🟡 Manually initialize ScreenUtil here
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Swipe Cards Demo"), centerTitle: true),
      body: Center(child: ShuffleCardAnimation()),
    );
  }

  Widget buildCard(String label, Color color) {
    return Card(
      color: color,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24.sp, // this now works because we initialized ScreenUtil
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
