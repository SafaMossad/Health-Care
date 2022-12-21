import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../../../data/models/base/response_model.dart';
import '../../../../data/models/reservations/reservations_model.dart';
import '../../../../domain/use_case/doctor/request_doctor_use_case.dart';
import '../../../../domain/use_case/reservations/resservations_use_case.dart';

class ReservationsViewModel extends ChangeNotifier {
  final ReservationsUseCase _reservationsUseCase;
  final UpdateRequestReservationUseCase _requestReservationsUseCase;

  ReservationsViewModel({
    required ReservationsUseCase reservationsUseCase,
    required UpdateRequestReservationUseCase requestReservationsUseCase,
  })  : _reservationsUseCase = reservationsUseCase,
        _requestReservationsUseCase = requestReservationsUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ReservationsModel>? _doctorsList;

  List<ReservationsModel>? get reservationList {
    return _doctorsList;
  }

  Future<ResponseModel> getReservations({required BuildContext context}) async {
    _isLoading = true;
    //notifyListeners();

    final responseModel = await _reservationsUseCase.call(context: context);

    if (responseModel.isSuccess) {
      List<ReservationsModel>? data = responseModel.data;
      _doctorsList = data;
      print(_doctorsList);
    } else {
      print("Fail view Model ${responseModel.message}");
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> updateReservations(
      {required BuildContext context,
      required int? reservationId,
      required int? reservationStatus}) async {
    _isLoading = true;
    //notifyListeners();

    final responseModel = await _requestReservationsUseCase.call(
      context: context,
      reservationId: reservationId,
      reservationStatus: reservationStatus,
    );

    if (responseModel.isSuccess) {

      print(responseModel.data);
    } else {
      print("Fail view Model ${responseModel.message}");
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
