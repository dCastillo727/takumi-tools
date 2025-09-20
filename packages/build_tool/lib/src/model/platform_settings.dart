import 'package:takumi_build_tool/src/enum/generation_mode.dart';
import 'package:takumi_build_tool/src/model/android_options.dart';
import 'package:takumi_build_tool/src/model/ios_options.dart';

final class PlatformSettings {
  //TODO think how to manage flavors
  final GenerationMode generationMode;
  final AndroidOptions android;
  final IOSOptions ios;

  PlatformSettings({
    required this.generationMode,
    required this.android,
    required this.ios,
  });

  factory PlatformSettings.fromMap(Map<String, dynamic> map) {
    return PlatformSettings(
      generationMode: map.containsKey('generation_mode')
          ? GenerationMode.values.firstWhere(
              (e) => e.name == (map['generation_mode'] as String),
              orElse: () => throw ArgumentError.value(
                map['generation_mode'],
                'generation_mode',
                'Invalid generation mode',
              ),
            )
          : GenerationMode.all,
      android: AndroidOptions.fromMap(map['android'] as Map<String, dynamic>),
      ios: IOSOptions.fromMap(map['ios'] as Map<String, dynamic>),
    );
  }
}
