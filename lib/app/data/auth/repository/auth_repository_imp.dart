import '../../../core/exceptions/exceptions.dart';
import '../data/auth_data_source.dart';
import '../model/auth_model.dart';
import './auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource dataSource;
  AuthRepositoryImp({required this.dataSource});
  @override
  Future<Result<AuthModel, ErrorModel>> create({
    required String email,
    required String password,
  }) async {
    final result = await dataSource.create(email: email, password: password);
    return result.when(
      (success) => Success(AuthModel.fromJson(success)),
      (error) => Error(error),
    );
  }

  @override
  Future<Result<AuthModel, ErrorModel>> auth({
    required String email,
    required String password,
  }) async {
    final result = await dataSource.auth(email: email, password: password);
    return result.when(
      (success) => Success(AuthModel.fromJson(success)),
      (error) => Error(error),
    );
  }
}
