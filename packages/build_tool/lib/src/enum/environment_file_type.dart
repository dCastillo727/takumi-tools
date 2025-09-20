enum EnvironmentFileType {
  dotEnv('dotenv'),
  json('json'),
  yaml('yaml');

  final String name;

  const EnvironmentFileType(this.name);

  static EnvironmentFileType fromName(String name) {
    return EnvironmentFileType.values.firstWhere(
      (e) => e.name.toLowerCase() == name.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid EnvironmentFileType name: $name'),
    );
  }

  String getExtension({bool alternative = false}) {
    switch (this) {
      case EnvironmentFileType.dotEnv:
        return alternative ? '.env' : '';
      case EnvironmentFileType.json:
        return '.json';
      case EnvironmentFileType.yaml:
        return alternative ? '.yml' : '.yaml';
    }
  }
}
