import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../presentation.dart';
import 'components/components.dart';

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
    widget.bloc.add(MeterologyLoadWeatherEvent(isFirstLoad: true));
  }

  @override
  void didUpdateWidget(covariant MeteorologyScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.bloc.add(MeterologyLoadWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeteorologyBloc, MeteorologyState>(
      bloc: widget.bloc,
      builder: (context, state) {
        final current = state.viewModel;
        final loading = state is MeteorologyLoadingState;
        final firstLoad = loading && state.isFirstLoad;

        return Scaffold(
          appBar: firstLoad
              ? null
              : AppBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        current.city,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (loading) ...[
                        const Text(
                          'Atualizando ...',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ] else ...[
                        Sized.middle.verticalSized,
                      ]
                    ],
                  ),
                  actions: [
                    const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    InkWell(
                      onTap: () => widget.bloc.add(MeterologyLoadWeatherEvent(
                          weatherViewModel: current)),
                      child: const Icon(
                        Icons.refresh_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Sized.small.horizontalSized,
                  ],
                  centerTitle: true,
                  backgroundColor: const Color(0xff5593DC),
                ),
          body: Container(
            color: const Color(0xff5593DC),
            padding: Sized.middle.all,
            child: firstLoad
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : ListView(
                    children: [
                      Sized.bigger.verticalSized,
                      _CurrentTemp(
                        currentTemperature: current.currentTemperature,
                      ),
                      Text(
                        "${current.description} ${current.tempMin}/${current.tempMax}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Sized.bigger.verticalSized,
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(90, 255, 255, 255),
                          ),
                        ),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Previsão para 5 dias',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/nextDays');
                        },
                      ),
                      Sized.middle.verticalSized,
                      MoreInfoTemperature(viewModel: current),
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
