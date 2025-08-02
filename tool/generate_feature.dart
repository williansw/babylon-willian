// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:async';

const int delayMs = 1000;
const int delayTwoMs = 100;

// Cores ANSI para terminal
class TerminalColors {
  static const String reset = '\x1B[0m';
  static const String black = '\x1B[30m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';

  static const String bold = '\x1B[1m';
  static const String underline = '\x1B[4m';
}

class Spinner {
  static const List<String> frames = [
    '⠋',
    '⠙',
    '⠹',
    '⠸',
    '⠼',
    '⠴',
    '⠦',
    '⠧',
    '⠇',
    '⠏'
  ];

  Timer? _timer;
  int _frameIndex = 0;

  void start(String message) {
    stdout.write(
        '${TerminalColors.yellow}${frames[_frameIndex]} $message${TerminalColors.reset}');
    _timer = Timer.periodic(Duration(milliseconds: delayTwoMs), (timer) {
      _frameIndex = (_frameIndex + 1) % frames.length;
      stdout.write(
          '\r${TerminalColors.yellow}${frames[_frameIndex]} $message${TerminalColors.reset}');
    });
  }

  void stop(String message, {bool success = true}) {
    _timer?.cancel();
    // Limpa a linha do spinner
    stdout.write('\r${' ' * (message.length + 2)}');
    stdout.write('\r');
    if (success) {
      print('${TerminalColors.green}✔ $message${TerminalColors.reset}');
    } else {
      print('${TerminalColors.red}✖ $message${TerminalColors.reset}');
    }
  }
}

