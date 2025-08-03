import '../constants/languages/languages.dart';

class FirebaseService {
  String mapAuthError(String error) {
    if (error.contains('email-already-in-use')) {
      return R.signupEmailAlreadyInUse;
    }
    if (error.contains('invalid-email')) {
      return R.signupInvalidEmail;
    }
    if (error.contains('weak-password')) {
      return R.signupWeakPassword;
    }
    if (error.contains('user-not-found')) {
      return R.signupUserNotFound;
    }
    if (error.contains('wrong-password')) {
      return R.signupWrongPassword;
    }
    if (error.contains('unknown-error')) {
      return R.genericError;
    }
    return R.genericError;
  }
}
