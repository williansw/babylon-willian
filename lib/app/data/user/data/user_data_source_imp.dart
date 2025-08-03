import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/model/user_model.dart';
import 'user_data_source.dart';

class UserDataSourceImp implements UserDataSource {
  @override
  Future<Result<bool, ErrorModel>> createUser({required UserModel user}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toJson());
      return Result.success(true);
    } catch (e) {
      return Result.error(ErrorModel(error: e.toString()));
    }
  }

  @override
  Future<Result<DocumentSnapshot<Map<String, dynamic>>, ErrorModel>> getUser({
    required String userId,
  }) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return Result.success(response);
    } catch (e) {
      return Result.error(ErrorModel(error: e.toString()));
    }
  }
}
