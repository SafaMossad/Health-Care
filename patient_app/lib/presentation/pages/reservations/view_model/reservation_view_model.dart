import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/data/models/reservations/reservations_model.dart';
import 'package:patient_app/domain/use_case/reservations/resservations_use_case.dart';
import '../../../../../../../data/models/base/response_model.dart';

class ReservationsViewModel extends ChangeNotifier {
  final ReservationsUseCase _reservationsUseCase;

  ReservationsViewModel({
    required ReservationsUseCase reservationsUseCase,
  }) : _reservationsUseCase = reservationsUseCase;

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
}
