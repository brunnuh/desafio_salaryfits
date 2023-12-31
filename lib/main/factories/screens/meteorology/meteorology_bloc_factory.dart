import '../../../../presentation/presentation.dart';
import '../../usecases/usecases.dart';

MeteorologyBloc makeMeteorologyBloc() {
  return MeteorologyBloc(
    loadWeatherCurrentUsecase: makeRemoteLoadWeaterCurrentFactory(),
    getPositionCurrentUsecase: makeGetPositionCurrentFactory(),
    loadSettingUsecase: makeLocalLoadSettingsUsecase(),
  );
}
