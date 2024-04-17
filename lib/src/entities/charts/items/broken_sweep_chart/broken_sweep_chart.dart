import 'dart:math' as math;

import 'package:fletch_charts/src/entities/app/theme/colors/app_colors.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';

part 'custom/painter.dart';

part 'custom/text_gradient.dart';

class BrokenSweepChart extends StatelessWidget {
  final Size? size;

  /// this is a list of values whose sum should be normalized between 0 and 1
  ///
  /// it represents the portion of the sweep chart that should be allocated to each value
  final List<double> sweepPortionSizes;

  /// this is the gap between portions
  ///
  /// it must be between zero and one as it is a fraction of 180º
  final double portionGap;
  final double thickness;

  const BrokenSweepChart({
    super.key,
    this.size,
    required this.sweepPortionSizes,
    this.portionGap = 0.06,
    this.thickness = 15,
  });

  @override
  Widget build(BuildContext context) {
    final Size painterSize = size ?? Size(340, 181.doubled);
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
                  painter: BrokenSweepChartPainter(
                    thickness: thickness,
                    sweepPortionSizes: sweepPortionSizes,
                    gap: portionGap,
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
              value: 1,
              diameter: 45.l,
              parentSize: painterSize,
            ),
          ],
        ),
      );
    });
  }
}

class SlidingKnob extends StatefulWidget {
  final Size parentSize;
  final double diameter;
  final double value;

  const SlidingKnob({
    super.key,
    required this.parentSize,
    required this.diameter,
    required this.value,
  });

  @override
  State<SlidingKnob> createState() => _SlidingKnobState();
}

class _SlidingKnobState extends State<SlidingKnob> {
  late final Size knobSize = Size.square(widget.diameter);

  double get radius => rect.width.halfed;

  Size get parentSize => widget.parentSize;

  Rect get rect => Rect.fromPoints(
        parentSize.topLeft(Offset.zero),
        parentSize.bottomRight(Offset.zero),
      );

  Offset get rectCenter => Offset(
        rect.width.halfed - knobSize.width.halfed,
        rect.height.halfed - knobSize.height.halfed,
      );

  Offset calculateOffset(
    double value, {
    double maxAngle = 180,
  }) {
    final double angle = maxAngle * value;

    final double x = radius * math.cos(angle.toRadians);
    final double y = radius * math.sin(angle.toRadians);

    return Offset(
      x + rectCenter.dx,
      y + rectCenter.dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Offset offset = calculateOffset(1 - widget.value);

    return Positioned(
      left: offset.dx,
      bottom: offset.dy,
      child: Knob(diameter: widget.diameter),
    );
  }
}

class Knob extends StatelessWidget {
  final double diameter;

  const Knob({
    super.key,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          width: diameter / 5,
          color: AppColors.cyan,
        ),
      ),
    );
  }
}
