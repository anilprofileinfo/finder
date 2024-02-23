import 'package:finder/features/signup/domain/entities/data_entity.dart';

class DataModel extends DataEntity {
  const DataModel(
      {required super.Id,
      required super.Name,
      required super.Email,
      required super.Token});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        Id: json['Id'] ?? '',
        Name: json['Name'] ?? '',
        Email: json['Email'] ?? '',
        Token: json['Token'] ?? '',
      );
}
