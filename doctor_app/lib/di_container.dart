import 'package:dio/dio.dart';
import 'package:doctor_app/core/constants/network_path.dart';
import 'package:doctor_app/data/data_sources/remote/dio/logging_interceptor.dart';
import 'package:doctor_app/data/repository/auth_repository.dart';
import 'package:doctor_app/data/repository/doctor_repository.dart';
import 'package:doctor_app/data/repository/profile_repository.dart';
import 'package:doctor_app/data/repository/reservations_repository.dart';
import 'package:doctor_app/domain/repository/auth/auth_repository.dart';
import 'package:doctor_app/domain/repository/doctor/doctor_repository.dart';
import 'package:doctor_app/domain/repository/local_repo.dart';
import 'package:doctor_app/domain/repository/profile/profile_repository.dart';
import 'package:doctor_app/domain/repository/reservation/reservation_repository.dart';
import 'package:doctor_app/domain/use_case/auth/auth_login_use_case.dart';
import 'package:doctor_app/domain/use_case/auth/auth_register_use_case.dart';
import 'package:doctor_app/domain/use_case/doctor/doctor_use_case.dart';
import 'package:doctor_app/domain/use_case/doctor/request_doctor_use_case.dart';
import 'package:doctor_app/domain/use_case/local/save_user_id.dart';
import 'package:doctor_app/domain/use_case/reservations/resservations_use_case.dart';
import 'package:doctor_app/presentation/pages/auth/view_model/auth_login_view_model.dart';
import 'package:doctor_app/presentation/pages/auth/view_model/auth_register_view_model.dart';
import 'package:doctor_app/presentation/pages/reservations/view_model/reservation_view_model.dart';
import 'package:get_it/get_it.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_sources/remote/dio/dio_client.dart';
import 'data/repository/local_repository_imp.dart';
import 'domain/provider/local_auth_provider.dart';
import 'domain/use_case/profile/profile_use_case.dart';
import 'domain/use_case/use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  ///CORE
  sl.registerLazySingleton(() => DioClient(NetworkPath.hostName, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  ///local
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImp(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => SaveTokenDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveUserDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearUserDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetIsUserLoginUseCase(repository: sl()));

  ///Use Case
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => DoctorsUseCase(sl()));
  sl.registerLazySingleton(() => SaveUserIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthLoginUseCase(sl()));
  sl.registerLazySingleton(() => UpdateRequestReservationUseCase(sl()));
  sl.registerLazySingleton(() => ReservationsUseCase(sl()));
  sl.registerLazySingleton(() => ProfileUseCase(sl()));

  ///View Model
  sl.registerLazySingleton(() => RegisterViewModel(
      saveTokenDataUseCase: sl(),
      saveUserIdUseCase: sl(),
      signInUseCase: sl()));

  sl.registerLazySingleton(
      () => ReservationsViewModel(reservationsUseCase: sl(), requestReservationsUseCase: sl()));
  sl.registerLazySingleton(() => LoginViewModel(
      saveTokenDataUseCase: sl(),
      saveUserIdUseCase: sl(),
      signInUseCase: sl()));

  ///providers
  sl.registerLazySingleton(
    () => LocalAuthProvider(
      getIsUserLoginUseCase: sl(),
      getUserDataUseCase: sl(),
      clearUserDataUseCase: sl(),
    ),
  );

  ///Repository
  sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(dioClient: sl(), sharedPreferences: sl()));

   sl.registerLazySingleton<BaseProfileRepository>(
      () => ProfileRepository(dioClient: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton<BaseReservationRepository>(
      () => ReservationRepository(dioClient: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton<BaseDoctorRepository>(
      () => DoctorRepository(dioClient: sl(), sharedPreferences: sl()));
}
