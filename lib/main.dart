import 'package:desafio_salaryfits/data/usecases/load_weather_current/remote_load_weather_current_usecase.dart';
import 'package:desafio_salaryfits/infra/http/http_adapter.dart';
import 'package:desafio_salaryfits/presentation/meteorology/bloc/meteorology_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: criar factories para injetar
    final httpClient = HttpAdapter(client: Client());
    const url =
        'https://api.openweathermap.org/data/2.5/weather?lang=pt_br&lat=-18.9777556&lon=-48.2676753&units=metric&appid=77aecac6a7fed4b08aec405228835ffd';
    final loadWeatherCurrentUsecase =
        RemoteLoadWeatherCurrentUsecase(httpClient: httpClient, url: url);
    final me =
        MeteorologyBloc(loadWeatherCurrentUsecase: loadWeatherCurrentUsecase);
    return MaterialApp(
      title: 'Desafio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 48, 88, 219),
        ),
        useMaterial3: true,
      ),
      home: MeteorologyScreen(bloc: me),
    );
  }
}
