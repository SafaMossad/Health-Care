

import 'dart:io';
import 'package:doctor_app/data/data_sources/remote/dio/logging_interceptor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/shared_preferences_keys.dart';
import '../../../../domain/logger.dart';
import '../../../../main.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;

  DioClient(
    this.baseUrl,
    Dio? dioC, {
    required this.loggingInterceptor,
    required this.sharedPreferences,
  }) {
   final  token = sharedPreferences.getString(SharedPreferencesKeys.kToken);
    print("Token From Dio Client=> $token");

    log('Dio', ' ${'Content-Language: '}');

    dio = dioC ?? Dio();
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Accept': 'application/json; charset=UTF-8',
        'Content-Language': appContext?.locale.languageCode ?? 'en',
        'Authorization': 'Bearer $token',
      };
    dio!.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {

     // dio!.options.headers.addAll({'Content-Language': 'en'});

      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Future<Response> postTest(String uri, {
  //   data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     var response = await dio!.post(
  //       uri,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<Response> post(
    String uri, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? filePath,
    List<FileModel>? filesPath,
    List<String>? filePathList,
    String? filePathListName,
    String? fileName,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
     // dio!.options.headers.addAll({'Content-Language': 'en'});

      if (filePath != null) {
        String _fileName = filePath.split('/').last;
        print(fileName);
        Map<String, dynamic> body = {
          fileName ?? "image":
              await MultipartFile.fromFile(filePath, filename: _fileName),
        };
        data = FormData.fromMap(body);
        log('dio', 'files $body');
      }

      if (filePathList != null) {
        for (String path in filePathList) {
          String fileName = path.split('/').last;
          data = FormData.fromMap({
            filePathListName ?? "images[]":
                await MultipartFile.fromFile(path, filename: fileName),
          });
        }
      }

      if (filesPath != null) {
        Map<String, dynamic> body = {};
        for (FileModel file in filesPath) {
          log('dio', 'name ${file.name} path ${file.path}  ');
          if (file.path != null) {
            String fileName = file.path!.split('/').last;
            body.addAll({
              file.name:
                  await MultipartFile.fromFile(file.path!, filename: fileName)
            });
          } else {
            for (String path in file.paths ?? []) {
              String fileName = path.split('/').last;
              data = FormData.fromMap({
                filePathListName ?? "${file.name}[]":
                    await MultipartFile.fromFile(path, filename: fileName),
              });
            }
          }
        }
        log('dio', 'files $body');
        data = FormData.fromMap(body);
      }

      var response = await dio!.post(
        uri,
        data: queryParameters,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (_) {
      return Future.error(_);
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

class FileModel {
  final String name;
  final String? path;
  final List<String>? paths;

  const FileModel({
    required this.name,
    this.path,
    this.paths,
  });
}
