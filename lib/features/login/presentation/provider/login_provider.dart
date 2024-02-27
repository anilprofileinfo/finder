import 'package:finder/core/utils/app_router.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';
import 'package:finder/features/login/domain/usecases/login_usecases.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  final userNameController = TextEditingController(text: 'finder11@gmail.com');
  final passwordController = TextEditingController(text: 'Anil@123');

  String getUserName(){
    return userNameController.text;
  }

  String getPassword(){
    return passwordController.text;
  }

  final LoginUseCases _loginUseCases = LoginUseCases();

  late LoginEntity _users;

  LoginEntity get users => _users;

  String _token = '';

  String get token => _token;

  Future<void> loginUser(BuildContext context,String userName, String password) async {
    var response = await _loginUseCases
        .call(LoginParams(userName: userName, password: password));
    response.fold((l) {
      debugPrint('Left ${l.message}');
      _token = '';
    }, (r) {
      debugPrint('Right ${r.data!.Token}');
      if (r.data != null) {
        _token = r.data!.Token;
        Navigator.pushNamedAndRemoveUntil(context, dashboardRoute, (route) => false);
      }
    });
    notifyListeners();
  }
}
