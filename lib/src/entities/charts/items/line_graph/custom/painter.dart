part of '../line_graph.dart';

typedef DispatchChangeCallback = void Function(
  Offset globalPosition,
  Point pointValue,
);

class LineGraphPainter extends CustomPainter {
  final Size size;
  final DispatchChangeCallback dispatchChange;
  final List<Point<double>> points;
  final Point<double> maxPoint;
  final BuildContext context;

  const LineGraphPainter(
    this.context, {
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
    final Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [
          AppColors.gradient2,
          AppColors.gradient1,
          AppColors.gradient2,
          AppColors.gradient1,
        ],
      ).createShader(rect);

    final List<Point<double>> normalizedPoints = generateNormalizedList();
    final Path path = Path();

    path.moveTo(normalizedPoints.first.x, normalizedPoints.first.y);

    for (final point in normalizedPoints) {
      path.lineTo(point.x, point.y);
    }

    canvas.drawPath(path, paint);
    final TouchyCanvas touchyCanvas = TouchyCanvas(context, canvas);

    for (int index = 0; index < normalizedPoints.length; index++) {
      drawBulb(touchyCanvas, normalizedPoints[index], index);
    }

    // final canvas_ = TouchyCanvas(context, canvas);
  }

  void paintUnderLines(Canvas canvas) {}

  void drawBulb(
    TouchyCanvas canvas,
    Point<double> point,
    int index,
  ) {
    final Paint strokePaint = Paint()
      ..strokeWidth = 2.l
      ..style = PaintingStyle.stroke
      ..color = AppColors.cyan;

    final Paint fillPaint = Paint()
      ..strokeWidth = 2.l
      ..style = PaintingStyle.fill
      ..color = AppColors.white;

    canvas.drawCircle(
      point.toOffset(),
      12.l,
      strokePaint,
    );

    canvas.drawCircle(
      point.toOffset(),
      10.l,
      fillPaint,
      hitTestBehavior: HitTestBehavior.translucent,
      onTapDown: (details) => dispatchChange(
        details.globalPosition,
        points[index],
      ),
    );
  }

  List<Point<double>> generateNormalizedList() {
    final List<Point<double>> normalizedPoints = [];
    for (final point in points) {
      final double ratioX = point.x / maxPoint.x;
      final double ratioY = 1 - (point.y / maxPoint.y);

      normalizedPoints.add(
        Point(rect.width * ratioX, rect.height * ratioY),
      );
    }

    return normalizedPoints;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
