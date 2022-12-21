

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';
import '../../../data/models/doctors/doctor_model.dart';
import '../../repository/doctor/doctor_repository.dart';

class DoctorsUseCase {
  final BaseDoctorRepository baseDoctorRepository;

  DoctorsUseCase(this.baseDoctorRepository);

  Future<ResponseModel<List<DoctorModel>?>> call({
    required  context,
  }) async {
    ApiResponse apiResponse = await baseDoctorRepository.getAllDoctors();

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
