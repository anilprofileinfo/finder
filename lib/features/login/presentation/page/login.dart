import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/widgets/clipper_widget.dart';
import 'package:finder/features/login/presentation/provider/login_provider.dart';
import 'package:finder/features/login/presentation/widgets/login_forgot_password_link.dart';
import 'package:finder/features/login/presentation/widgets/login_input_fields.dart';
import 'package:finder/features/login/presentation/widgets/login_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        builder: (context, child) {
          return Consumer<LoginProvider>(builder: (context, data, _) {
            return Scaffold(
              backgroundColor: AppColors.white.withOpacity(0.99),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const ClipperWidget(),
                    Container(
                      margin: const EdgeInsets.all(24),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          //Login Fields
                          LoginInputFields(),
                          SizedBox(
                            height: 12,
                          ),
                          //Forgot Password Link
                          LoginForgotPasswordLink(),
                          SizedBox(
                            height: 24,
                          ),
                          //SignUp Button
                          LoginSignupButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
