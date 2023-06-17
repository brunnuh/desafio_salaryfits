part of 'meteorology_bloc.dart';

sealed class MeteorologyState {
  final WeatherViewModel viewModel;
  final SettingEntity settingEntity;

  MeteorologyState({
    required this.viewModel,
    required this.settingEntity,
  });
}

class MeteorologyInitial extends MeteorologyState {
  MeteorologyInitial()
      : super(
          viewModel: WeatherViewModel.empty(),
          settingEntity: SettingEntity.empty(),
        );
}

class MeteorologyLoadingState extends MeteorologyState {
  final bool isFirstLoad;
  MeteorologyLoadingState({
    required super.viewModel,
    required super.settingEntity,
    this.isFirstLoad = false,
  });
}

class MeteorologyLoadedWeatherState extends MeteorologyState {
  MeteorologyLoadedWeatherState({
    required super.viewModel,
    required super.settingEntity,
  });
}
