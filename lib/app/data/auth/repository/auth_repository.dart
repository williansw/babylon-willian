import '../../../core/exceptions/exceptions.dart';
import '../model/auth_model.dart';

abstract class AuthRepository {
  Future<Result<AuthModel, ErrorModel>> create({
    required String email,
    required String password,
  });
  Future<Result<AuthModel, ErrorModel>> auth({
    required String email,
    required String password,
  });
}
