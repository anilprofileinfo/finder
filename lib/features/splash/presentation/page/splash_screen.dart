import 'dart:async';

import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1800),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, loginRoute, (r) => false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "finder",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 62.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
