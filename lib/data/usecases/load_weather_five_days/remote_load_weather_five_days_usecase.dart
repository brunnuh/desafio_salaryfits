import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteLoadWeatherFiveDaysUsecase implements LoadWeatherFiveDaysUsecase {
  RemoteLoadWeatherFiveDaysUsecase({
    required this.httpClient,
    required this.url,
    required this.locationDevice,
  });
  final HttpClient httpClient;
  final String url;
  final LocationDevice locationDevice;
  @override
  Future<List<WeatherEntity>> call() async {
    final forecast = <WeatherEntity>[];
    final position = await locationDevice();

    final response = await httpClient(method: Method.get, url: url, params: {
      'lat': position.lat,
      'lon': position.lon,
      'units': 'metric',
    });

    final data = response['list'] as List<dynamic>;

    for (var json in data) {
      if (forecast.length >= 5) break;
      final entity = RemoteWeatherModel.fromJson(json).toEntity;
      final containDay = forecast.any((element) {
        final sameDay = element.dateTime?.day == entity.dateTime?.day;

        return sameDay;
      });
      if (containDay) {
        continue;
      }
      forecast.add(entity);
    }

    return forecast;
  }
}
