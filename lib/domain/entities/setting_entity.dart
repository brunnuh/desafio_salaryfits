class SettingEntity {
  final TemperatureUnit unit;
  final Language language;

  SettingEntity({
    required this.unit,
    required this.language,
  });
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
