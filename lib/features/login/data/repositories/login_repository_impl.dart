
import 'package:dartz/dartz.dart';
import 'package:finder/core/error/app_exceptions.dart';
import 'package:finder/features/login/data/datasources/login_remote_datasource.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';
import 'package:finder/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final LoginRemoteDataSource loginRemoteDataSource = LoginRemoteDataSourceImpl();
  @override
  Future<Either<BaseException, LoginEntity>> loginUser(String userName, String password) async {
    return loginRemoteDataSource.login(userName, password);
  }

}