void main(List<String> args) async {
  // Banner inicial
  print('${TerminalColors.blue}${TerminalColors.bold}');
  print('┌──────────────────────────────────────────────────────┐');
  print('│           🚀 GERADOR DE FEATURE FLUTTER 🚀           │');
  print(
      '└──────────────────────────────────────────────────────┘${TerminalColors.reset}');
  print('');

  // Menu de opções
  print(
      '${TerminalColors.bold}O que você deseja gerar?${TerminalColors.reset}');
  print('${TerminalColors.green}1️⃣  View + ViewModel (apenas tela)');
  print(
      '${TerminalColors.blue}2️⃣  Core da Feature (Data, Repository, UseCase, Model)');
  print(
      '${TerminalColors.magenta}3️⃣  Ambos (end-to-end)${TerminalColors.reset}');
  print('');

  int option = 0;
  while (option < 1 || option > 3) {
    stdout.write(
        '${TerminalColors.yellow}➤ Escolha uma opção (1, 2 ou 3): ${TerminalColors.reset}');
    final input = stdin.readLineSync() ?? '';
    option = int.tryParse(input) ?? 0;

    if (option < 1 || option > 3) {
      print(
          '${TerminalColors.red}✖ Opção inválida! Por favor, escolha 1, 2 ou 3.${TerminalColors.reset}');
    }
  }

  // 1. Nome da feature/tela
  String featureName;
  if (args.isNotEmpty && args[0].trim().isNotEmpty) {
    featureName = args[0].trim().toLowerCase();
  } else {
    if (option == 1) {
      stdout.write(
          '\n${TerminalColors.cyan}? Digite o nome da View (ex: write): ${TerminalColors.reset}');
    } else {
      stdout.write(
          '\n${TerminalColors.cyan}? Digite o nome da feature (ex: read): ${TerminalColors.reset}');
    }
    featureName = stdin.readLineSync()?.trim().toLowerCase() ?? '';
    if (featureName.isEmpty) {
      print(
          '${TerminalColors.red}✖ Nome não pode ser vazio!${TerminalColors.reset}');
      exit(1);
    }
  }

  // 2. Nome da Model (apenas para opção 2 ou 3)
  String model = '';
  if (option == 2 || option == 3) {
    if (args.length > 1 && args[1].trim().isNotEmpty) {
      model = args[1].trim();
    } else {
      stdout.write(
          '${TerminalColors.cyan}? Digite o nome da Model (ex: ReadModel): ${TerminalColors.reset}');
      model = stdin.readLineSync()?.trim() ?? '';
      if (model.isEmpty) {
        print(
            '${TerminalColors.red}✖ Model não pode ser vazia!${TerminalColors.reset}');
        exit(1);
      }
    }
  }

  // 3. Caminho base
  String basePath;
  if (args.length > 2 && args[2].trim().isNotEmpty) {
    basePath = args[2].trim();
  } else {
    stdout.write(
        '${TerminalColors.cyan}? Digite o caminho base (ex: lib/app/features) [padrão: lib/app/features]: ${TerminalColors.reset}');
    basePath = stdin.readLineSync()?.trim() ?? 'lib/app/features';
    if (basePath.isEmpty) basePath = 'lib/app/features';
  }

  final featurePascal = featureName[0].toUpperCase() + featureName.substring(1);
  final featurePath = '$basePath/$featureName';

  print(
      '\n${TerminalColors.yellow}⚡ Iniciando geração da feature...${TerminalColors.reset}');

  // --- View/ViewModel ---
  if (option == 1 || option == 3) {
    final spinner = Spinner();
    spinner.start('Criando estrutura de pastas...');

    await Future.delayed(Duration(milliseconds: delayMs)); // Simula trabalho
    Directory('$featurePath/viewmodel').createSync(recursive: true);
    Directory('$featurePath/view').createSync(recursive: true);
    spinner.stop('Estrutura de pastas criada');

    // ViewModel
    spinner.start('Gerando ViewModel...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/viewmodel/${featureName}_view_model.dart')
        .writeAsStringSync('''
import '../../../base/core/base/base_model.dart';

/// ViewModel para a feature '$featurePascal'.
class ${featurePascal}ViewModel extends BaseModel {
  // TODO: Implemente propriedades e métodos específicos da feature.

  Future<void> loadData() async {
    setLoading();
    try {
      // TODO: Chamar UseCase, buscar dados, etc.
      // setSuccess();
    } catch (e) {
      setError('Erro ao carregar dados: \$e');
    }
  }
}
''');
    spinner.stop(
        'ViewModel gerada: $featurePath/viewmodel/${featureName}_view_model.dart');

    // View
    spinner.start('Gerando View...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/view/${featureName}_view.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import '../viewmodel/${featureName}_view_model.dart';

class ${featurePascal}View extends StatelessWidget {
  final ${featurePascal}ViewModel viewModel;

  const ${featurePascal}View({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$featurePascal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, size: 60),
            const SizedBox(height: 20),
            const Text('Feature $featurePascal funcionando!'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: viewModel.loadData,
              child: const Text('Carregar dados'),
            ),
          ],
        ),
      ),
    );
  }
}
''');
    spinner.stop('View gerada: $featurePath/view/${featureName}_view.dart');
  }

  // --- Core da feature (Model/Data/Repository/UseCase) ---
  if (option == 2 || option == 3) {
    final spinner = Spinner();
    spinner.start('Criando estrutura do core...');

    await Future.delayed(Duration(milliseconds: delayMs));
    Directory('$featurePath/data').createSync(recursive: true);
    Directory('$featurePath/model').createSync(recursive: true);
    Directory('$featurePath/repository').createSync(recursive: true);
    Directory('$featurePath/use_case').createSync(recursive: true);
    spinner.stop('Estrutura do core criada');

    // Model
    spinner.start('Gerando Model...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/model/${featureName}_model.dart').writeAsStringSync('''
class $model {
  // TODO: Defina os campos da model

  $model();

  factory $model.fromJson(Map<String, dynamic> json) {
    return $model();
  }
}
''');
    spinner.stop('Model gerada: $featurePath/model/${featureName}_model.dart');

    // DataSource Interface
    spinner.start('Gerando DataSource...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/data/${featureName}_data_source.dart')
        .writeAsStringSync('''
import '../../../base/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

