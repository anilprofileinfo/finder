
import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/core/utils/usecase.dart';
import 'package:finder/features/login/data/repositories/login_repository_impl.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';
import 'package:finder/features/login/domain/repositories/login_repository.dart';

class LoginUseCases extends UseCase<LoginEntity,LoginParams>{
  final LoginRepository loginRepository = LoginRepositoryImpl();
  @override
  Future<Either<BaseException, LoginEntity>> call(LoginParams params) async {
    return await loginRepository.loginUser(params.userName, params.password);
  }
}

class LoginParams{
  final String userName;
  final String password;

  LoginParams({required this.userName,required this.password});
}