import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

part 'next_days_event.dart';
part 'next_days_state.dart';

class NextDaysBloc extends Bloc<NextDaysEvent, NextDaysState> {
  NextDaysBloc({
    required this.loadWeatherFiveDaysUsecase,
  }) : super(NextDaysInitial()) {
    on(_mapToState);
  }

  final LoadWeatherFiveDaysUsecase loadWeatherFiveDaysUsecase;

  void _mapToState(NextDaysEvent event, Emitter emit) async {
    emit(NextDaysLoadingState());
    switch (event) {
      case LoadNextDays():
        final viewModels = await _loadNextFiveDays();
        emit(NextDaysLoaded(viewModels: viewModels));
    }
  }

  Future<List<WeatherViewModel>> _loadNextFiveDays() async {
    final nextFiveDays = await loadWeatherFiveDaysUsecase();

    return nextFiveDays.map((e) => WeatherViewModel.toViewModel(e)).toList();
  }
}
