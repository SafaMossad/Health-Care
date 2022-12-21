import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/domain/entities/reservations/reservations_entity.dart';

import '../../../domain/entities/doctors/doctor_entity.dart';

class ReservationsModel extends ReservationsEntity {
  const ReservationsModel({
    required super.reservationId,
    required super.doctor,
    required super.reservationStatus,
  });

  factory ReservationsModel.fromJson(Map<String, dynamic> json) {
    return ReservationsModel(
      doctor: DoctorModel.fromJson(json['doctor']),
      reservationId: json['reservationId'],
      reservationStatus: json['reservationStatus'] ?? "",
    );
  }
}
