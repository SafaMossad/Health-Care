import 'package:flutter/material.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base/api_response.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/base/error_response.dart';
import '../../../data/models/base/response_model.dart';
import '../../repository/auth/auth_repository.dart';

class AuthLoginUseCase {
  final BaseAuthRepository baseAuthRepository;

  AuthLoginUseCase(this.baseAuthRepository);

  Future<ResponseModel> call({
    required  context,
    required String? email,
    required String? password,

  }) async {
    ApiResponse apiResponse = await baseAuthRepository.authLogin(
      email: email,
      password: password,

    );
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {

        print(apiResponse.response!.data.toString());
    /*    AuthModel? model;
        model = AuthModel.fromJson(baseModel.data);*/

        responseModel = ResponseModel(true, 'successful',data: apiResponse.response!.data);
        
    } else {
      ErrorResponse baseModel =
          ErrorResponse.fromJson(apiResponse.response!.data);

      final message = baseModel.message;
      responseModel = ApiChecker.checkApi(context, message: message);
    }
    return responseModel;
  }
}
