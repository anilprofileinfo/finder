
import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/core/utils/usecase.dart';
import 'package:finder/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:finder/features/signup/domain/entities/signup_entity.dart';
import 'package:finder/features/signup/domain/repositories/signup_repository.dart';

class SignupUseCases extends UseCase<SignupEntity,SignupParams>{
  final SignupRepository signupRepository = SignupRepositoryImpl();

  @override
  Future<Either<BaseException, SignupEntity>> call(SignupParams params) async {
    return await signupRepository.signupUser(params.userName,params.email, params.password);
  }

}

class SignupParams {
  final String userName;
  final String email;
  final String password;

  SignupParams(
      {required this.userName, required this.email, required this.password});
}