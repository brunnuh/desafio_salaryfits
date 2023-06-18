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
  final int airHumidity;

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
    required this.airHumidity,
    this.dateTime,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.currentTemperature == currentTemperature &&
        other.description == description &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.city == city &&
        other.pressure == pressure &&
        other.feelsLike == feelsLike &&
        other.speedWind == speedWind &&
        other.degreeWind == degreeWind &&
        other.dateTime == dateTime &&
        other.airHumidity == airHumidity;
  }

  @override
  int get hashCode {
    return currentTemperature.hashCode ^
        description.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        city.hashCode ^
        pressure.hashCode ^
        feelsLike.hashCode ^
        speedWind.hashCode ^
        degreeWind.hashCode ^
        dateTime.hashCode ^
        airHumidity.hashCode;
  }
}
