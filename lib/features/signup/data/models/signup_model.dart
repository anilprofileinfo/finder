import 'package:finder/features/signup/data/models/data_model.dart';
import 'package:finder/features/signup/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({required super.code, required super.message, super.data});

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: DataModel.fromJson(json['data']));
}
