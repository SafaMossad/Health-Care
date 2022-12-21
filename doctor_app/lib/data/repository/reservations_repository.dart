import 'package:dio/dio.dart';
import 'package:doctor_app/core/constants/shared_preferences_keys.dart';
import 'package:doctor_app/domain/repository/reservation/reservation_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/network_path.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../domain/repository/auth/auth_repository.dart';
import '../data_sources/remote/dio/dio_client.dart';
import '../models/base/api_response.dart';

class ReservationRepository implements BaseReservationRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  ReservationRepository(
      {required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> getReservations() async {
    try {
      final response = await dioClient!.get(
        "${NetworkPath.hostName}/api/v1/Reservations/Doctor/${sharedPreferences!.getInt(SharedPreferencesKeys.kUId)}",
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (error) {
      if (error.response == null) {
        return ApiResponse.withError(ApiErrorHandler.getMessage(error));
      }
      return ApiResponse.withSuccess(error.response!);
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse> updateRequestStatus(
      int? reservationId, int? reservationStatus) async {
    try {

      final response = await dioClient!.put(
        "http://healthcareprod-001-site1.atempurl.com/api/v1/Reservations/$reservationId/doctor/${sharedPreferences!.getInt(SharedPreferencesKeys.kUId)}/action?reservationStatus=$reservationStatus",
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (error) {
      if (error.response == null) {
        return ApiResponse.withError(ApiErrorHandler.getMessage(error));
      }
      return ApiResponse.withSuccess(error.response!);
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
