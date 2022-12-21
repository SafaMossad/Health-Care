import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../../data/models/base/response_model.dart';
import '../../../../domain/use_case/doctor/request_doctor_use_case.dart';

class RequestDoctorsViewModel extends ChangeNotifier {
  final RequestDoctorsUseCase _requestUseCase;

  RequestDoctorsViewModel({
    required RequestDoctorsUseCase requestDoctorUseCase,
  }) : _requestUseCase = requestDoctorUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  Future<ResponseModel> requestDoctors(
      {required BuildContext context, required int? doctorId}) async {
    _isLoading = true;
    //notifyListeners();

    final responseModel =
        await _requestUseCase.call(context: context, doctorId: doctorId);

    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
