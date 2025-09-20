final class EnvironmentValidation {
  final Map<String, List<String>> requiredKeys;
  //TODO think about more validation options

  EnvironmentValidation({
    required this.requiredKeys,
  });

  List<String> get allRequiredKeys => requiredKeys['all'] ?? [];

  factory EnvironmentValidation.fromMap(Map<String, dynamic> map) {
    assert(
      map.values.every((value) => value is List && value.every((e) => e is String)),
      'All values in required keys for environment must be List<String>',
    );
    return EnvironmentValidation(
      requiredKeys: map.containsKey('required')
          ? map['required'].map((key, value) {
              final list = (value as List).map((e) => e.toString()).toList();
              return MapEntry(key, list);
            })
          : {},
    );
  }
}
