import 'package:desafio_salaryfits/main/factories/usecases/usecases.dart';

import '../../../../presentation/presentation.dart';

NextDaysBloc makeNextDaysBloc() {
  return NextDaysBloc(
    loadWeatherFiveDaysUsecase: makeRemoteLoadWeatherFiveDaysUsecase(),
    loadSettingUsecase: makeLocalLoadSettingsUsecase(),
  );
}
