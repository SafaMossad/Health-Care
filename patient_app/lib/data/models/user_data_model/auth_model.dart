
import '../../../domain/entities/auth/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.university,
      required super.faculty,
      required super.year,
      required super.roles,
      required super.token,
      required super.avatar,
      required super.bio,
      });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'].toString(),
        university: json['university'],
        faculty: json['faculty'],
        roles: json['roles'][0].toString(),
        year: json['year'].toString(),
        token: json['token'],
      avatar: json['avatar'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['university'] = university;
    data['faculty'] = faculty;
    data['year'] = year;
    data['roles'] = roles;
    data['token'] = token;
    data['avatar'] = avatar;
    data['bio'] = bio;
    return data;
  }
}
