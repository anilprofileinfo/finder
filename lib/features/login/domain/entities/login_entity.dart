import 'package:equatable/equatable.dart';
import 'package:finder/features/login/domain/entities/data_entity.dart';

class LoginEntity extends Equatable {
  final int code;
  final String message;
  final DataEntity? data;

  const LoginEntity({required this.code, required this.message, this.data});

  @override
  List<Object?> get props => [code, message, data];
}
