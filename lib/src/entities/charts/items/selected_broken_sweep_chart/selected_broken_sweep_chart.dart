import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';

part 'custom/painter.dart';

part 'custom/text_gradient.dart';

class SelectedBrokenSweepChart extends StatelessWidget {
  final double selectedValue;
  final double sweepAngle;
  final double thickness;

  /// gap is a fraction of [sweepAngle]
  final double gap;

  const SelectedBrokenSweepChart({
    super.key,
    required this.selectedValue,
    this.sweepAngle = 180,
    this.thickness = 15,
    this.gap = 0.06,
  });

  @override
  Widget build(BuildContext context) {
    final Size painterSize = Size(416, 213.27.doubled);
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(thickness),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Transform.rotate(
              angle:
                  sweepAngle == 180 ? 0 : -(sweepAngle - 180).halfed.toRadians,
              child: SizedBox.fromSize(
                size: painterSize,
                child: Transform.flip(
                  flipY: true,
                  flipX: true,
                  child: CustomPaint(
                    size: painterSize,
                    painter: BrokenSweepChartPainter(
                      sweepAngle: sweepAngle,
                      thickness: thickness,
                      selectedIndex: 0,
                      sweepPortionSizes: [selectedValue, 1 - selectedValue],
                      gap: gap,
                      size: painterSize,
                      gradientColors: [
                        AppColors.gradient2,
                        AppColors.gradient1,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
