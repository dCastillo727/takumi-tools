import 'package:takumi_build_tool/src/enum/environment_file_type.dart';
import 'package:takumi_build_tool/src/enum/generation_mode.dart';
import 'package:takumi_build_tool/src/model/environment_validation.dart';

final class EnvironmentSettings {
  final String relativePath;
  final String filePattern;
  final EnvironmentFileType type;
  final GenerationMode generationMode;
  final EnvironmentValidation? validation;

  EnvironmentSettings({
    required this.relativePath,
    required this.filePattern,
    required this.type,
    required this.generationMode,
    required this.validation,
  });

  factory EnvironmentSettings.fromMap(Map<String, dynamic> map) {
    return EnvironmentSettings(
      relativePath: map['relative_path'] as String,
      filePattern: map['name_pattern'] as String? ?? '{env_name}_environment',
      type: map.containsKey('type') ? EnvironmentFileType.fromName(map['type'] as String) : EnvironmentFileType.json,
      generationMode: map.containsKey('generation_mode')
          ? GenerationMode.values.firstWhere(
              (e) => e.name == (map['generation_mode'] as String),
              orElse: () => throw ArgumentError.value(
                map['generation_mode'],
                'generation_mode',
                'Invalid generation mode',
              ),
            )
          : GenerationMode.single,
      validation: map.containsKey('validation') ? EnvironmentValidation.fromMap(map['validation']) : null,
    );
  }
}
