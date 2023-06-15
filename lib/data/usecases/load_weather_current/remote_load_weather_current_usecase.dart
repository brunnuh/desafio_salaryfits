import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RemoteLoadWeatherCurrentUsecase implements LoadWeatherCurrentUsecase {
  RemoteLoadWeatherCurrentUsecase({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  @override
  Future<WeatherEntity> call({
    required ({double lat, double long}) position,
  }) async {
    final response = await httpClient(url: url, method: Method.get);

    return WeatherEntity(
        currentTemperature: 2,
        description: 'description',
        tempMin: 2,
        tempMax: 2,
        speedWind: 2,
        city: 'city');
  }
}
