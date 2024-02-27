import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/widgets/clipper_widget.dart';
import 'package:finder/features/signup/presentation/provider/signup_provider.dart';
import 'package:finder/features/signup/presentation/widgets/signup_input_fields.dart';
import 'package:finder/features/signup/presentation/widgets/signup_login_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignupProvider(),
        builder: (context, child) {
          return Consumer<SignupProvider>(builder: (context, data, _) {
            return Scaffold(
              backgroundColor: AppColors.white.withOpacity(0.99),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const ClipperWidget(),
                    Container(
                      margin: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          const Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          //Input Fields
                          const SignupInputFields(),
                          const SizedBox(height: 42),
                          //Signup Button
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  data.signupUser(context, data.getUserName(),
                                      data.getEmail(), data.getPassword());
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    backgroundColor: AppColors.primaryColor,
                                    elevation: 5),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )),
                          const SizedBox(
                            height: 24,
                          ),
                          //Login Navigation Button
                          const SignupLoginButton()
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
