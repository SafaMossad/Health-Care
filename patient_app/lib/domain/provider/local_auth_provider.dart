import 'package:flutter/material.dart';


import '../../data/models/base/response_model.dart';
import '../../data/models/user_model.dart';
import '../use_case/use_case.dart';


class LocalAuthProvider with ChangeNotifier {
  bool _isLogin = false;

  //TODO remove this value
  UserModel? _user = const UserModel();
  final GetIsUserLoginUseCase getIsUserLoginUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;


  LocalAuthProvider(
      {required this.getIsUserLoginUseCase,
      required this.getUserDataUseCase,
      required this.clearUserDataUseCase,
});

  UserModel? get user => _user;

  ResponseModel? get userData => _userData;

  ResponseModel? _userData;

  bool get isAuth => _isLogin;

  Future<bool> isLogin() async {
    ResponseModel responseModel = await getIsUserLoginUseCase.call();
    if (responseModel.isSuccess) {
      _isLogin = true;
      await getUserData();
    } else {}
    return responseModel.isSuccess;
  }

  Future<bool> logOut() async {
    ResponseModel responseModel = await clearUserDataUseCase.call();
    if (responseModel.isSuccess) {
      _isLogin = false;
      _user = null;
    }

    return responseModel.isSuccess;
  }

  Future<bool> getUserData() async {
    ResponseModel responseModel = await getUserDataUseCase.call();
    if (responseModel.isSuccess) {
      _user = responseModel.data;
    }
    return responseModel.isSuccess;
  }

}
