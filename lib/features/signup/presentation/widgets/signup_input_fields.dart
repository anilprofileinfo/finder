import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/signup/presentation/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupInputFields extends StatelessWidget {
  const SignupInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, data, _) {
      return Column(
        children: [
          //UserName
          Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              controller: data.userNameController,
              decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  fillColor: AppColors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.person_outline_rounded)),
            ),
          ),
          const SizedBox(height: 16),
          //Email
          Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              controller: data.emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: AppColors.white,
                filled: true,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),
          ),
          const SizedBox(height: 16),
          //Password
          Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              controller: data.passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: AppColors.white,
                filled: true,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 16),
          //Confirm Password
          Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: AppColors.white,
                filled: true,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
              ),
              obscureText: true,
            ),
          ),
        ],
      );
    });
  }
}
