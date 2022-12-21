import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/domain/use_case/local/save_user_id.dart';
import '../../../../../data/models/base/response_model.dart';
import '../../../../../domain/use_case/local/save_data_usecase.dart';
import '../../../../domain/use_case/auth/auth_register_use_case.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterUseCase _signInUseCase;
  final SaveTokenDataUseCase _saveUserTokenUseCase;
  final SaveUserIdUseCase _saveUserIdUseCase;

  RegisterViewModel({
    required RegisterUseCase signInUseCase,
    required SaveTokenDataUseCase saveTokenDataUseCase,
    required SaveUserIdUseCase saveUserIdUseCase,
  })  : _signInUseCase = signInUseCase,
        _saveUserTokenUseCase = saveTokenDataUseCase,
        _saveUserIdUseCase = saveUserIdUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> register({
    required BuildContext context,
    required String fName,
    required String lName,
    required String email,
    required String? phone,
    required String? password,
    required int? gender,
    required int? age,
  }) async {
    _isLoading = true;
    notifyListeners();

    final responseModel = await _signInUseCase.call(
      context: context,
      fName: fName,
      lName: lName,
      email: email,
      phone: phone,
      password: password,
      gender: gender,
      age: age,
    );

    if (responseModel.isSuccess) {
      String? token = responseModel.data!["token"];
      int userId = responseModel.data!["userId"];

      _saveUserTokenUseCase.call(token: token!);
      _saveUserIdUseCase.call(userId: userId);
    } else {
      print("Fail view Model ${responseModel.message}");
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
