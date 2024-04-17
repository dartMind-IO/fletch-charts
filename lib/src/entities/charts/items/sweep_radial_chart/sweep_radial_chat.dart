import 'package:fletch_charts/src/entities/charts/items/broken_sweep_chart/broken_sweep_chart.dart';
import 'package:fletch_charts/src/entities/charts/items/sweep_radial_chart/custom/painter.dart';
import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/functions/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SweepRadialChart extends StatelessWidget {
  final double value;
  final double thickness;
  final double knobDiameter;

  const SweepRadialChart({
    super.key,
    required this.value,
    this.thickness = 30,
    this.knobDiameter = 45,
  }) : assert(value <= 1 && value >= 0,
            'value must be normalized between 0 and 1');

  @override
  Widget build(BuildContext context) {
    final Size painterSize = Size(416, 213.27.doubled);
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(thickness),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox.fromSize(
              size: painterSize,
              child: Transform.flip(
                flipY: true,
                flipX: true,
                child: CustomPaint(
                  size: painterSize,
                  painter: SweepRadialGradientPainter(
                    thickness: thickness,
                    value: value,
                    size: painterSize,
                    gradientColors: [
                      AppColors.gradient2,
                      AppColors.gradient1,
                    ],
                  ),
                ),
              ),
            ),
            SlidingKnob(
              value: value,
              diameter: knobDiameter,
              parentSize: painterSize,
            ),
          ],
        ),
      );
    });
  }
}
