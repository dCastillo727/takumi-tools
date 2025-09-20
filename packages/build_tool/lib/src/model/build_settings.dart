import 'package:takumi_build_tool/src/model/environment_settings.dart';
import 'package:takumi_build_tool/src/model/platform_settings.dart';

final class BuildSettings {
  final String defaultOutputPath;
  final String defaultBuildMode;
  final EnvironmentSettings environment;
  final PlatformSettings platforms;
  //TODO add hooks

  BuildSettings({
    required this.defaultOutputPath,
    required this.defaultBuildMode,
    required this.environment,
    required this.platforms,
  });

  factory BuildSettings.fromMap(Map<String, dynamic> map) {
    return BuildSettings(
      defaultOutputPath: map['output_path'] as String? ?? 'takumi_tools/build_tool/builds/',
      defaultBuildMode: map['build_mode'] as String? ?? 'debug',
      environment: EnvironmentSettings.fromMap(map['environment'] as Map<String, dynamic>),
      platforms: PlatformSettings.fromMap(map['platforms'] as Map<String, dynamic>),
    );
  }
}
