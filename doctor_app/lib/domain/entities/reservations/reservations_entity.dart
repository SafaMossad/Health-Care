import 'package:equatable/equatable.dart';

import '../../../data/models/auth_model/user_data_model.dart';
import '../../../data/models/doctors/doctor_model.dart';


class ReservationsEntity extends Equatable {
  final int? reservationId;
  final DoctorModel? doctor;
  final UserDataModel? user;

  final int? reservationStatus;

  const ReservationsEntity({
    required this.reservationId,
    required this.doctor,
    required this.reservationStatus,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        reservationStatus,
        doctor,
        user,
        reservationStatus,
      ];
}
