import 'package:dio/dio.dart';
import 'package:patient_app/core/constants/shared_preferences_keys.dart';
import 'package:patient_app/domain/repository/doctor/doctor_repository.dart';
import 'package:patient_app/domain/repository/reservation/reservation_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/network_path.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../domain/repository/auth/auth_repository.dart';
import '../data_sources/remote/dio/dio_client.dart';
import '../models/base/api_response.dart';

class ReservationRepository implements BaseReservationRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  ReservationRepository({required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> getReservations() async {
    try {

      final response = await dioClient!.get(
        "${NetworkPath.hostName}/api/v1/Reservations/user/${sharedPreferences!.getInt(SharedPreferencesKeys.kUId)}",
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
  Future<ApiResponse> requestDoctors(int? doctorId) async {
    try {
      final queryData = {"doctorId": doctorId, "userId": sharedPreferences!.getInt(SharedPreferencesKeys.kUId)};
      final response = await dioClient!.post(
        queryParameters: queryData,
        "${NetworkPath.hostName}/api/v1/Reservations",
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
