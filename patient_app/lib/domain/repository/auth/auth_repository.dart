import '../../../data/models/base/api_response.dart';

mixin BaseAuthRepository {

  Future<ApiResponse> authLogin({
    required String? email,
    required String? password,
  });

  Future<ApiResponse> authRegister({
    required String fName,
    required String lName,
    required String email,
    required String? phone,
    required String?  password,
    required int? gender,
    required int? age,

  });

}
