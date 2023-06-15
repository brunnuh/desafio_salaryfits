import 'package:desafio_salaryfits/data/usecases/load_weather_current/remote_load_weather_current_usecase.dart';
import 'package:desafio_salaryfits/domain/domain.dart';
import 'package:desafio_salaryfits/main/factories/device/location_device_factory.dart';
import 'package:desafio_salaryfits/main/factories/http/http.dart';

LoadWeatherCurrentUsecase makeRemoteLoadWeaterCurrentFactory() {
  return RemoteLoadWeatherCurrentUsecase(
    httpClient: makeHttpClient(),
    url: makeApiUrl('2.5/weather'),
    locationDevice: makeLocationFactory(),
  );
}
