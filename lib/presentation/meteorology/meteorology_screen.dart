import 'package:desafio_salaryfits/core/constants/sized.dart';
import 'package:flutter/material.dart';

import 'meteorology.dart';

class MeteorologyScreen extends StatefulWidget {
  const MeteorologyScreen({super.key});

  @override
  State<MeteorologyScreen> createState() => _MeteorologyScreenState();
}

class _MeteorologyScreenState extends State<MeteorologyScreen> {
  //TODO: mockado
  final current = MeteorologyViewModel(
    city: 'Uberlândia',
    airHumidity: '82%',
    currentTemperature: '19',
    windSpeed: '32,0km/h',
    description: 'Nublado',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          current.city,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
        actions: [
          const Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
            size: 32,
          ),
          Sized.small.horizontalSized,
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff5593DC),
      ),
      body: Container(
        color: const Color(0xff5593DC),
        padding: Sized.middle.all,
        child: ListView(
          children: [
            Sized.bigger.verticalSized,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  current.currentTemperature,
                  style: const TextStyle(
                    fontSize: 112,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: Sized.middle.vertical,
                  child: const Text(
                    "°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              current.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
