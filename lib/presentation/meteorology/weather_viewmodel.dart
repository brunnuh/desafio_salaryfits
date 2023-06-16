import 'dart:math';

import 'package:desafio_salaryfits/domain/domain.dart';

class WeatherViewModel {
  final String city;
  final String currentTemperature;
  final String airHumidity;
  final double speedWind;
  final String description;
  final String tempMax;
  final String tempMin;
  final String pressure;
  final String feelsLike;
  final int degreeWind;

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
    required this.degreeWind,
  });

  factory WeatherViewModel.empty() => WeatherViewModel(
        city: '',
        currentTemperature: '',
        airHumidity: '',
        speedWind: 0,
        description: '',
        tempMax: '',
        tempMin: '',
        feelsLike: '',
        pressure: '',
        degreeWind: 0,
      );

  String get degToDirection {
    List<String> directions = [
      'norte',
      'nordeste',
      'leste',
      'sudeste',
      'sul',
      'sudoeste',
      'oeste',
      'noroeste',
    ];

    int index = ((degreeWind + 22.5) % 360) ~/ 45;

    return directions[index];
  }

  String get speedWindMsToKm {
    return '${(speedWind * 3.6).toStringAsFixed(1).replaceAll('.', ',')}Km/h';
  }

  double get degreeWindoToRadi {
    return ((degreeWind + 90) * pi) / 180.0;
  }

  factory WeatherViewModel.toViewModel(WeatherEntity entity) {
    return WeatherViewModel(
      city: entity.city,
      currentTemperature: "${entity.currentTemperature.floor()}",
      airHumidity: '82%',
      speedWind: entity.speedWind,
      description: entity.description,
      tempMin: "${entity.tempMin.floor()}",
      tempMax: "${entity.tempMax.floor()}",
      pressure: "${entity.pressure}mbar",
      feelsLike: '${entity.feelsLike.floor()}°',
      degreeWind: entity.degreeWind,
    );
  }
}
