import 'package:doctor_app/data/models/auth_model/user_data_model.dart';
import 'package:doctor_app/data/models/doctors/doctor_model.dart';
import 'package:doctor_app/domain/entities/reservations/reservations_entity.dart';

import '../../../domain/entities/doctors/doctor_entity.dart';

class ReservationsModel extends ReservationsEntity {
  const ReservationsModel({
    required super.reservationId,
    required super.doctor,
    required super.reservationStatus,
    required super.user,
  });

  factory ReservationsModel.fromJson(Map<String, dynamic> json) {
    return ReservationsModel(
      doctor: DoctorModel.fromJson(json['doctor']),
      user: UserDataModel.fromJson(json['user']),
      reservationId: json['reservationId'],
      reservationStatus: json['reservationStatus'] ?? "",
    );
  }
}
