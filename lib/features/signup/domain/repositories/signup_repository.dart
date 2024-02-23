import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/features/signup/domain/entities/signup_entity.dart';

abstract class SignupRepository{
  Future<Either<BaseException, SignupEntity>> signupUser(String userName, String email, String password);
}