import 'package:flutter/material.dart';

import '../../data/models/base/api_response.dart';
import '../../data/models/base/error_response.dart';
import '../../data/models/base/response_model.dart';
import '../../presentation/component/custom_widgets/custom_snack_bar.dart';
import 'error_widget.dart';

class ApiChecker {
  static ResponseModel<T> checkApi<T>(BuildContext context,
      {ApiResponse? apiResponse, String? message}) {
    if (apiResponse != null) {
      if (apiResponse.error is ErrorResponse) {
        ErrorResponse error = apiResponse.error;
        showCustomSnackBar(message: error.message ?? 'Error', context: context);
        return ResponseModel<T>(false, error.message);
      }/* else if (apiResponse.error is ErrorResponse) {
        return _handleErrorErrorModel(context, apiResponse.error as ErrorResponse);
      }*/ else if (apiResponse.error is String) {
        if (apiResponse.error == 'Unauthorized') {
          _unauthorizedUser(context);
        }
        showCustomSnackBar(
            message: apiResponse.error ?? 'Error', context: context);
        return ResponseModel<T>(false, apiResponse.error);
      } else {
        return ResponseModel<T>(false, 'Error');
      }
    } else if (message != null) {
      showCustomSnackBar(message: message, context: context);
      return ResponseModel<T>(false, message);
    } else {
      return ResponseModel<T>(false, 'Error');
    }
  }

/*  static ResponseModel<T> _handleErrorErrorModel<T>(
      BuildContext context, ErrorResponse error) {
    if (error.code == ErrorEnum.auth) {
      _unauthorizedUser(context);
    }
    return ResponseModel<T>(false, error.errorMessage, error: error);
  }*/

  static _unauthorizedUser(BuildContext context) {
/*    Provider.of<LocalAuthProvider>(context, listen: false)
        .logOut()
        .then((isCleared) {
      if (isCleared) {
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteHelper.getLoginScreenRoute(), (route) => false);
      }
    });*/
  }
}
