part of '../bar_graph.dart';

typedef DispatchChangeCallback = void Function(
  Offset globalPosition,
  Point pointValue,
  int index,
);

class _BarGraphPainter extends CustomPainter {
  final Size size;
  final DispatchChangeCallback dispatchChange;
  final List<Point<double>> points;
  final Point<double> maxPoint;
  final BuildContext context;
  final int? selectedIndex;
  final double barWidth;

  const _BarGraphPainter(
    this.context, {
    required this.barWidth,
    this.selectedIndex,
    required this.maxPoint,
    required this.size,
    required this.dispatchChange,
    required this.points,
  });

  Rect get rect => Rect.fromPoints(
        size.topLeft(Offset.zero),
        size.bottomRight(Offset.zero),
      );

  @override
  void paint(Canvas canvas, Size size) {
    /// point where, x represents x position and y represents bar extent
    final List<Point<double>> normalizedPoints = generateNormalizedList();

    final TouchyCanvas touchyCanvas = TouchyCanvas(context, canvas);

    for (int index = 0; index < normalizedPoints.length; index++) {
      drawBar(touchyCanvas, normalizedPoints[index], index);
    }
  }

  void drawBar(TouchyCanvas canvas, Point<double> point, int index) {
    final double barRadius = barWidth.halfed;
    final double barDepth = point.y;
    final double cornerRadius = 4.l;

    final Path path = Path();

    final Rect barRect = Rect.fromPoints(
      Offset(point.x - barRadius, rect.bottom - barDepth),
      Offset(point.x + barRadius, rect.bottom),
    );

    final paint = Paint();
    if (index == selectedIndex) {
      paint.shader = LinearGradient(
        begin: const Alignment(0, -0.75),
        end: const Alignment(0, 0.5),
        colors: [
          Color.lerp(AppColors.gradient1, AppColors.gradient2, 0)!,
          Color.lerp(AppColors.gradient1, AppColors.gradient2, 1)!,
        ],
      ).createShader(barRect);
    } else {
      paint.color = AppColors.navy2000;
    }

    path
      ..moveTo(barRect.left, barRect.bottom)
      ..lineTo(barRect.right, barRect.bottom)
      ..lineTo(barRect.right, barRect.top + cornerRadius)
      ..arcToPoint(
        Offset(barRect.right - cornerRadius, barRect.top),
        clockwise: false,
        rotation: 90,
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(barRect.left + cornerRadius, barRect.top)
      ..arcToPoint(
        Offset(barRect.left, barRect.top + cornerRadius),
        clockwise: false,
        rotation: 90,
        radius: Radius.circular(cornerRadius),
      )
      ..lineTo(barRect.left, barRect.bottom)
      ..lineTo(barRect.right, barRect.bottom);

    canvas.drawPath(
      path,
      paint,
      onTapDown: (details) => dispatchChange(
        details.globalPosition,
        point,
        index,
      ),
    );
  }

  List<Point<double>> generateNormalizedList() {
    final List<Point<double>> normalizedPoints = [];
    final double xPadding =
        (points.first.x / maxPoint.x) * rect.width - barWidth.halfed;

    for (final point in points) {
      final double ratioX = point.x / maxPoint.x;
      final double ratioY = point.y / maxPoint.y;

      normalizedPoints.add(
        Point((rect.width * ratioX) - xPadding, rect.height * ratioY),
      );
    }

    return normalizedPoints;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! _BarGraphPainter) return true;

    return size != oldDelegate.size ||
        dispatchChange != oldDelegate.dispatchChange ||
        points != oldDelegate.points ||
        maxPoint != oldDelegate.maxPoint ||
        context != oldDelegate.context ||
        selectedIndex != oldDelegate.selectedIndex;
  }
}
