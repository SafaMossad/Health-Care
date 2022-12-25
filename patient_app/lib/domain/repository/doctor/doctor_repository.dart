import '../../../data/models/base/api_response.dart';

mixin BaseDoctorRepository {
  Future<ApiResponse> getAllDoctors();
  Future<ApiResponse> getTopDoctors();
}
