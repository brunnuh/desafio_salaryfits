import 'package:desafio_salaryfits/domain/domain.dart';

class RemoteWeatherModel {
  final double currentTemperature;
  final String description;
  final double tempMin;
  final double tempMax;
  final double speedWind;
  final String city;
  final int pressure;
  final double feelsLike;

  RemoteWeatherModel({
    required this.currentTemperature,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.speedWind,
    required this.city,
    required this.pressure,
    required this.feelsLike,
  });

  WeatherEntity get toEntity {
    return WeatherEntity(
      currentTemperature: currentTemperature,
      description: description,
      tempMin: tempMin,
      tempMax: tempMax,
      speedWind: speedWind,
      city: city,
      feelsLike: feelsLike,
      pressure: pressure,
    );
  }

  factory RemoteWeatherModel.fromJson(Map<String, dynamic> map) {
    return RemoteWeatherModel(
      currentTemperature: map['main']['temp']?.toDouble() ?? 0.0,
      tempMin: map['main']['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['main']['temp_max']?.toDouble() ?? 0.0,
      feelsLike: map['main']['feels_like']?.toDouble() ?? 0.0,
      pressure: map['main']['pressure'] ?? 0,
      description: map['weather'][0]['description'] ?? '',
      speedWind: map['wind']['speed']?.toDouble() ?? 0.0,
      city: map['name'] ?? '',
    );
  }
}
