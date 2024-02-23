import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/core/network/api_client.dart';
import 'package:finder/core/network/api_endpoint.dart';
import 'package:finder/core/network/response_handler.dart';
import 'package:finder/features/login/data/models/login_model.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

abstract class LoginRemoteDataSource {
  Future<Either<BaseException, LoginEntity>> login(String userName,String password);
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<Either<BaseException, LoginEntity>> login(String userName, String password) async {
    debugPrint('login $userName , $password');
    var loginResponse = await ApiClient().login(ApiEndPoint.loginEndPoint, userName, password);
    debugPrint('LoginResponse ${loginResponse.body}');
    var response = responseHandler(loginResponse);
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(LoginModel.fromJson(jsonDecode(r.body)));
    });

  }

}
