import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exceptions/exceptions.dart';
import 'auth_data_source.dart';

class AuthDataSourceImp implements AuthDataSource {
  @override
  Future<Result<UserCredential, ErrorModel>> create({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return Result.success(credential);
    } catch (e) {
      return Result.error(ErrorModel(error: e.toString()));
    }
  }

  @override
  Future<Result<UserCredential, ErrorModel>> auth({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.success(credential);
    } catch (e) {
      return Result.error(ErrorModel(error: e.toString()));
    }
  }
}
