import '../../../domain/entities/auth/auth_entity.dart';
import '../../../domain/entities/user_profile/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.userName,
    required super.age,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      email: json['email'],
      phone: json['phone'].toString(),
      userName: json['userName'],
      age: json['age'],
    );
  }
}
