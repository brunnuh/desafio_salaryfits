import '../domain.dart';

abstract interface class LoadWeatherCurrentUsecase {
  Future<WeatherEntity> call({required ({double lat, double lon}) position});
}
