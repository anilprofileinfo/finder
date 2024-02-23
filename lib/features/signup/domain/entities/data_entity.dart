import 'package:equatable/equatable.dart';

class DataEntity extends Equatable {
  final int Id;
  final String Name;
  final String Email;
  final String Token;

  const DataEntity({
    required this.Id,
    required this.Name,
    required this.Email,
    required this.Token,
  });

  @override
  List<Object?> get props => [Id, Name, Email, Token];
}
