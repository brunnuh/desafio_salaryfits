import '../../../../main/factories/factories.dart';
import '../../../../presentation/presentation.dart';

SettingsBloc makeSettingsBloc() {
  return SettingsBloc(
    loadSettingUsecase: makeLocalLoadSettingsUsecase(),
    saveSettingUsecase: makeSaveSettingUsecaseFactory(),
  );
}
