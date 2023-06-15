import 'package:desafio_salaryfits/domain/domain.dart';

class RemoteWeatherModel {
  final double currentTemperature;
  final String description;
  final double tempMin;
  final double tempMax;
  final double speedWind;
  final String city;

  RemoteWeatherModel({
    required this.currentTemperature,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.speedWind,
    required this.city,
  });

  WeatherEntity get toEntity {
    return WeatherEntity(
      currentTemperature: currentTemperature,
      description: description,
      tempMin: tempMin,
      tempMax: tempMax,
      speedWind: speedWind,
      city: city,
    );
  }

  factory RemoteWeatherModel.fromJson(Map<String, dynamic> map) {
    return RemoteWeatherModel(
      currentTemperature: map['main']['temp']?.toDouble() ?? 0.0,
      description: map['weather'][0]['description'] ?? '',
      tempMin: map['main']['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['main']['temp_max']?.toDouble() ?? 0.0,
      speedWind: map['wind']['speed']?.toDouble() ?? 0.0,
      city: map['name'] ?? '',
    );
  }
}
