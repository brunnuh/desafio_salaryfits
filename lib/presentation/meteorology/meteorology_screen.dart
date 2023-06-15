import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import 'meteorology.dart';

class MeteorologyScreen extends StatefulWidget {
  const MeteorologyScreen({
    super.key,
    required this.bloc,
  });
  final MeteorologyBloc bloc;

  @override
  State<MeteorologyScreen> createState() => _MeteorologyScreenState();
}

class _MeteorologyScreenState extends State<MeteorologyScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(MeterologyLoadWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeteorologyBloc, MeteorologyState>(
      bloc: widget.bloc,
      builder: (context, state) {
        final current = state.viewModel;
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
                _CurrentTemp(
                  currentTemperature: current.currentTemperature,
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
      },
    );
  }
}

class _CurrentTemp extends StatelessWidget {
  const _CurrentTemp({
    required this.currentTemperature,
  });

  final String currentTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTemperature,
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
    );
  }
}
