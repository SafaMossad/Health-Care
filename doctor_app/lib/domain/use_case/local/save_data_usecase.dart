
import '../../../data/models/base/response_model.dart';
import '../../logger.dart';
import '../../repository/local_repo.dart';

class SaveTokenDataUseCase {
  final _tag = 'SaveUserDataUseCase';
  final LocalRepository repository;

  SaveTokenDataUseCase({required this.repository});

  Future<ResponseModel> call({
    required String token,
    // required UserModel userModel,
  }) async {
    log(_tag, 'save token = $token }' );
    bool isSaveToken = await repository.saveUserToken(token);
    // bool isSaveUser = await repository.saveUserData(userModel);

    if (isSaveToken ) {
      log(_tag, 'save data successful');
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
