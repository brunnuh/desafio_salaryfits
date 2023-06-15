import 'package:desafio_salaryfits/domain/domain.dart';

class WeatherViewModel {
  final String city;
  final String currentTemperature;
  final String airHumidity;
  final String speedWind;
  final String description;

  WeatherViewModel({
    required this.city,
    required this.currentTemperature,
    required this.airHumidity,
    required this.speedWind,
    required this.description,
  });

  factory WeatherViewModel.empty() => WeatherViewModel(
        city: '',
        currentTemperature: '',
        airHumidity: '',
        speedWind: '',
        description: '',
      );

  factory WeatherViewModel.toViewModel(WeatherEntity entity) {
    return WeatherViewModel(
      city: entity.city,
      currentTemperature: entity.currentTemperature.floor().toString(),
      airHumidity: '',
      speedWind: entity.speedWind.toString(),
      description: entity.description,
    );
  }
}
