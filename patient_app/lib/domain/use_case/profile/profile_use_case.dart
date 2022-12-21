import 'package:flutter/material.dart';
import 'package:patient_app/data/models/auth_model/user_data_model.dart';
import 'package:patient_app/data/models/auth_model/user_data_model.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/domain/repository/doctor/doctor_repository.dart';
import 'package:patient_app/domain/repository/profile/profile_repository.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';

class ProfileUseCase {
  final BaseProfileRepository baseProfileRepository;

  ProfileUseCase(this.baseProfileRepository);

  Future<ResponseModel<UserDataModel>?> call({
    required context,
  }) async {
    ApiResponse apiResponse = await baseProfileRepository.getProfileData();

    ResponseModel<UserDataModel>? responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      print("My data ${apiResponse.response!.data}");

      UserDataModel? userData;
      userData = UserDataModel.fromJson(apiResponse.response!.data);
      responseModel =
          ResponseModel<UserDataModel>(true, 'successful', data: userData);
      print("Doctors $userData");
    } else {
      ErrorResponse baseModel =
          ErrorResponse.fromJson(apiResponse.response!.data);
      final message = baseModel.message;
      print("faculties $message");

      responseModel = ApiChecker.checkApi(context, message: message);
    }
    return responseModel;
  }
}
