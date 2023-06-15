class WeatherEntity {
  final double currentTemperature;
  final String description;
  final double tempMin;
  final double tempMax;
  final double speedWind;
  final String city;

  WeatherEntity({
    required this.currentTemperature,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.speedWind,
    required this.city,
  });
}
