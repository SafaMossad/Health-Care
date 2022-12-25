import '../../../domain/entities/doctors/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.name,
    required super.specialist,
    required super.country,
    required super.avaliableFrom,
    required super.avaliableTo,
    required super.isAvaliable,
    required super.price,
    required super.bio,
    required super.address,
    required super.imageUrl,
    required super.rate,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 1,
      name: json['name'] ?? "",
      specialist: json['specialist'] ?? "",
      isAvaliable: json['isAvaliable'] ?? false,
      country: json['country'] ?? 0,
      avaliableFrom: json['avaliableFrom'] ?? 12,
      avaliableTo: json['avaliableTo'] ?? 12,
      price: json['price'] ?? 0,
      address: json['address'] ?? "",
      bio: json['bio'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      rate: json['rate'].toDouble() ?? 0.0,
    );
  }
}
