import 'package:bloc/bloc.dart';
import 'package:desafio_salaryfits/domain/usecases/load_weather_current_usecase.dart';

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
    switch (event) {
      case MeterologyLoadWeatherEvent():
        _loadWeatherCurrent();
    }
  }

  void _loadWeatherCurrent() async {
    //TODO: pegar por outro lugar
    const position = (lat: -18.9777556, long: -48.2676753);

    await _loadWeatherCurrentUsecase(position: position);
  }
}
