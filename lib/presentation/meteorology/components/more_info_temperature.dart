import 'package:desafio_salaryfits/domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../presentation.dart';

class MoreInfoTemperature extends StatelessWidget {
  const MoreInfoTemperature({
    super.key,
    required this.viewModel,
    required this.unit,
  });
  final WeatherViewModel viewModel;
  final TemperatureUnit unit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _InfosWind(
              viewModel: viewModel,
              unit: unit,
            ),
          ),
          Sized.small.horizontalSized,
          Expanded(
            child: _InfosAir(viewModel: viewModel),
          ),
        ],
      ),
    );
  }
}

class _InfosAir extends StatelessWidget {
  const _InfosAir({
    required this.viewModel,
  });

  final WeatherViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sized.middle.all,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _ListTile(
            title: 'Umidade',
            trailing: viewModel.airHumidity,
          ),
          Sized.middle.verticalSized,
          _ListTile(
            title: 'Sensação',
            trailing: viewModel.feelsLike,
          ),
          Sized.middle.verticalSized,
          _ListTile(
            title: 'Pressão',
            trailing: viewModel.pressure,
          ),
          Sized.middle.verticalSized,
        ],
      ),
    );
  }
}

class _InfosWind extends StatelessWidget {
  const _InfosWind({
    required this.viewModel,
    required this.unit,
  });

  final WeatherViewModel viewModel;
  final TemperatureUnit unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sized.middle.all,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.degToDirection,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  unit == TemperatureUnit.celcius
                      ? viewModel.speedWindMsToKm
                      : viewModel.speedWindMilesHour,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Sized.middle.horizontalSized,
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  ImageAssets.compass,
                  height: 55,
                ),
                Positioned(
                  top: 22,
                  left: 15,
                  child: Transform.rotate(
                    angle: viewModel.degreeWindoToRadi,
                    child: Image.asset(
                      ImageAssets.arrowRight,
                      height: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    required this.trailing,
  });

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          trailing,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
