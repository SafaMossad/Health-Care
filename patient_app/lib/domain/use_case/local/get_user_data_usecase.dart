
import '../../../data/models/base/response_model.dart';
import '../../../data/models/user_model.dart';
import '../../logger.dart';
import '../../repository/local_repo.dart';

class GetUserDataUseCase {
  final _tag = 'GetUserDataUseCase';
  final LocalRepository repository;

  GetUserDataUseCase({required this.repository});

  Future<ResponseModel> call() async {
    UserModel? userModel =  repository.getUserData();

    if (userModel != null ) {
      log(_tag, userModel.toString());
      return ResponseModel(true, 'successful',data: userModel);
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
