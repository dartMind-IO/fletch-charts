part of '../selected_broken_sweep_chart.dart';

class BrokenSweepChartPainter extends CustomPainter {
  final Size size;
  final List<Color> gradientColors;
  final int selectedIndex;
  final double sweepAngle;

  /// this is the gap between portions
  final double gap;

  /// this is a list of values whose sum should be normalized between 0 and 1
  ///
  /// it represents the portion of the sweep chart that should be allocated to each value
  final List<double> sweepPortionSizes;
  final double thickness;

  BrokenSweepChartPainter({
    required this.sweepAngle,
    required this.selectedIndex,
    required this.sweepPortionSizes,
    required this.thickness,
    required this.gap,
    required this.size,
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
      ..color = AppColors.navy2000
      ..strokeWidth = thickness;

    final Paint selectedPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..shader = const LinearGradient(
        colors: [
          AppColors.gradient1,
          AppColors.gradient2,
        ],
      ).createShader(rect)
      ..strokeWidth = thickness;

    drawGeneratedPaths(canvas, paint, selectedPaint);
  }

  void drawGeneratedPaths(
    Canvas canvas,
    Paint paint,
    Paint selectedPaint,
  ) {
    final List<Path> paths = generatePathToDraw(
      generatePortionLimits(sweepPortionSizes, gap),
      gapPercent: gap,
    );

    for (int index = 0; index < paths.length; index++) {
      canvas.drawPath(
        paths[index],
        index == selectedIndex ? selectedPaint : paint,
      );
    }
  }

  List<double> generatePortionLimits(List<double> limits, double gap) {
    final gapValue = (limits.length - 1) * gap;
    final double remainder = 1 - gapValue;
    assert(
      limits.fold<double>(0, (previousValue, element) {
            return previousValue + element;
          }) <=
          1,
      'All items in limit must be normalized around value "1"',
    );

    return List.generate(
      limits.length,
      (index) => limits[index] * remainder,
    );
  }

  List<Path> generatePathToDraw(
    List<double> itemPercentLimits, {
    required double gapPercent,
    double endLimit = 1,
  }) {
    final List<Path> paths = [];

    double? previousPercent_;

    for (final itemPercent in itemPercentLimits) {
      final Path path = Path();

      double previousPercent = previousPercent_ ?? 0;

      if (previousPercent != 0) previousPercent += gapPercent;

      path.addArc(
        rect,
        sweepAngle.ratio(previousPercent).toRadians,
        sweepAngle.ratio(itemPercent).toRadians,
      );

      previousPercent_ = previousPercent + itemPercent;
      paths.add(path);
    }

    return paths;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
