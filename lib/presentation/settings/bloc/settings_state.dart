part of 'settings_bloc.dart';

abstract class SettingsState {
  final SettingEntity? setting;

  SettingsState({
    this.setting,
  });
}

class SettingsInitial extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  SettingsLoadedState({required super.setting});
}
