import '../../../../domain/domain.dart';
import '../../../data/data.dart';
import '../../../main/factories/factories.dart';

LoadWeatherCurrentUsecase makeRemoteLoadWeaterCurrentFactory() {
  return RemoteLoadWeatherCurrentUsecase(
    httpClient: makeHttpClient(),
    url: makeApiUrl('weather'),
  );
}
