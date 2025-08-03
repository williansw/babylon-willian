import 'package:uuid/uuid.dart';

extension GuidHelper on Object {
  static String newGuid() => Uuid().v4();
}
