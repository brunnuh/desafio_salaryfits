part of 'meteorology_bloc.dart';

sealed class MeteorologyState {
  final WeatherViewModel viewModel;

  MeteorologyState({required this.viewModel});
}

class MeteorologyInitial extends MeteorologyState {
  MeteorologyInitial({required super.viewModel});
}

class MeteorologyLoadedWeatherState extends MeteorologyState {
  MeteorologyLoadedWeatherState({required super.viewModel});
}
