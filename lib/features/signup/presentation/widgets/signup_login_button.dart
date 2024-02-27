
import 'package:finder/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SignupLoginButton extends StatelessWidget {
  const SignupLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Already have an account?"),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Login",
              style: TextStyle(
                  color: AppColors.primaryColor),
            ))
      ],
    );
  }
}
