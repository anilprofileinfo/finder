
import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/features/signup/data/datasources/signup_remote_datasource.dart';
import 'package:finder/features/signup/domain/entities/signup_entity.dart';
import 'package:finder/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl extends SignupRepository{
  final SignupRemoteDataSource signupRemoteDataSource = SignupRemoteDataSourceImpl();

  @override
  Future<Either<BaseException, SignupEntity>> signupUser(String userName, String email, String password) async {
    return signupRemoteDataSource.signup(userName, email, password);
  }

}