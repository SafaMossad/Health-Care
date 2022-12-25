import 'package:flutter/material.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/domain/repository/doctor/doctor_repository.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';

class TopDoctorsUseCase {
  final BaseDoctorRepository baseDoctorRepository;

  TopDoctorsUseCase(this.baseDoctorRepository);

  Future<ResponseModel<List<DoctorModel>?>> call({
    required  context,
  }) async {
    ApiResponse apiResponse = await baseDoctorRepository.getTopDoctors();

    ResponseModel<List<DoctorModel>?> responseModel;

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      //BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      print("Doctors $apiResponse.response!.data");

      List<DoctorModel> coursesList = [];
      apiResponse.response!.data.forEach((object) => coursesList.add(DoctorModel.fromJson(object)));
        responseModel = ResponseModel<List<DoctorModel>>(true, 'successful',
            data: coursesList);
        print("Doctors $coursesList");

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
