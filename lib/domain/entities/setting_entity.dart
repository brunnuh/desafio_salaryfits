class SettingEntity {
  final TemperatureUnit unit;
  final Language language;

  SettingEntity({
    required this.unit,
    required this.language,
  });

  SettingEntity copyWith({
    TemperatureUnit? unit,
    Language? language,
  }) {
    return SettingEntity(
      unit: unit ?? this.unit,
      language: language ?? this.language,
    );
  }
}

enum TemperatureUnit {
  celcius('°C'),
  fahrenheit('°F');

  final String label;

  const TemperatureUnit(this.label);
}

enum Language {
  ptBr,
  en,
}
