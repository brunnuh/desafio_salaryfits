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
    required ({double lat, double lon}) position,
  }) async {
    final (:lat, :lon) = position;

    final response = await httpClient(
      url: url,
      method: Method.get,
      params: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      },
    );

    return RemoteWeatherModel.fromJson(response).toEntity;
  }
}
