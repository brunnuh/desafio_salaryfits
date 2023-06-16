import 'package:desafio_salaryfits/core/constants/sized.dart';
import 'package:desafio_salaryfits/presentation/next_days/components/components.dart';
import 'package:desafio_salaryfits/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NextDaysScreen extends StatefulWidget {
  const NextDaysScreen({super.key, required this.bloc});
  final NextDaysBloc bloc;

  @override
  State<NextDaysScreen> createState() => _NextDaysScreenState();
}

class _NextDaysScreenState extends State<NextDaysScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(LoadNextDays());
  }

  @override
  void didUpdateWidget(covariant NextDaysScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.bloc.add(LoadNextDays());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<NextDaysBloc, NextDaysState>(
        bloc: widget.bloc,
        builder: (context, state) {
          final viewModels = state.viewModels;
          return Padding(
            padding: Sized.middle.all,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Previsão para 5 dias',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                  ),
                ),
                Sized.bigger.verticalSized,
                Sized.bigger.verticalSized,
                if (state is NextDaysLoadingState) ...[
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                ] else ...[
                  _NextFiveDaysGraphics(viewModels: viewModels),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NextFiveDaysGraphics extends StatefulWidget {
  const _NextFiveDaysGraphics({this.viewModels = const []});
  final List<WeatherViewModel> viewModels;

  @override
  State<_NextFiveDaysGraphics> createState() => _NextFiveDaysGraphicsState();
}

class _NextFiveDaysGraphicsState extends State<_NextFiveDaysGraphics> {
  late List<WeatherViewModel> viewModels;

  @override
  void initState() {
    super.initState();
    viewModels = widget.viewModels;
  }

  @override
  void didUpdateWidget(covariant _NextFiveDaysGraphics oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModels != oldWidget.viewModels) {
      viewModels = widget.viewModels;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 340,
        child: Stack(
          children: [
            _NextFiveDaysTitles(viewModels: widget.viewModels),
            if (viewModels.isNotEmpty) ...[
              Positioned(
                top: 90,
                width: constraints.maxWidth,
                child: Graphic(
                  temperatures: widget.viewModels
                      .map((e) => int.parse(e.tempMax))
                      .toList(),
                ),
              ),
              Positioned(
                top: 170,
                width: constraints.maxWidth,
                child: Graphic(
                  temperatures: widget.viewModels
                      .map((e) => int.parse(e.tempMin))
                      .toList(),
                ),
              )
            ],
          ],
        ),
      );
    });
  }
}

class _NextFiveDaysTitles extends StatelessWidget {
  const _NextFiveDaysTitles({this.viewModels = const []});
  final List<WeatherViewModel> viewModels;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(viewModels.length, (index) {
        String value = DateFormat.EEEE().format(now);
        if (index == 0) {
          value = 'Hoje';
        }

        final child = Container(
          height: double.maxFinite,
          width: 65,
          padding: Sized.middle.vertical,
          decoration: BoxDecoration(
            color: index == 0 ? Colors.white10 : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    DateFormat.Md().format(now),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                viewModels[index].speedWindMsToKm,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
        now = now.add(const Duration(days: 1));
        return child;
      }),
    );
  }
}
