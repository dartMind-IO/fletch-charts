import 'dart:math' as math;

import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';

class SweepRadialGradientPainter extends CustomPainter {
  final Size size;
  final List<Color> gradientColors;
  final double value;
  final double thickness;

  SweepRadialGradientPainter({
    required this.value,
    required this.size,
    required this.thickness,
    required this.gradientColors,
  });

  Rect get rect => Rect.fromPoints(
        size.topLeft(Offset.zero),
        size.bottomRight(Offset.zero),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..shader = LinearGradient(colors: gradientColors).createShader(rect)
      ..strokeWidth = thickness;

    final Paint backgroundPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..color = AppColors.navy2000
      ..strokeWidth = thickness;

    canvas.drawArc(rect, 0, 180.toRadians, false, backgroundPainter);
    canvas.drawArc(rect, 0, 180.ratio(value).toRadians, false, paint);
  }

  Offset computeData(
    double value, {
    required double radius,
    required Offset center,
  }) {
    final double angle = value * 180;

    final xLength = math.cos(angle.toRadians) * radius;
    final yLength = math.sin(angle.toRadians) * radius;

    return Offset(
      center.dx - xLength,
      center.dy - yLength,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
