import 'package:finder/features/login/data/models/data_model.dart';
import 'package:finder/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.code, required super.message, super.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: json['data']!=null ? DataModel.fromJson(json['data']) : null);
}
