import 'package:takumi_build_tool/src/mixin/platform_options_mixin.dart';

final class IOSOptions with PlatformOptionsMixin {
  final String defaultTarget;
  final bool? enableBitcode;
  final String? deploymentTarget;
  final String? codeSignStyle;
  final String? teamId;
  final String? bundleIdentifier;

  IOSOptions({
    required this.defaultTarget,
    required this.enableBitcode,
    required this.deploymentTarget,
    required this.codeSignStyle,
    required this.teamId,
    required this.bundleIdentifier,
  });

  factory IOSOptions.fromMap(Map<String, dynamic> map) {
    return IOSOptions(
      defaultTarget: map['target'] as String? ?? 'ipa',
      enableBitcode: map['enable_bitcode'] as bool?,
      deploymentTarget: map['deployment_target'] as String?,
      codeSignStyle: map['code_sign_style'] as String?,
      teamId: map['team_id'] as String?,
      bundleIdentifier: map['bundle_identifier'] as String?,
    );
  }

  @override
  String buildPlatformCommandOptions() {
    // TODO: implement getCommandLineOptions
    throw UnimplementedError();
  }
}
