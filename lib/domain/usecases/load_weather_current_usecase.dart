import '../domain.dart';

abstract interface class LoadWeatherCurrentUsecase {
  Future<WeatherEntity> call();
}
