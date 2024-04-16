import 'dart:math' as math;

import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'custom/painter.dart';

part 'custom/text_gradient.dart';

class BrokenSweepChart extends StatefulWidget {
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
  final double knobValue;

  const BrokenSweepChart({
    Key? key,
    this.size,
    required this.knobValue,
    required this.sweepPortionSizes,
    this.portionGap = 0.06,
    this.thickness = 15,
  }) : super(key: key);

  @override
  State<BrokenSweepChart> createState() => _BrokenSweepChartState();
}

class _BrokenSweepChartState extends State<BrokenSweepChart> {
  BuildContext? stackContext;

  Offset? globalOffset;

  void computePosition(BuildContext context) =>
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (stackContext != null) return;
        stackContext = context;
        final box = stackContext?.findRenderObject() as RenderBox?;
        if (box == null) return;
        final Offset offset = box.localToGlobal(Offset.zero);
        globalOffset = offset;
        setState(() {});
      });

  @override
  Widget build(BuildContext context) {
    final Size painterSize = widget.size ?? Size(416, 213.27.doubled);
    return LayoutBuilder(builder: (context, constraints) {
      computePosition(context);
      return Stack(
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
                  thickness: widget.thickness,
                  sweepPortionSizes: widget.sweepPortionSizes,
                  gap: widget.portionGap,
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
            value: widget.knobValue,
            diameter: 45.l,
            parentSize: painterSize,
          ),
        ],
      );
    });
  }
}

class SlidingKnob extends StatefulWidget {
  final Size parentSize;
  final double diameter;
  final double value;

  const SlidingKnob({
    Key? key,
    required this.parentSize,
    required this.diameter,
    required this.value,
  }) : super(key: key);

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
    Key? key,
    required this.diameter,
  }) : super(key: key);

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
