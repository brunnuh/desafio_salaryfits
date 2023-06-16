class WeatherEntity {
  final double currentTemperature;
  final String description;
  final double tempMin;
  final double tempMax;
  final String city;
  final int pressure;
  final double feelsLike;
  final double speedWind;
  final int degreeWind;
  final DateTime? dateTime;

  WeatherEntity({
    required this.currentTemperature,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.speedWind,
    required this.city,
    required this.pressure,
    required this.feelsLike,
    required this.degreeWind,
    this.dateTime,
  });
}
