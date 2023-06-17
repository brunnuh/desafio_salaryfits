import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.loadSettingUsecase,
    required this.saveSettingUsecase,
  }) : super(SettingsInitial()) {
    on(_mapToState);
  }

  final LoadSettingUsecase loadSettingUsecase;
  final SaveSettingUsecase saveSettingUsecase;

  void _mapToState(SettingsEvent event, Emitter emit) async {
    switch (event) {
      case SettingsLoad():
        await _loadSettings();
        emit(SettingsLoadedState(setting: setting));
      case SettingsSave(unit: var unit, language: var language):
        setting = setting?.copyWith(unit: unit, language: language);
        _saveSettings();
    }
  }

  SettingEntity? setting;

  Future<void> _loadSettings() async {
    setting = await loadSettingUsecase();
  }

  Future<void> _saveSettings() async {
    if (setting != null) {
      await saveSettingUsecase(setting: setting!);
    }
  }
}
