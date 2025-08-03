import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/model/user_model.dart';

abstract class UserDataSource {
  Future<Result<bool, ErrorModel>> createUser({required UserModel user});
  Future<Result<DocumentSnapshot<Map<String, dynamic>>, ErrorModel>> getUser({
    required String userId,
  });
}
