import '../../../core/exceptions/exceptions.dart';
import '../../../core/model/user_model.dart';
import '../repository/user_repository.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase({required this.repository});

  UserModel? _user;
  UserModel? get user => _user;
  setUser(UserModel? user) {
    _user = user;
  }

  Future<Result<bool, ErrorModel>> createUser({required UserModel user}) async {
    return repository.createUser(user: user);
  }

  Future<Result<UserModel?, ErrorModel>> getUser({
    required String userId,
  }) async {
    return repository.getUser(userId: userId);
  }
}
