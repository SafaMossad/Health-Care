import '../../../data/models/base/response_model.dart';
import '../../logger.dart';
import '../../repository/local_repo.dart';

class SaveUserDataUseCase {
  final _tag = 'SaveUserDataUseCase';
  final LocalRepository repository;

  SaveUserDataUseCase({required this.repository});

  Future<ResponseModel> call(/*{
    required AuthModel userModel,
    // required UserModel userModel,
  }*/) async {
    // log(_tag, 'save email = ${userModel.email} }');
    bool isSaveToken =/* await repository.saveUserData(userModel)*/true;
    // bool isSaveUser = await repository.saveUserData(userModel);

    if (isSaveToken) {
      log(_tag, 'save data successful');
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
