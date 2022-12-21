import 'package:dio/dio.dart';
import 'package:patient_app/domain/repository/doctor/doctor_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/network_path.dart';
import '../../core/constants/shared_preferences_keys.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../domain/repository/auth/auth_repository.dart';
import '../../domain/repository/profile/profile_repository.dart';
import '../data_sources/remote/dio/dio_client.dart';
import '../models/base/api_response.dart';

class ProfileRepository implements BaseProfileRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  ProfileRepository({required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> getProfileData() async {
    try {
      final response = await dioClient!.get(
        "${NetworkPath.hostName}/api/v1/Users/${sharedPreferences!.getInt(SharedPreferencesKeys.kUId)}",
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
