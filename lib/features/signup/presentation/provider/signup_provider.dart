
import 'package:finder/features/signup/domain/entities/signup_entity.dart';
import 'package:finder/features/signup/domain/usecases/signup_usecases.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_router.dart';

class SignupProvider extends ChangeNotifier{

  final userNameController = TextEditingController(text: 'Anil');
  final emailController = TextEditingController(text:'finder@gmail.com');
  final passwordController = TextEditingController(text: 'Anil@123');

  String getUserName(){
    return userNameController.text;
  }

  String getEmail(){
    return emailController.text;
  }

  String getPassword(){
    return passwordController.text;
  }

  final SignupUseCases _signupUseCases = SignupUseCases();

  late SignupEntity _signupEntity;

  SignupEntity get signupEntity => _signupEntity;

  Future<void> signupUser(BuildContext context,String userName,String email,String password) async {
    var response = await _signupUseCases.call(SignupParams(userName: userName,email: email, password: password));
    response.fold((l) {
      debugPrint('Left ${l.message}');
    } , (r) {
      debugPrint('Right ${r.data!.Email}');
      if (r.data != null) {
        Navigator.pushNamedAndRemoveUntil(context, dashboardRoute, (route) => false);
      }
    });
    notifyListeners();
  }

}