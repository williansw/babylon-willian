import 'package:flutter/material.dart';

enum ProviderStatus { wait, loading, success, info, error, expired }

mixin StatusNotifier on ChangeNotifier {
  String? _infoMessage;
  String? _errorMessage;
  String? _loadingMessage;
  ProviderStatus _status = ProviderStatus.wait;

  ProviderStatus get status => _status;
  String? get errorMessage => _errorMessage;
  String? get infoMessage => _infoMessage;
  String? get loadingMessage => _loadingMessage;
  bool get isLoading => _status == ProviderStatus.loading;
  bool get isSuccess => _status == ProviderStatus.success;
  bool get isIdle => _status == ProviderStatus.wait;
  bool get hasError => _status == ProviderStatus.error;
  bool get hasInfo => _status == ProviderStatus.info;

  void setLoading({String? message}) {
    _status = ProviderStatus.loading;
    _loadingMessage = message;
    _errorMessage = null;
    _infoMessage = null;
    notifyListeners();
  }

  void setSuccess() {
    _status = ProviderStatus.success;
    _errorMessage = null;

    notifyListeners();
  }

  void setInfoMessage(String message) {
    _status = ProviderStatus.info;
    _infoMessage = message;
    notifyListeners();
  }

  void cleanInfoMessage() {
    _status = ProviderStatus.wait;
    _infoMessage = null;
  }

  void setError(String message) {
    _status = ProviderStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  void cleanErrorMessage() {
    _status = ProviderStatus.wait;
    _errorMessage = null;
  }

  void setIdle() {
    _status = ProviderStatus.wait;
    _errorMessage = null;
    notifyListeners();
  }

  void setExpired() {
    _status = ProviderStatus.expired;
    _errorMessage = 'Sessão expirada. Faça login novamente.';
    notifyListeners();
  }

  void reset() {
    _status = ProviderStatus.wait;
    _errorMessage = null;
    _infoMessage = null;
    _loadingMessage = null;
    notifyListeners();
  }
}
