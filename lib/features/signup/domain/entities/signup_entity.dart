import 'package:equatable/equatable.dart';
import 'package:finder/features/signup/domain/entities/data_entity.dart';

class SignupEntity extends Equatable {
  final int code;
  final String message;
  final DataEntity? data;

  const SignupEntity({required this.code, required this.message, this.data});

  @override
  List<Object?> get props => [code, message, data];
}