abstract class ${featurePascal}DataSource {
  Future<Result<Response, ErrorModel>> $featureName({required String prompt});
}
''');
    spinner.stop(
        'DataSource gerado: $featurePath/data/${featureName}_data_source.dart');

    // DataSource Implementação
    spinner.start('Gerando DataSourceImpl...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/data/${featureName}_data_source_imp.dart')
        .writeAsStringSync('''
import 'package:dio/dio.dart';
import '../../../base/core/exceptions/exceptions.dart';
import '../../../services/dio_helper.dart';
import '${featureName}_data_source.dart';

class ${featurePascal}DataSourceImp implements ${featurePascal}DataSource {
  @override
  Future<Result<Response, ErrorModel>> $featureName({required String prompt}) async {
    return DioHelper.getData(path: '$featureName');
  }
}
''');
    spinner.stop(
        'DataSourceImpl gerado: $featurePath/data/${featureName}_data_source_imp.dart');

    // Repository Interface
    spinner.start('Gerando Repository...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/repository/${featureName}_repository.dart')
        .writeAsStringSync('''
import '../../../base/core/exceptions/exceptions.dart';
import '../model/${featureName}_model.dart';

abstract class ${featurePascal}Repository {
  Future<Result<$model, ErrorModel>> $featureName({required String prompt});
}
''');
    spinner.stop(
        'Repository gerado: $featurePath/repository/${featureName}_repository.dart');

    // Repository Implementação
    spinner.start('Gerando RepositoryImpl...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/repository/${featureName}_repository_imp.dart')
        .writeAsStringSync('''
import '../../../base/core/exceptions/exceptions.dart';
import '../data/${featureName}_data_source.dart';
import '../model/${featureName}_model.dart';
import './${featureName}_repository.dart';

class ${featurePascal}RepositoryImp implements ${featurePascal}Repository {
  final ${featurePascal}DataSource dataSource;
  ${featurePascal}RepositoryImp({required this.dataSource});

  @override
  Future<Result<$model, ErrorModel>> $featureName({required String prompt}) async {
    final result = await dataSource.$featureName(prompt: prompt);
    return result.when(
      (success) => Success($model.fromJson(success.data)),
      (error) => Error(error),
    );
  }
}
''');
    spinner.stop(
        'RepositoryImpl gerado: $featurePath/repository/${featureName}_repository_imp.dart');

    // Use Case
    spinner.start('Gerando UseCase...');
    await Future.delayed(Duration(milliseconds: delayMs));
    File('$featurePath/use_case/${featureName}_use_case.dart')
        .writeAsStringSync('''
import '../../../base/core/exceptions/exceptions.dart';
import '../model/${featureName}_model.dart';
import '../repository/${featureName}_repository.dart';

class ${featurePascal}UseCase {
  final ${featurePascal}Repository repository;

  ${featurePascal}UseCase(this.repository);

  Future<Result<$model, ErrorModel>> call({required String prompt}) async {
    return repository.$featureName(prompt: prompt);
  }
}
''');
    spinner.stop(
        'UseCase gerado: $featurePath/use_case/${featureName}_use_case.dart');
  }

  // Mensagem final
  print(
      '\n${TerminalColors.green}${TerminalColors.bold}🎉 Feature gerada com sucesso!${TerminalColors.reset}');
  print('${TerminalColors.bold}Caminho:${TerminalColors.reset} $featurePath');

  if (option == 1) {
    print(
        '${TerminalColors.bold}Tipo:${TerminalColors.reset} ${TerminalColors.green}View + ViewModel${TerminalColors.reset}');
  } else if (option == 2) {
    print(
        '${TerminalColors.bold}Tipo:${TerminalColors.reset} ${TerminalColors.blue}Core da Feature${TerminalColors.reset}');
  } else {
    print(
        '${TerminalColors.bold}Tipo:${TerminalColors.reset} ${TerminalColors.magenta}Feature Completa${TerminalColors.reset}');
  }

  print('\n${TerminalColors.yellow}👉 Próximos passos:');
  print('- Implemente a lógica nos arquivos gerados');
  print('- Configure as dependências');
  print('- Adicione as rotas no seu MaterialApp${TerminalColors.reset}');
}
