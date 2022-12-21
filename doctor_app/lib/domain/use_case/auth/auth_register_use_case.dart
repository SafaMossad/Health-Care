import 'package:flutter/material.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';
import '../../repository/auth/auth_repository.dart';

class RegisterUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);

  Future<ResponseModel> call({
    required context,
    required String fName,
    required String lName,
    required String email,
    required String? phone,
    required String? password,
    required int? gender,
    required int? age,
    required String? specialist,
    required String? specialistDescription,
    required String? country,
    required String? address,
    required String? availableFrom,
    required String? availableTo,
    required String? price,
  }) async {
    ApiResponse apiResponse = await baseAuthRepository.authRegister(
      fName: fName,
      lName: lName,
      email: email,
      phone: phone,
      password: password,
      gender: gender,
      age: age,
      specialist: specialist,
      specialistDescription: specialistDescription,
      country: country,
      address: address,
      availableFrom: availableFrom,
      availableTo: availableTo,
      price: price,
    );
    ResponseModel? responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {

      /*     AuthModel? model;
        model = AuthModel.fromJson(baseModel.data);*/
      responseModel =
          ResponseModel(true, 'successful', data: apiResponse.response!.data);
    } else {
    /*  ErrorResponse baseModel =
          ErrorResponse.fromJson(apiResponse.response!.data);
      final message = baseModel.message;*/
      responseModel = ApiChecker.checkApi(context, message: "Some Thing Went Wrong");
    }
    return responseModel;
  }
}
