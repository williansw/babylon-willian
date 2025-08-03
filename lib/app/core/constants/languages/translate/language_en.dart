import '../languages.dart';

class LanguageEn implements Languages {
  //AppRoutes

  @override
  String genericErrorWithDetail(String detail) => 'An error occurred: $detail';
  @override
  String notify(name) => 'NotifyType $name updated.';
  @override
  String get routePopped => 'Route popped';
  @override
  String get routePushed => 'Route pushed';
  @override
  String get routeReplaced => 'Route replaced';
  @override
  String get popupRouteLabel => 'PopUp';
  @override
  String get dialogRouteLabel => 'Dialog';
  @override
  String get screenRouteLabel => 'Screen';
  // AppException
  @override
  String get flutterError => 'Flutter Error';
  @override
  String get unnamedRoute => 'unnamed route';
  @override
  String get unknownRoute => 'unknown';
  @override
  String get failedToDescribeContext => 'Failed to describe context';
  @override
  String get failedToGetWidgetTree => 'Failed to get widget tree';
  @override
  String get failedToLogError => 'Failed to log error';
  // Log categories
  @override
  String get cache => 'Cache';
  @override
  String get navigation => 'Navigation';
  @override
  String get security => 'Security';
  @override
  String get request => 'Request';
  @override
  String get functionLabel => 'Function';
  @override
  String get logLocalLabel => 'Local';
  @override
  String get logBodyLabel => 'Body';
  // Firebase Auth Errors
  @override
  String get signupEmailAlreadyInUse => 'This email is already registered.';
  @override
  String get signupInvalidEmail => 'The email provided is not valid.';
  @override
  String get signupWeakPassword =>
      'Password must be at least 6 characters long.';
  @override
  String get signupUserNotFound =>
      'User not found. Please check the email entered.';
  @override
  String get signupWrongPassword => 'Incorrect password. Please try again.';
  @override
  String get signupGenericError =>
      'An error occurred during sign up. Please try again.';
  //Screen
  @override
  String get appName => 'Babylon - WILLIAN';
  @override
  String hi(name) => 'Hi $name';
  @override
  String get apply => 'Apply';
  @override
  String get english => 'English';
  @override
  String get portuguese => 'Portuguese';
  @override
  String get welcomeToBabylon => 'Welcome to Babylon';
  @override
  String get emailLabel => 'Email Address';
  @override
  String get passwordLabel => 'Password';
  @override
  String get loginButton => 'Login';
  @override
  String get nameRequired => 'Full name is required';
  @override
  String get emailRequired => 'Email is required';
  @override
  String get invalidEmail => 'Invalid email format';
  @override
  String get passwordRequired => 'Password is required';
  @override
  String get passwordInvalidFormat =>
      'At least 6 digits, one uppercase letter, and one number.';
  @override
  String get loginError => 'Login error';
  @override
  String get errorLoadingData => 'Error loading data';
  @override
  String get createAccount => 'Create Account';
  @override
  String get registerButton => 'Register';
  @override
  String get backToLogin => 'Back to Login';
  @override
  String get fullNameLabel => 'Full Name is required';
  @override
  String get signupMissingEmailOrPassword => 'Email or password not provided';
}
