import 'package:takumi_build_tool/src/mixin/platform_options_mixin.dart';

final class AndroidOptions with PlatformOptionsMixin {
  final String defaultBuildType;
  final bool? enableOfuscation;
  final bool? enableTreeShaking;
  final bool? splitPerAbi;
  final String? targetSdk;
  final String? minSdk;

  AndroidOptions({
    required this.defaultBuildType,
    required this.enableOfuscation,
    required this.enableTreeShaking,
    required this.splitPerAbi,
    required this.targetSdk,
    required this.minSdk,
  });

  factory AndroidOptions.fromMap(Map<String, dynamic> map) {
    return AndroidOptions(
      defaultBuildType: map['build_type'] as String? ?? 'apk',
      enableOfuscation: map['enable_ofuscation'] as bool?,
      enableTreeShaking: map['enable_tree_shaking'] as bool?,
      splitPerAbi: map['split_per_abi'] as bool?,
      targetSdk: map['target_sdk'] as String?,
      minSdk: map['min_sdk'] as String?,
    );
  }

  @override
  String buildPlatformCommandOptions() {
    // TODO: implement getCommandLineOptions
    throw UnimplementedError();
  }
}
