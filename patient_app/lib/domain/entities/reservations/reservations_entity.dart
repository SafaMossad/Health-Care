import 'package:equatable/equatable.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';

class ReservationsEntity extends Equatable {
  final int? reservationId;
  final DoctorModel? doctor;

  final int? reservationStatus;

  const ReservationsEntity({
    required this.reservationId,
    required this.doctor,
    required this.reservationStatus,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        reservationStatus,
        doctor,
        reservationStatus,
      ];
}
