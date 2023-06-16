import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';

part 'next_days_event.dart';
part 'next_days_state.dart';

class NextDaysBloc extends Bloc<NextDaysEvent, NextDaysState> {
  NextDaysBloc({
    required this.loadWeatherFiveDaysUsecase,
  }) : super(NextDaysInitial()) {
    on(_mapToState);
  }

  final LoadWeatherFiveDaysUsecase loadWeatherFiveDaysUsecase;

  void _mapToState(NextDaysEvent event, Emitter emit) {
    switch (event) {
      case LoadNextDays():
        loadNextFiveDays();
    }
  }

  Future<void> loadNextFiveDays() async {
    final nextFiveDays = await loadWeatherFiveDaysUsecase();
  }
}
