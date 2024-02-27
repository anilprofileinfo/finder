import 'package:finder/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordLink extends StatelessWidget {
  const LoginForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot password?",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16),
        ),
      ),
    );
  }
}
