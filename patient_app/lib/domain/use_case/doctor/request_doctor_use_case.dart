import 'package:flutter/material.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/domain/repository/doctor/doctor_repository.dart';
import 'package:patient_app/domain/repository/reservation/reservation_repository.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';

class RequestDoctorsUseCase {
  final BaseReservationRepository baseDoctorRepository;

  RequestDoctorsUseCase(this.baseDoctorRepository);

  Future<ResponseModel> call({
    required  context,
    required  int? doctorId,
  }) async {
    ApiResponse apiResponse = await baseDoctorRepository.requestDoctors(doctorId);

    ResponseModel responseModel;

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

        responseModel = ResponseModel<List<DoctorModel>>(true, 'successful',);
        print("faculties ");

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
