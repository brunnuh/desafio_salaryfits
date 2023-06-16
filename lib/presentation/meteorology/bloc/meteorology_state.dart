part of 'meteorology_bloc.dart';

sealed class MeteorologyState {
  final WeatherViewModel viewModel;

  MeteorologyState({required this.viewModel});
}

class MeteorologyInitial extends MeteorologyState {
  MeteorologyInitial() : super(viewModel: WeatherViewModel.empty());
}

class MeteorologyLoadingState extends MeteorologyState {
  final bool isFirstLoad;
  MeteorologyLoadingState({
    required super.viewModel,
    this.isFirstLoad = false,
  });
}

class MeteorologyLoadedWeatherState extends MeteorologyState {
  MeteorologyLoadedWeatherState({required super.viewModel});
}
