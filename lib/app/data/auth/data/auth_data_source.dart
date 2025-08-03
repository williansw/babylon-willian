import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exceptions/exceptions.dart';

abstract class AuthDataSource {
  Future<Result<UserCredential, ErrorModel>> create({
    required String email,
    required String password,
  });

  Future<Result<UserCredential, ErrorModel>> auth({
    required String email,
    required String password,
  });
}
