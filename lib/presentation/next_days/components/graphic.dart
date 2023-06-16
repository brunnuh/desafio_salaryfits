import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class Graphic extends StatefulWidget {
  const Graphic({super.key});

  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  final spots = [
    const FlSpot(0, 33),
    const FlSpot(1, 31),
    const FlSpot(2, 31),
    const FlSpot(3, 31),
    const FlSpot(4, 30),
    const FlSpot(5, 28),
  ];
  late List<int> spotsIndex;
  late List<LineChartBarData> lineBarsData;

  double get higherTemperature {
    return spots.reduce((a, b) => a.y > b.y ? a : b).y + 1;
  }

  @override
  void initState() {
    super.initState();
    spotsIndex = spots.asMap().keys.toList();
    lineBarsData = [
      LineChartBarData(
        showingIndicators: spotsIndex,
        spots: spots,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: Sized.middle.horizontal,
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
              isCurved: true,
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
