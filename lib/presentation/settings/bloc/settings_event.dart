part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class SettingsLoad extends SettingsEvent {}

class SettingsSave extends SettingsEvent {
  final TemperatureUnit unit;

  SettingsSave({
    required this.unit,
  });
}
