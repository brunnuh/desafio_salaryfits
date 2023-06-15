import 'package:bloc/bloc.dart';
import 'package:desafio_salaryfits/domain/usecases/load_weather_current_usecase.dart';

import '../../presentation.dart';

part 'meteorology_event.dart';
part 'meteorology_state.dart';

class MeteorologyBloc extends Bloc<MeteorologyEvent, MeteorologyState> {
  MeteorologyBloc({
    required LoadWeatherCurrentUsecase loadWeatherCurrentUsecase,
  })  : _loadWeatherCurrentUsecase = loadWeatherCurrentUsecase,
        super(MeteorologyInitial()) {
    on(_mapToState);
  }

  final LoadWeatherCurrentUsecase _loadWeatherCurrentUsecase;

  void _mapToState(MeteorologyEvent event, Emitter emit) async {
    emit(MeteorologyLoadingState(
      viewModel: event.weatherViewModel ?? WeatherViewModel.empty(),
    ));

    switch (event) {
      case MeterologyLoadWeatherEvent():
        _loadWeatherCurrent();
      case MeterologySetWeatherEvent(weatherViewModel: var viewModel):
        emit(MeteorologyLoadedWeatherState(viewModel: viewModel!));
    }
  }

  void _loadWeatherCurrent() async {
    //TODO: pegar por outro lugar
    const position = (lat: -18.9777556, long: -48.2676753);

    final weatherEntity = await _loadWeatherCurrentUsecase(position: position);

    add(
      MeterologySetWeatherEvent(
        weatherViewModel: WeatherViewModel.toViewModel(weatherEntity),
      ),
    );
  }
}
