import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/domain/entities/reservations/reservations_entity.dart';

import '../../../domain/entities/doctors/doctor_entity.dart';

class ReservationsModel extends ReservationsEntity {
  const ReservationsModel({
    required super.reservationId,
    required super.id,
    required super.name,
    required super.specialist,
    required super.isAvaliable,
    required super.reservationStatus,
  });

  factory ReservationsModel.fromJson(Map<String, dynamic> json) {
    return ReservationsModel(
      id: json['doctor']['id'] ?? 1,
      name: json['doctor']['name'] ?? "",
      specialist: json['doctor']['specialist'] ?? "",
      isAvaliable: json['doctor']['isAvaliable'] ?? false,
      reservationId: json['reservationId'],
      reservationStatus: json['reservationStatus'] ?? "",
    );
  }
}
