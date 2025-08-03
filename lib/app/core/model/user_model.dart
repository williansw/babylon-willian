import 'package:babylon/app/core/common/extension/json_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  DateTime? createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,

    this.password,
  });

  static UserModel? fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) return null;
    return UserModel.fromJson({...data});
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.getString('id'),
      name: json.getString('name'),
      email: json.getString('email'),
      createdAt: json.getDateTime('createdAt'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,

      'email': email,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
