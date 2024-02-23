import 'package:finder/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome to",
          style: TextStyle(fontSize: 24),
        ),
        Text("finder",
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 48.0,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Text("Enter your credential to login"),
        ),
      ],
    );
  }
}
