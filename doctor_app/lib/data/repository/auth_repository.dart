import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/network_path.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../domain/repository/auth/auth_repository.dart';
import '../data_sources/remote/dio/dio_client.dart';
import '../models/base/api_response.dart';

class AuthRepository implements BaseAuthRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  AuthRepository({required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> authLogin(
      {required String? email, required String? password}) async {
    try {
      final response = await dioClient!.post(
        "http://healthcareprod-001-site1.atempurl.com/api/v1/Authentications/Doctor/sign-In",
        queryParameters: {
          'Email': email,
          'Password': password,
        },
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
  Future<ApiResponse> authRegister({
    required String fName,
    required String lName,
    required String email,
    required String? phone,
    required String? password,
    required int? gender,
    required int? age,
    required String? specialist,
    required String? specialistDescription,
    required String? country,
    required String? address,
    required String? availableFrom,
    required String? availableTo,
    required String? price,
  }) async {
    try {
      final response = await dioClient!.post(
        "${NetworkPath.hostName}/api/v1/Doctors",
        queryParameters: {
          'firstName': fName,
          'lastName': lName,
          'phone': phone,
          'email': email,
          'password': password,
          'confirmationPassword': password,
          'specialist': specialist,
          'specialistDescription': specialistDescription,
          'country': 0,
          'address': address,
          'avaliableFrom': int.parse(availableFrom!),
          'avaliableTo':int.parse( availableTo!),
          'price': int.parse(price!),
          'gander': gender,
        },
      );

      print("response ${response.data}");
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
