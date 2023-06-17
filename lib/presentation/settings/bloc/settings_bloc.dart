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
        setting = setting.copyWith(unit: unit, language: language);
        _saveSettings();
    }
  }

  SettingEntity setting = SettingEntity.empty();

  Future<void> _loadSettings() async {
    final result = await loadSettingUsecase();

    if (result != null) {
      setting = result;
    }
  }

  Future<void> _saveSettings() async {
    await saveSettingUsecase(setting: setting);
  }
}
