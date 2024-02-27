import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
            style: TextStyle(fontSize: 16)),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, signupRoute);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ))
      ],
    );
  }
}
