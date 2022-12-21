import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final int? id;
  final String? name;
  final String? specialist;
  final int? country;
  final int? avaliableFrom;
  final int? avaliableTo;
  final bool? isAvaliable;
  final int? price;
  final String? bio;
  final String? address;

  const DoctorEntity({
    required this.id,
    required this.name,
    required this.specialist,
    required this.country,
    required this.avaliableFrom,
    required this.avaliableTo,
    required this.isAvaliable,
    required this.price,
    required this.bio,
    required this.address,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    specialist,
    country,
    avaliableFrom,
    avaliableTo,
    isAvaliable,
    price,
    bio,
    address,
  ];
}


