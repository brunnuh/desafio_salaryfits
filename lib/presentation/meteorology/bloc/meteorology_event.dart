part of 'meteorology_bloc.dart';

sealed class MeteorologyEvent {
  final WeatherViewModel? weatherViewModel;
  MeteorologyEvent({this.weatherViewModel});
}

class MeterologyLoadWeatherEvent extends MeteorologyEvent {
  MeterologyLoadWeatherEvent({super.weatherViewModel});
}

class MeterologySetWeatherEvent extends MeteorologyEvent {
  MeterologySetWeatherEvent({required super.weatherViewModel});
}
