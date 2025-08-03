import '../../../core/exceptions/exceptions.dart';
import '../../../core/model/user_model.dart';

abstract class UserRepository {
  Future<Result<bool, ErrorModel>> createUser({required UserModel user});
  Future<Result<UserModel?, ErrorModel>> getUser({required String userId});
}
