// lib/extensions/string_extensions.dart

extension StringExtensions on String {
  /// Remove .,;:?! e espaço(s) do final da frase.
  String removePunct() {
    return replaceFirst(RegExp(r'\s*[.,;:?!]+\s*$'), '').trimRight();
  }

  bool isValidEmail() {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(this);
  }

  bool isValidName() {
    final names = trim().split(RegExp(r'\s+'));
    return names.length >= 2 &&
        names.every(
          (name) =>
              name.length >= 2 && RegExp(r'^[A-Za-zÀ-ÿ]+$').hasMatch(name),
        );
  }

  /// Valida senha: ao menos 6 dígitos, uma letra maiúscula e um número.
  bool isValidPassword() {
    return length >= 6 &&
        contains(RegExp(r'[A-Z]')) && // pelo menos uma maiúscula
        contains(RegExp(r'[0-9]')); // pelo menos um número
  }

  /// Remove acentos da string
  String get removeDiacritics {
    const withDiacritics =
        'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ';
    const withoutDiacritics =
        'AAAAAAACEEEEIIIIDNOOOOOOUUUUYBSaaaaaaaceeeeiiiidnoooooouuuuyby';
    var str = this;
    for (int i = 0; i < withDiacritics.length; i++) {
      str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }
    return str;
  }

  /// Retorna apenas o primeiro nome, com a primeira letra maiúscula e o restante minúsculo
  String get firstName {
    if (trim().isEmpty) return '';
    final first = trim().split(' ').first;
    return first.isNotEmpty ? first.capitalized : '';
  }

  /// Retorna string com a primeira letra maiúscula e o restante minúsculo
  String get capitalized =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Remove todos os espaços (útil para validação)
  String get removeSpaces => replaceAll(' ', '');

  /// Remove todos os caracteres não numéricos
  String get removeNonDigits => replaceAll(RegExp(r'[^0-9]'), '');

  /// Retorna true se string for nula ou vazia (para String?)
  static bool isNullOrEmpty(String? str) => str == null || str.isEmpty;

  /// Trunca o texto com reticências se exceder [maxLength]
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength) + suffix;
  }

  /// Capitaliza todas as palavras (tipo título)
  String get capitalizeWords => replaceAll(
    RegExp(' +'),
    ' ',
  ).split(' ').map((str) => str.capitalized).join(' ');

  /// Repete a string [count] vezes
  String repeat(int count) => List.filled(count, this).join();
}
