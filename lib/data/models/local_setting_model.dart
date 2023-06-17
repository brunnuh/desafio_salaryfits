import 'dart:convert';

import '../../domain/domain.dart';

TemperatureUnit mapToUnit(String value) {
  switch (value) {
    case 'celcius':
      return TemperatureUnit.celcius;
    case 'fahrenheit':
    default:
      return TemperatureUnit.fahrenheit;
  }
}

Language mapToLanguage(String value) {
  switch (value) {
    case 'ptBr':
      return Language.ptBr;
    case 'en':
    default:
      return Language.en;
  }
}

class LocalSettingModel {
  final TemperatureUnit unit;
  final Language language;

  LocalSettingModel({
    required this.unit,
    required this.language,
  });

  SettingEntity get toEntity {
    return SettingEntity(
      unit: unit,
      language: language,
    );
  }

  factory LocalSettingModel.toModel(SettingEntity entity) {
    return LocalSettingModel(
      unit: entity.unit,
      language: entity.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temperatureUnit': unit.name,
      'language': language.name,
    };
  }

  factory LocalSettingModel.fromMap(Map<String, dynamic> map) {
    return LocalSettingModel(
      unit: mapToUnit(map['temperatureUnit']),
      language: mapToLanguage(map['language']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalSettingModel.fromJson(String source) {
    final jsonDecoded = json.decode(source) as Map<String, dynamic>;
    if (!jsonDecoded.keys
        .toSet()
        .containsAll(['temperatureUnit', 'language'])) {
      throw Exception();
    }
    return LocalSettingModel.fromMap(jsonDecoded);
  }
}
