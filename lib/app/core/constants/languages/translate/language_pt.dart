import '../languages.dart';

class LanguagePt implements Languages {
  @override
  String genericErrorWithDetail(String detail) => 'Ocorreu um erro: $detail';
  //AppRoutes
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
  String get signupEmailAlreadyInUse => 'Este e-mail já está cadastrado.';
  @override
  String get signupInvalidEmail => 'O e-mail informado não é válido.';
  @override
  String get signupWeakPassword => 'A senha deve ter pelo menos 6 caracteres.';
  @override
  String get signupUserNotFound =>
      'Usuário não encontrado. Verifique o e-mail digitado.';
  @override
  String get signupWrongPassword => 'Senha incorreta. Tente novamente.';
  @override
  String get signupGenericError =>
      'Ocorreu um erro ao cadastrar. Tente novamente.';
  //Screen
  @override
  String get appName => 'Babylon';
  @override
  String hi(name) => 'Hi $name';
  @override
  String get apply => 'Aplicar';
  @override
  String get english => 'Inglês';
  @override
  String get portuguese => 'Português';
  @override
  String get welcomeToBabylon => 'Bem-vindo ao Babylon';
  @override
  String get emailLabel => 'Endereço de e-mail';
  @override
  String get passwordLabel => 'Senha';
  @override
  String get loginButton => 'Entrar';
  @override
  String get nameRequired => 'Nome completo é obrigatório';
  @override
  String get emailRequired => 'E-mail é obrigatório';
  @override
  String get invalidEmail => 'Formato de e-mail inválido';
  @override
  String get passwordRequired => 'Senha é obrigatória';
  @override
  String get passwordInvalidFormat =>
      'Ao menos 6 dígitos, uma letra maiúscula e um número.';
  @override
  String get loginError => 'Erro ao fazer login';
  @override
  String get errorLoadingData => 'Erro ao carregar os dados';
  @override
  String get createAccount => 'Criar conta';
  @override
  String get registerButton => 'Registrar';
  @override
  String get backToLogin => 'Voltar para o Login';
  @override
  String get fullNameLabel => 'Nome completo';
  @override
  String get signupMissingEmailOrPassword => 'E-mail ou senha não informados';

  @override
  String get genericError => 'Ocorreu um erro inesperado. Tente novamente.';
}
