import 'package:desafio_salaryfits/data/usecases/load_weather_five_days/remote_load_weather_five_days_usecase.dart';
import 'package:desafio_salaryfits/main/factories/device/location_device_factory.dart';
import 'package:desafio_salaryfits/main/factories/http/http.dart';

import '../../../domain/domain.dart';

LoadWeatherFiveDaysUsecase makeRemoteLoadWeatherFiveDaysUsecase() {
  return RemoteLoadWeatherFiveDaysUsecase(
    httpClient: makeHttpClient(),
    url: makeApiUrl('forecast'),
    locationDevice: makeLocationFactory(),
  );
}
