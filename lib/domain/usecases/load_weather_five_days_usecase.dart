import '../../domain/domain.dart';

abstract interface class LoadWeatherFiveDaysUsecase {
  Future<List<WeatherEntity>> call(SettingEntity? settingEntity);
}
