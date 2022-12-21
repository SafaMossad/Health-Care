import '../../../domain/entities/doctors/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel(
      {required super.id,
      required super.name,
      required super.specialist,
      required super.country,
      required super.avaliableFrom,
      required super.avaliableTo,
      required super.isAvaliable,
      required super.price,
      required super.bio,
      required super.address});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      specialist: json['specialist'] ?? "",
      country: json['country'] ?? 0,
      avaliableFrom: json['avaliableFrom'] ?? 12,
      avaliableTo: json['avaliableTo'] ?? 12,
      isAvaliable: json['isAvaliable'] ?? false,
      price: json['price'] ?? 0,
      address: json['address'] ?? "",
      bio: json['bio'] ?? "",
    );
  }
}
