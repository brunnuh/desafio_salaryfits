part of 'next_days_bloc.dart';

sealed class NextDaysState {
  NextDaysState({required this.viewModels});
  final List<WeatherViewModel> viewModels;
}

class NextDaysInitial extends NextDaysState {
  NextDaysInitial({super.viewModels = const []});
}

class NextDaysLoadingState extends NextDaysState {
  NextDaysLoadingState({super.viewModels = const []});
}

class NextDaysLoaded extends NextDaysState {
  NextDaysLoaded({required super.viewModels});
}
