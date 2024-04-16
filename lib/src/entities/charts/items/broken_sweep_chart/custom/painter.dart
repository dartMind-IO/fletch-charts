part of '../broken_sweep_chart.dart';

class BrokenSweepChartPainter extends CustomPainter {
  final Size size;
  final List<Color> gradientColors;

  /// this is the gap between portions
  final double gap;

  /// this is a list of values whose sum should be normalized between 0 and 1
  ///
  /// it represents the portion of the sweep chart that should be allocated to each value
  final List<double> sweepPortionSizes;
  final double thickness;

  BrokenSweepChartPainter({
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
      ..shader = LinearGradient(
        stops: const [0, 0.1, 0.4],
        colors: [
          Color.lerp(AppColors.gradient2, AppColors.gradient1, 0.4)!,
          Color.lerp(AppColors.gradient2, AppColors.gradient1, 0.7)!,
          AppColors.navy2000,
        ],
      ).createShader(rect)
      ..strokeWidth = thickness;

    drawGeneratedPaths(canvas, paint);
  }

  void drawGeneratedPaths(Canvas canvas, Paint paint) {
    final List<Path> paths = generatePathToDraw(
      generatePortionLimits(sweepPortionSizes, gap),
      gapPercent: gap,
    );

    for (final Path path in paths) {
      canvas.drawPath(path, paint);
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
        180.ratio(previousPercent).toRadians,
        180.ratio(itemPercent).toRadians,
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
