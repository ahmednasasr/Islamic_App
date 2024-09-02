import 'dart:async';
import 'package:flutter/material.dart';

import 'Layout_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routename = 'splashscreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routename, (route) => false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/iamges/6585.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Image.asset('assets/iamges/logo.png'),
            );
          },
        ),
      ),
    );
  }
}
