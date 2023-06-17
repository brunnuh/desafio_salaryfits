part of 'meteorology_bloc.dart';

sealed class MeteorologyEvent {
  final WeatherViewModel? weatherViewModel;
  MeteorologyEvent({this.weatherViewModel});
}

class MeterologyLoadWeatherEvent extends MeteorologyEvent {
  final bool isFirstLoad;
  final SettingEntity? setting;
  MeterologyLoadWeatherEvent({
    super.weatherViewModel,
    this.isFirstLoad = false,
    this.setting,
  });
}
