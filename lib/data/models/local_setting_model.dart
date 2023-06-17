import 'dart:convert';

import '../../domain/domain.dart';

class LocalSettingModel {
  final TemperatureUnit unit;
  final Language language;

  LocalSettingModel({
    required this.unit,
    required this.language,
  });

  factory LocalSettingModel.toModel(SettingEntity entity) {
    return LocalSettingModel(
      unit: entity.unit,
      language: entity.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "temperatureUnit": unit.name,
      "language": language.name,
    };
  }

  String toJson() => json.encode(toMap());
}
