import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RemoteLoadWeatherCurrentUsecase implements LoadWeatherCurrentUsecase {
  RemoteLoadWeatherCurrentUsecase({
    required this.httpClient,
    required this.url,
    required this.locationDevice,
  });

  final HttpClient httpClient;
  final LocationDevice locationDevice;
  final String url;

  @override
  Future<WeatherEntity> call() async {
    final position = await locationDevice();

    final response = await httpClient(
      url: url,
      method: Method.get,
      params: {
        'lat': position.lat,
        'lon': position.lon,
        'units': 'metric',
      },
    );

    return RemoteWeatherModel.fromJson(response).toEntity;
  }
}
