

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';
import '../../../data/models/doctors/doctor_model.dart';
import '../../repository/reservation/reservation_repository.dart';

class UpdateRequestReservationUseCase {
  final BaseReservationRepository baseDoctorRepository;

  UpdateRequestReservationUseCase(this.baseDoctorRepository);

  Future<ResponseModel> call({
    required  context,
    required  int? reservationId,
    required  int? reservationStatus,
  }) async {
    ApiResponse apiResponse = await baseDoctorRepository.updateRequestStatus(reservationId,reservationStatus);

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
