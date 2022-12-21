import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/data/models/auth_model/user_data_model.dart';
import 'package:patient_app/domain/use_case/profile/profile_use_case.dart';
import '../../../../../../../data/models/base/response_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileUseCase _profileUseCase;

  ProfileViewModel({
    required ProfileUseCase profileUseCase,
  }) : _profileUseCase = profileUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UserDataModel? _doctorsList;

  UserDataModel? get doctorsList {
    return _doctorsList;
  }

  Future<ResponseModel> getHomeDoctors({required BuildContext context}) async {
    _isLoading = true;
    //notifyListeners();

    final responseModel = await _profileUseCase.call(context: context);

    if (responseModel!.isSuccess) {
      UserDataModel? data = responseModel.data;
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
