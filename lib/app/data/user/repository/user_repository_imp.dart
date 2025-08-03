import '../../../core/exceptions/exceptions.dart';
import '../../../core/model/user_model.dart';
import '../data/user_data_source.dart';
import 'user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImp({required this.dataSource});
  @override
  Future<Result<bool, ErrorModel>> createUser({required UserModel user}) async {
    final result = await dataSource.createUser(user: user);
    return result.when((success) => Success(true), (error) => Error(error));
  }

  @override
  Future<Result<UserModel?, ErrorModel>> getUser({
    required String userId,
  }) async {
    final result = await dataSource.getUser(userId: userId);
    return result.when(
      (success) => Success(UserModel.fromSnapshot(success)),
      (error) => Error(error),
    );
  }
}
