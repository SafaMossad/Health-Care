import 'package:equatable/equatable.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';

class ReservationsEntity extends Equatable {
  final int? reservationId;
  final int? id;
  final String? name;
  final String? specialist;
  final bool? isAvaliable;

  final int? reservationStatus;

  const ReservationsEntity({
    required this.reservationId,
    required this.id,
    required this.name,
    required this.specialist,
    required this.isAvaliable,
    required this.reservationStatus,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        reservationStatus,
        id,
        name,
        specialist,
        isAvaliable,
        reservationStatus,
      ];
}
