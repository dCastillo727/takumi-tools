import 'dart:io';

import 'package:takumi_build_tool/src/model/build_config.dart';
import 'package:takumi_build_tool/src/services/args_service.dart';

import 'constants/constants.dart';

void runTakumiBuildTool(List<String> args) {
  BuildConfig.fromArgs(args);
}

void setupDefaultSettings({required List<String> args, bool altHelp = false}) {
  try {
    final argsService = ArgsService();
    final setupDir = argsService.parseSetupPath(args, useAltHelp: altHelp);

    final file = File('${setupDir}takumi_build_tool.yaml');

    if (file.existsSync()) {
      print('Setup file already exists at ${file.path}');
      exit(1);
    }

    file.createSync(recursive: true);
    file.writeAsStringSync(defaultBuildSettings);
    print('Setup file created at ${file.path}');
  } on FormatException catch (e) {
    print('Error: ${e.message}');
    exit(1);
  }
}
