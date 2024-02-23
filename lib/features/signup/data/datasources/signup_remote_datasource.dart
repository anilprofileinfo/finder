import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/core/network/api_client.dart';
import 'package:finder/core/network/api_endpoint.dart';
import 'package:finder/core/network/response_handler.dart';
import 'package:finder/features/signup/data/models/signup_model.dart';
import 'package:finder/features/signup/domain/entities/signup_entity.dart';
import 'package:flutter/material.dart';

abstract class SignupRemoteDataSource {
  Future<Either<BaseException, SignupEntity>> signup(
      String userName, String email, String password);
}

class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  @override
  Future<Either<BaseException, SignupEntity>> signup(
      String userName, String email, String password) async {
    var signupResponse = await ApiClient()
        .signup(ApiEndPoint.registerEndPoint, userName, email, password);
    var response = responseHandler(signupResponse);
    debugPrint('Response ${signupResponse.body}');
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(SignupModel.fromJson(jsonDecode(r.body)));
    });
  }
}
