import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/login/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginInputFields extends StatelessWidget {
  const LoginInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, data, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              elevation: 6,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // shadowColor: AppColors.primaryColor,
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
            Material(
              elevation: 6,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // shadowColor: AppColors.primaryColor,
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
            const SizedBox(height: 42),
            ElevatedButton(
              onPressed: () {
                data.loginUser(context, data.getUserName(), data.getPassword());
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.primaryColor,
                  elevation: 5),
              child: const Text(
                "Sign in",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }
}
