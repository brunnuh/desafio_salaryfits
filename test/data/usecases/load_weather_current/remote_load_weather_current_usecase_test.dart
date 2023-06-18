import 'package:desafio_salaryfits/data/data.dart';
import 'package:desafio_salaryfits/domain/domain.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When _mockCall() => when(
        () => this(
          method: Method.get,
          url: any(named: 'url'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
          params: any(named: 'params'),
        ),
      );

  void request(dynamic data) => _mockCall().thenAnswer((_) async => data);
  void mockErrorRequest(HttpError error) => _mockCall().thenThrow(error);
}

void main() {
  late final String url;
  late final ({double lat, double lon}) position;
  late final HttpClientSpy httpClient;
  late final RemoteLoadWeatherCurrentUsecase sut;
  late final Map<String, dynamic> weatherData;
  Map<String, dynamic> mockHttpClientResponse() => {
        "weather": [
          {
            "description": faker.lorem.sentence(),
          }
        ],
        "main": {
          "temp": faker.randomGenerator.decimal(),
          "feels_like": faker.randomGenerator.decimal(),
          "temp_min": faker.randomGenerator.decimal(),
          "temp_max": faker.randomGenerator.decimal(),
          "pressure": faker.randomGenerator.integer(1000),
          "humidity": faker.randomGenerator.integer(100),
        },
        "wind": {
          "speed": faker.randomGenerator.decimal(),
          "deg": faker.randomGenerator.integer(300),
        },
        "name": faker.address.city(),
      };

  setUp(() {
    position = (lat: faker.geo.latitude(), lon: faker.geo.longitude());
    url = faker.internet.httpsUrl();
    httpClient = HttpClientSpy();
    sut = RemoteLoadWeatherCurrentUsecase(httpClient: httpClient, url: url);

    weatherData = mockHttpClientResponse();
    httpClient.request(weatherData);
  });

  test('Should call http client with correct values', () async {
    await sut(position: position);

    verify(
      () => httpClient(
        method: Method.get,
        url: url,
        params: {
          'lat': position.lat,
          'lon': position.lon,
          'units': 'metric',
          'lang': 'pt_br',
        },
      ),
    ).called(1);
  });

  test('Should return weather on 200', () async {
    final weather = await sut(position: position);

    expect(
      weather,
      WeatherEntity(
        currentTemperature: weatherData['main']['temp'].toDouble(),
        description: weatherData['weather'][0]['description'],
        tempMin: weatherData['main']['temp_min'].toDouble(),
        tempMax: weatherData['main']['temp_max'].toDouble(),
        speedWind: weatherData['wind']['speed'].toDouble(),
        city: weatherData['name'],
        pressure: weatherData['main']['pressure'],
        feelsLike: weatherData['main']['feels_like'].toDouble(),
        degreeWind: weatherData['wind']['deg'],
        airHumidity: weatherData['main']['humidity'],
      ),
    );
  });

  test('Should return error on  400', () {
    httpClient.mockErrorRequest(HttpError.badRequest);

    final future = sut(position: position);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return error on  401', () {
    httpClient.mockErrorRequest(HttpError.unauthorized);

    final future = sut(position: position);

    expect(future, throwsA(DomainError.invalidCredentials));
  });
}
