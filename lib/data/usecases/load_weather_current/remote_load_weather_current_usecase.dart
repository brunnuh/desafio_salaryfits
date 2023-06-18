import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RemoteLoadWeatherCurrentUsecase implements LoadWeatherCurrentUsecase {
  RemoteLoadWeatherCurrentUsecase({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  Map<String, dynamic> _setSettingsParams(SettingEntity? entity) {
    return {
      'units':
          entity?.unit == TemperatureUnit.fahrenheit ? 'imperial' : 'metric',
      'lang': entity?.language == Language.en ? 'en' : 'pt_br',
    };
  }

  @override
  Future<WeatherEntity> call({
    required ({double lat, double lon}) position,
    SettingEntity? settingEntity,
  }) async {
    final (:lat, :lon) = position;

    try {
      final response = await httpClient(
        url: url,
        method: Method.get,
        params: {
          'lat': lat,
          'lon': lon,
          ..._setSettingsParams(settingEntity),
        },
      );

      return RemoteWeatherModel.fromJson(response).toEntity;
    } catch (error) {
      throw error == HttpError.badRequest
          ? DomainError.unexpected
          : DomainError.invalidCredentials;
    }
  }
}
