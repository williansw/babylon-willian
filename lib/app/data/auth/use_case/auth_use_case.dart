import '../../../core/exceptions/exceptions.dart';
import '../model/auth_model.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase({required this.repository});
  Future<Result<AuthModel, ErrorModel>> create({
    required String email,
    required String password,
  }) async {
    return repository.create(email: email, password: password);
  }

  Future<Result<AuthModel, ErrorModel>> auth({
    required String email,
    required String password,
  }) async {
    return repository.auth(email: email, password: password);
  }
}
