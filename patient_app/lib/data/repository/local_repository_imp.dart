import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:patient_app/data/models/user_data_model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/shared_preferences_keys.dart';
import '../../domain/repository/local_repo.dart';
import '../../main.dart';
import '../data_sources/remote/dio/dio_client.dart';
import '../models/user_model.dart';

// @Injectable(as: LocalRepository)
class LocalRepositoryImp implements LocalRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  LocalRepositoryImp(
      {required this.sharedPreferences, required this.dioClient});

  @override
  Future<String?> saveDeviceToken() async {
    return null;

    // String? _deviceToken = await FirebaseMessaging.instance.getToken();
    // if (_deviceToken != null) {
    //   print('--------Device Token---------- '+_deviceToken);
    // }
    // return _deviceToken;
  }

  @override
  String getUserToken() {
    return sharedPreferences!.getString(SharedPreferencesKeys.kToken) ?? "";
  }

  @override
  bool isLoggedIn() {
    // print('--------User Token---------- ' + getUserToken());
    return sharedPreferences!.containsKey(SharedPreferencesKeys.kToken);
  }

  @override
  Future<bool> clearSharedData() async {
    dioClient!.token = '';
    dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'Content-Language': appContext?.locale.languageCode ?? 'ar',
      'Authorization': ''
    };
    return await sharedPreferences!.clear();
  }

  // for  user token
  @override
  Future<bool> saveUserToken(String token) async {
    dioClient!.token = token;
    dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'Content-Language': appContext?.locale.languageCode ?? 'ar',
      'Authorization': 'Bearer $token'
    };
    try {
      return await sharedPreferences!
          .setString(SharedPreferencesKeys.kToken, token);
    } catch (e) {
      return false;
    }
  }

  @override
  UserModel? getUserData() {
    String? user =
        sharedPreferences!.getString(SharedPreferencesKeys.kUserData);
    return user != null ? UserModel.fromJson(jsonDecode(user)) : null;
  }

  @override
  Future<bool> saveUserData(AuthModel userModel) {
    String user = jsonEncode(userModel.toJson());

    return sharedPreferences!.setString(SharedPreferencesKeys.kUserData, user);
  }

  @override
  Future<bool> saveUserId(int id) async {
    try {
      return await sharedPreferences!.setInt(SharedPreferencesKeys.kUId, id);
    } catch (e) {
      return false;
    }
  }
}
