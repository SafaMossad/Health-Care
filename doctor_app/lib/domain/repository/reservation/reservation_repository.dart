import '../../../data/models/base/api_response.dart';

mixin BaseReservationRepository {
  Future<ApiResponse> getReservations();
  Future<ApiResponse> updateRequestStatus(int? reservationId,int? reservationStatus,);

}
