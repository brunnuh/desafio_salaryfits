part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class SettingsLoad extends SettingsEvent {}

class SettingsSave extends SettingsEvent {
  final TemperatureUnit? unit;
  final Language? language;

  SettingsSave({
    this.unit,
    this.language,
  });
}
