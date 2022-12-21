

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';
import '../../../data/models/reservations/reservations_model.dart';
import '../../repository/reservation/reservation_repository.dart';

class ReservationsUseCase {
  final BaseReservationRepository baseReservationsRepository;

  ReservationsUseCase(this.baseReservationsRepository);

  Future<ResponseModel<List<ReservationsModel>?>> call({
    required context,
  }) async {
    ApiResponse apiResponse =
        await baseReservationsRepository.getReservations();

    ResponseModel<List<ReservationsModel>?> responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      print("Doctors ${apiResponse.response!.data}");

      List<ReservationsModel> coursesList = [];
      apiResponse.response!.data.forEach(
          (object) => coursesList.add(ReservationsModel.fromJson(object)));
      responseModel = ResponseModel<List<ReservationsModel>>(true, 'successful',
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
