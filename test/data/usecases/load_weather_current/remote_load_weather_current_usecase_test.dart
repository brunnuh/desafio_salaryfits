import 'package:desafio_salaryfits/data/data.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  void request(dynamic data) => when(
        () => this(
          method: Method.get,
          url: any(named: 'url'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
          params: any(named: 'params'),
        ),
      ).thenAnswer((_) async => data);
}

void main() {
  late final String url;
  late final ({double lat, double lon}) position;
  late final HttpClientSpy httpClient;
  late final RemoteLoadWeatherCurrentUsecase sut;

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

    httpClient.request(mockHttpClientResponse());
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
}
