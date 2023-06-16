part of 'meteorology_bloc.dart';

sealed class MeteorologyEvent {
  final WeatherViewModel? weatherViewModel;
  MeteorologyEvent({this.weatherViewModel});
}

class MeterologyLoadWeatherEvent extends MeteorologyEvent {
  final bool isFirstLoad;
  MeterologyLoadWeatherEvent({
    super.weatherViewModel,
    this.isFirstLoad = false,
  });
}

class MeterologySetWeatherEvent extends MeteorologyEvent {
  MeterologySetWeatherEvent({required super.weatherViewModel});
}
