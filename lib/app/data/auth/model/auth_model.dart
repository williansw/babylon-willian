import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  UserCredential userCredential;

  AuthModel({required this.userCredential});

  factory AuthModel.fromJson(UserCredential userCredential) {
    return AuthModel(userCredential: userCredential);
  }
}
