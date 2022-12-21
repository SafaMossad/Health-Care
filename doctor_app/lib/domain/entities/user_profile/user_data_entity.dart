import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final int? id;
  final String? userName;
  final int? age;

  final String? phone;
  final String? email;

  const UserDataEntity({
    required this.id,
    required this.userName,
    required this.age,
    required this.phone,
    required this.email,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    userName,
    age,
    phone,
    email,
  ];
}


