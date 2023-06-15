import 'package:desafio_salaryfits/main/factories/screens/meteorology_screen/meteorology_screen_factory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 48, 88, 219),
        ),
        useMaterial3: true,
      ),
      home: makeMeteorologyScreen(),
    );
  }
}
