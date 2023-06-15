import 'package:desafio_salaryfits/domain/domain.dart';

class WeatherViewModel {
  final String city;
  final String currentTemperature;
  final String airHumidity;
  final String speedWind;
  final String description;
  final String tempMax;
  final String tempMin;
  final String pressure;
  final String feelsLike;

  WeatherViewModel({
    required this.city,
    required this.currentTemperature,
    required this.airHumidity,
    required this.speedWind,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.feelsLike,
  });

  factory WeatherViewModel.empty() => WeatherViewModel(
        city: '',
        currentTemperature: '',
        airHumidity: '',
        speedWind: '',
        description: '',
        tempMax: '',
        tempMin: '',
        feelsLike: '',
        pressure: '',
      );

  factory WeatherViewModel.toViewModel(WeatherEntity entity) {
    return WeatherViewModel(
      city: entity.city,
      currentTemperature: "${entity.currentTemperature.floor()}",
      airHumidity: '82%',
      speedWind: "${entity.speedWind}",
      description: entity.description,
      tempMin: "${entity.tempMin.floor()}°",
      tempMax: "${entity.tempMax.floor()}°",
      pressure: "${entity.pressure}mbar",
      feelsLike: '${entity.feelsLike.floor()}°',
    );
  }
}
