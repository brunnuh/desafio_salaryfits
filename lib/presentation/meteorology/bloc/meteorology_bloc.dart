import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

part 'meteorology_event.dart';
part 'meteorology_state.dart';

class MeteorologyBloc extends Bloc<MeteorologyEvent, MeteorologyState> {
  MeteorologyBloc(
      {required LoadWeatherCurrentUsecase loadWeatherCurrentUsecase,
      required GetPositionCurrentUsecase getPositionCurrentUsecase})
      : _loadWeatherCurrentUsecase = loadWeatherCurrentUsecase,
        _getPositionCurrentUsecase = getPositionCurrentUsecase,
        super(MeteorologyInitial()) {
    on(_mapToState);
  }

  final LoadWeatherCurrentUsecase _loadWeatherCurrentUsecase;
  final GetPositionCurrentUsecase _getPositionCurrentUsecase;

  void _mapToState(MeteorologyEvent event, Emitter emit) async {
    switch (event) {
      case MeterologyLoadWeatherEvent(isFirstLoad: var isFirstLoad):
        emit(MeteorologyLoadingState(
          isFirstLoad: isFirstLoad,
          viewModel: event.weatherViewModel ?? WeatherViewModel.empty(),
        ));
        _loadWeatherCurrent();
      case MeterologySetWeatherEvent(weatherViewModel: var viewModel):
        emit(MeteorologyLoadedWeatherState(viewModel: viewModel!));
    }
  }

  void _loadWeatherCurrent() async {
    final position = await _getPositionCurrentUsecase();
    final weatherEntity = await _loadWeatherCurrentUsecase(position: position);

    add(
      MeterologySetWeatherEvent(
        weatherViewModel: WeatherViewModel.toViewModel(weatherEntity),
      ),
    );
  }
}
