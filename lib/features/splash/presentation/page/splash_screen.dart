import 'dart:async';

import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, loginRoute, (r) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          "finder",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 48.0,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
