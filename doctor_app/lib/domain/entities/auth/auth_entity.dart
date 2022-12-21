import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? university;
  final String? faculty;
  final String? year;
  final String? token;
  final String? roles;
  final String? avatar;
  final String? bio;

  const AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.faculty,
    required this.year,
    required this.roles,
    required this.token,
    required this.avatar,
    required this.bio,
  });

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
        bio,
      ];
}
