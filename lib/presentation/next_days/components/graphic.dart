import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class Graphic extends StatefulWidget {
  Graphic({
    super.key,
    this.temperatures = const [],
  }) : assert(temperatures.isNotEmpty);
  final List<int> temperatures;

  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  late List<FlSpot> spots;
  late List<int> spotsIndex;
  late List<LineChartBarData> lineBarsData;

  @override
  void initState() {
    super.initState();
    spots = widget.temperatures
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
        .toList();
    spotsIndex = spots.asMap().keys.toList();
    lineBarsData = [
      LineChartBarData(
        showingIndicators: spotsIndex,
        spots: spots,
      ),
    ];
  }

  double get higherTemperature {
    return spots.reduce((previo, next) => previo.y > next.y ? previo : next).y +
        1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: Sized.bigger.horizontal,
      child: LineChart(
        LineChartData(
          maxY: higherTemperature,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              showingIndicators: spotsIndex,
              color: Colors.white,
              spots: spots,
            ),
          ],
          lineTouchData: LineTouchData(
            enabled: false,
            handleBuiltInTouches: false,
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((lineBarSpot) {
                return const TouchedSpotIndicatorData(
                  FlLine(color: Colors.transparent),
                  FlDotData(show: false),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipMargin: 0,
              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                return lineBarsSpot.map((lineBarSpot) {
                  return LineTooltipItem(
                    "${lineBarSpot.y.toInt()}°",
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          showingTooltipIndicators: spotsIndex.map((index) {
            return ShowingTooltipIndicators([
              LineBarSpot(
                lineBarsData[0],
                lineBarsData.indexOf(lineBarsData[0]),
                lineBarsData[0].spots[index],
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
