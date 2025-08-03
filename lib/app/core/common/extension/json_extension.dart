/// Extensões para maps usados para tratar dados em JSON.
///
/// Exemplo de uso:
/// ```dart
/// factory OrderModel.fromJson(Map<String, dynamic> json) {
///   return OrderModel(
///     id: json.getInt('id'),
///     createdAt: json.getDateTime('createdAt'),
///     totalValue: json.getDouble('totalValue'),
///     items: json.getList('items', OrderItemModel.fromJson),
///   );
/// }
/// ```
extension JsonMapExtension on Map<String, dynamic> {
  /// Obtém um valor do JSON e tenta convertê-lo em [bool].
  bool? getBool(String key) {
    final value = this[key];
    if (value is bool) return value;
    if (value is String) return bool.tryParse(value);
    return null;
  }

  /// Obtém um valor do JSON e tenta convertê-lo em [DateTime].
  DateTime? getDateTime(String key) {
    final value = this[key];
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  /// Obtém um valor do JSON e tenta convertê-lo em [double].
  double? getDouble(String key) {
    final value = this[key];
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  /// Obtém um valor do JSON e tenta convertê-lo em [int].
  int? getInt(String key) {
    final value = this[key];
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// Converte um campo de lista do JSON usando uma função para mapear cada item.
  List<T>? getList<T>(
      String key, T Function(Map<String, dynamic> item) mapper) {
    final value = this[key];

    if (value is List) {
      final List<T> result = [];

      for (var item in value) {
        if (item is Map<String, dynamic>) result.add(mapper(item));
      }

      if (result.isNotEmpty) return result;
    }

    return null;
  }

  /// Converte um campo de objeto do JSON em um objeto do Dart usando um construtor.
  T? getObject<T>(
      String key, T Function(Map<String, dynamic> item) constructor) {
    final value = this[key];

    if (value is Map<String, dynamic>) {
      return constructor(value);
    }

    return null;
  }

  /// Obtém um valor do JSON em forma de [String].
  String? getString(String key) {
    final value = this[key];
    if (value is String) return value;
    return value?.toString();
  }
}

/// Extensões para listas usadas para tratar dados em JSON.
///
/// Exemplo de uso:
/// ```dart
/// factory OptionsModel.fromJson(List<dynamic> json) {
///   return OptionsModel(
///     firtOption: json.getObject(0, FirstOptionModel.fromJson),
///     secondOption: json.getObject(1, SecondOptionModel.fromJson),
///   );
/// }
/// ```
extension JsonListExtension on List<dynamic> {
  /// Converte um item da lista do JSON em um objeto do Dart usando um construtor.
  T? getObject<T>(
      int index, T Function(Map<String, dynamic> item) constructor) {
    if (length < index + 1) return null;

    final value = this[index];

    if (value is Map<String, dynamic>) {
      return constructor(value);
    }

    return null;
  }
}
