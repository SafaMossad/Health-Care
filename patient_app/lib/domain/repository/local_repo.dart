

import 'package:patient_app/data/models/user_data_model/auth_model.dart';

import '../../data/models/auth_model/user_data_model.dart';
import '../../data/models/user_model.dart';

abstract class LocalRepository {


  Future<bool> saveUserToken(String token);
  Future<bool> saveUserId(int id);

  Future<String?> saveDeviceToken();

  String getUserToken();
  UserModel? getUserData();
  Future<bool> saveUserData(AuthModel userModel);

  bool isLoggedIn();

  Future<bool> clearSharedData();

}
