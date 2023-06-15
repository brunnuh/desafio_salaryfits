part of 'meteorology_bloc.dart';

sealed class MeteorologyEvent {}

class MeterologyLoadWeatherEvent extends MeteorologyEvent {}

class MeterologySetWeatherEvent extends MeteorologyEvent {
  final WeatherViewModel weatherViewModel;

  MeterologySetWeatherEvent({required this.weatherViewModel});
}
