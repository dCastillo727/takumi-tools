import 'dart:io';

import 'package:takumi_build_tool/src/enum/build_mode.dart';

final class BuildConfig {
  final String? environment;
  final List<String>? platforms;
  final BuildMode? buildMode;
  final String? settingsFile;
  final String? outputDirectory;
  final bool verbose;
  final List<String> extraArgs;

  BuildConfig({
    this.environment,
    this.platforms,
    this.buildMode,
    this.settingsFile,
    this.outputDirectory,
    this.verbose = false,
    this.extraArgs = const [],
  });

  factory BuildConfig.fromArgs(List<String> args) {
    String? environment;
    List<String>? platforms;
    BuildMode? buildMode;
    String? settingsFile;
    String? outputDirectory;
    bool verbose = false;
    List<String> extraArgs = [];

    for (var i = 0; i < args.length; i++) {
      final arg = args[i];
      switch (arg) {
        case '-h' || '--help':
          _printHelp();
          exit(0);
        case '-e' || '--env' || '--environment':
          if (i + 1 < args.length) {
            environment = args[i + 1];
            i++;
          }
          break;
        case '-p' || '--platforms':
          if (i + 1 < args.length) {
            platforms = args[i + 1].split(',');
            i++;
          }
          break;
        case '--release' || '--debug' || '--profile':
          if (i + 1 < args.length) {
            buildMode = BuildMode.values.firstWhere(
              (mode) => mode.name == arg.replaceFirst('--', ''),
            );
            i++;
          }
          break;
        case '-s' || '--settings':
          if (i + 1 < args.length) {
            settingsFile = args[i + 1];
            i++;
          }
          break;
        case '-o' || '--output':
          if (i + 1 < args.length) {
            outputDirectory = args[i + 1];
            i++;
          }
          break;
        case '-v' || '--verbose':
          verbose = true;
          break;
        default:
          extraArgs.add(arg);
      }
    }

    return BuildConfig(
      environment: environment,
      platforms: platforms,
      buildMode: buildMode,
      settingsFile: settingsFile,
      outputDirectory: outputDirectory,
      verbose: verbose,
      extraArgs: extraArgs,
    );
  }

  static void _printHelp() {
    print('''
Usage: takumi_build_tool [options]

Options:
  -e, --env, --environment <env_name>     Specify the build environment (e.g., development, staging, production)
  -p, --platforms <platforms>             Comma-separated list of target platforms (e.g., android, ios, web)
      --release                           Set build mode to release
      --debug                             Set build mode to debug
      --profile                           Set build mode to profile
  -s, --settings <file>                   Path to the YAML settings file
  -o, --output <directory>                Specify the output directory for build artifacts
  -v, --verbose                           Enable verbose logging
  -h, --help                              Show this help message
''');
  }
}
