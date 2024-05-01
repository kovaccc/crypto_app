import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TokenPriceGraph extends StatelessWidget {
  final List<double> prices;

  const TokenPriceGraph({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 65,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    final axisTitle = value == meta.max || value == meta.min
                        ? Text(meta.formattedValue)
                        : const SizedBox.shrink();
                    return SideTitleWidget(
                        axisSide: meta.axisSide, child: axisTitle);
                  }),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: prices
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              dotData: const FlDotData(show: false),
            )
          ],
        ),
      ),
    );
  }
}
