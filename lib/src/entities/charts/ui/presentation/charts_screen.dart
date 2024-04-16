import 'package:fletch_charts/src/entities/charts/items/line_graph/line_graph.dart';
import 'package:flutter/material.dart';

part 'data/chart_data.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SweepRadialChart(
            //   value: 0.4,
            // ),

            LineGraph(
              verticalTexts: ChartData.lineText,
              horizontalTexts: ChartData.lineVerticalHorizontalText,
              values: ChartData.lineGraphDaysCommits,
            ),

            // SelectedBrokenSweepChart(
            //   selectedValue: 0.7,
            //   sweepAngle: 270,
            // ),

            // BarGraph(
            //   verticalTexts: ChartData.barGraphVerticalText,
            //   horizontalTexts: ChartData.barGraphVerticalText,
            //   values: ChartData.barGraphDaysCommits,
            //   maxPoint: const Point(7, 8),
            // ),

            // BrokenSweepChart(
            //   knobValue: 1,
            //   sweepPortionSizes: [
            //     0.5,
            //     0.15,
            //     0.15,
            //     0.2,
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
