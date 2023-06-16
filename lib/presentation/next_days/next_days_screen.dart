import 'package:desafio_salaryfits/core/constants/sized.dart';
import 'package:desafio_salaryfits/presentation/next_days/bloc/next_days_bloc.dart';
import 'package:desafio_salaryfits/presentation/next_days/components/components.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
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
            _NextFiveDaysGraphics(),
          ],
        ),
      ),
    );
  }
}

class _NextFiveDaysGraphics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 340,
        child: Stack(
          children: [
            _NextFiveDaysTitles(),
            Positioned(
              top: 150,
              width: constraints.maxWidth,
              child: const Graphic(),
            ),
          ],
        ),
      );
    });
  }
}

class _NextFiveDaysTitles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        String value = DateFormat.EEEE().format(now);

        if (index == 0) {
          value = 'Hoje';
        }
        final child = Container(
          height: double.maxFinite,
          width: 65,
          padding: Sized.bigger.vertical,
          decoration: BoxDecoration(
            color: index == 0 ? Colors.white10 : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
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
        );
        now = now.add(const Duration(days: 1));
        return child;
      }),
    );
  }
}
