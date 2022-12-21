import '../../../data/models/base/api_response.dart';

mixin BaseProfileRepository {
  Future<ApiResponse> getProfileData();
}
