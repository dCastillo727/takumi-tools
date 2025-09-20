import 'dart:io';

import 'package:args/args.dart';
import 'package:takumi_build_tool/src/constants/constants.dart';
import 'package:takumi_build_tool/src/model/build_config.dart';

class ArgsService {
  String parseSetupPath(List<String> args, {bool useAltHelp = false}) {
    final parser = ArgParser();

    parser.addOption(
      'path',
      abbr: 'p',
      help: 'Directory path for YAML configuration file',
      valueHelp: 'path',
      defaultsTo: 'takumi_tools/build_tool/',
    );
    parser.addFlag('help', abbr: 'h', help: 'Show help information', negatable: false);
    final results = parser.parse(args);
    final result = results.option('path')!;

    if (results.flag('help')) {
      print(useAltHelp ? altSetupHelpTitle : setupHelpTitle);
      print(parser.usage);
      exit(0);
    }

    return result.endsWith('/') ? result : '$result/';
  }

  BuildConfig parseBuildConfig(List<String> args) {
    return BuildConfig.fromArgs(args);
  }
}
