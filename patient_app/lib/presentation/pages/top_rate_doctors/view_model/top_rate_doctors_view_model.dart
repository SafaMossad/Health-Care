import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import '../../../../../../../data/models/base/response_model.dart';
import '../../../../domain/use_case/doctor/top_doctor_use_case.dart';

class TopRateDoctorsViewModel extends ChangeNotifier {
  final TopDoctorsUseCase _doctorsUseCase;

  TopRateDoctorsViewModel({
    required TopDoctorsUseCase doctorsUseCase,
  }) : _doctorsUseCase = doctorsUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DoctorModel>? _doctorsList;

  List<DoctorModel>? get doctorsList {
    return _doctorsList;
  }

  Future<ResponseModel> getTopDoctors({required BuildContext context}) async {
    _isLoading = true;
    //notifyListeners();

    final responseModel = await _doctorsUseCase.call(context: context);

    if (responseModel.isSuccess) {
      List<DoctorModel>? data = responseModel.data;
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
