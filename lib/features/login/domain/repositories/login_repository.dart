import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository{
  Future<Either<BaseException, LoginEntity>> loginUser(String userName, String password);
}