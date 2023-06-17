import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

part 'meteorology_event.dart';
part 'meteorology_state.dart';

class MeteorologyBloc extends Bloc<MeteorologyEvent, MeteorologyState> {
  MeteorologyBloc({
    required LoadWeatherCurrentUsecase loadWeatherCurrentUsecase,
    required GetPositionCurrentUsecase getPositionCurrentUsecase,
    required LoadSettingUsecase loadSettingUsecase,
  })  : _loadWeatherCurrentUsecase = loadWeatherCurrentUsecase,
        _getPositionCurrentUsecase = getPositionCurrentUsecase,
        _loadSettingUsecase = loadSettingUsecase,
        super(MeteorologyInitial()) {
    on(_mapToState);
  }

  final LoadWeatherCurrentUsecase _loadWeatherCurrentUsecase;
  final GetPositionCurrentUsecase _getPositionCurrentUsecase;
  final LoadSettingUsecase _loadSettingUsecase;

  void _mapToState(MeteorologyEvent event, Emitter emit) async {
    switch (event) {
      case MeterologyLoadWeatherEvent(isFirstLoad: var isFirstLoad):
        if (isFirstLoad) {
          await _loadSettings();
        }
        emit(MeteorologyLoadingState(
          isFirstLoad: isFirstLoad,
          viewModel: event.weatherViewModel ?? WeatherViewModel.empty(),
          settingEntity: setting,
        ));
        await _loadWeatherCurrent();
        emit(MeteorologyLoadedWeatherState(
          viewModel: viewModel,
          settingEntity: setting,
        ));
    }
  }

  SettingEntity setting = SettingEntity.empty();
  WeatherViewModel viewModel = WeatherViewModel.empty();

  Future<void> _loadWeatherCurrent() async {
    final position = await _getPositionCurrentUsecase();
    final weatherEntity = await _loadWeatherCurrentUsecase(
      position: position,
      settingEntity: setting,
    );

    viewModel = WeatherViewModel.toViewModel(weatherEntity);
  }

  Future<void> _loadSettings() async {
    final result = await _loadSettingUsecase();
    if (result != null) {
      setting = result;
    }
  }
}
