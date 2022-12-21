import '../../../data/models/base/response_model.dart';
import '../../logger.dart';
import '../../repository/local_repo.dart';

class SaveUserIdUseCase {
  final _tag = 'SaveUserDataUseCase';
  final LocalRepository repository;

  SaveUserIdUseCase({required this.repository});

  Future<ResponseModel> call({
    required int userId,
    // required UserModel userModel,
  }) async {
    //log(_tag, 'save email = ${userModel.email} }');
    bool isSaveToken = await repository.saveUserId(userId);
    // bool isSaveUser = await repository.saveUserData(userModel);

    if (isSaveToken) {
      log(_tag, 'save Id successful');
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
