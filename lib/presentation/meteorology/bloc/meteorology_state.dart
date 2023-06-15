part of 'meteorology_bloc.dart';

sealed class MeteorologyState {
  final WeatherViewModel viewModel;

  MeteorologyState({required this.viewModel});
}

class MeteorologyInitial extends MeteorologyState {
  MeteorologyInitial() : super(viewModel: WeatherViewModel.empty());
}

class MeteorologyLoadingState extends MeteorologyState {
  MeteorologyLoadingState({required super.viewModel});
}

class MeteorologyLoadedWeatherState extends MeteorologyState {
  MeteorologyLoadedWeatherState({required super.viewModel});
}
