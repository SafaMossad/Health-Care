
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? university;
  final String? faculty;
  final String? year;
  final String? roles;
  final String? token;
  final String? avatar;

  const UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.university,
      required this.faculty,
      required this.year,
      required this.roles,
      required this.avatar,
      required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        university,
        faculty,
        roles,
        year,
        token,
        avatar,
      ];
}

class UserModel extends UserEntity {
  const UserModel(
      {super.id,
      super.name,
      super.email,
      super.phone,
      super.university,
      super.faculty,
      super.year,
      super.roles,
      super.avatar,
      super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'].toString(),
        year: json['year'].toString(),
        roles: json['roles'].toString(),
        avatar: json['avatar'].toString(),
        token: json['token']);
  }
}
