part of '../bar_graph.dart';

class _BackgroundPainter extends CustomPainter {
  final List<String> verticalTexts;

  const _BackgroundPainter({
    required this.verticalTexts,
  });

  @override
  void paint(canvas, size) {
    final paint = Paint()
      ..color = AppColors.navy2000
      ..strokeWidth = 1.l;

    final lineNumber = verticalTexts.length;
    final double unit = size.height / (lineNumber - 1);

    for (int item = 0; item < verticalTexts.length; item++) {
      double? textPart;
      final text = verticalTexts[item];

      final double yPosition = item == 0 ? 0 : unit * item;

      if (text.trim().isNotEmpty) {
        final painterSize = paintVerticalText(
          text,
          canvas,
          yPosition: yPosition,
        );
        textPart = painterSize.width;
      }
      drawBrokenLines(
        Offset(textPart == null ? 0 : (textPart + 24), yPosition),
        Offset(size.width, yPosition),
        paint,
        canvas,
      );
    }
  }

  void drawBrokenLines(Offset p1, Offset p2, Paint paint, Canvas canvas) {
    paint.strokeCap = StrokeCap.round;
    final Path path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy);
    canvas.drawPath(path, paint);

    final double gap = 6.l;
    final double line = 3.l;

    double extent = p2.dx - p1.dx;

    double temp = p1.dx;
    while (extent > 0) {
      final Offset off1 = Offset(temp + gap, p1.dy);
      extent -= gap;
      temp += gap;

      final Offset off2 = Offset(temp + line, p1.dy);
      extent -= line;
      temp += line;

      canvas.drawLine(off1, off2, paint);
    }
  }

  Size paintVerticalText(
    String text,
    Canvas canvas, {
    required double yPosition,
  }) {
    final TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          height: 1.5,
          color: AppColors.paleBlue,
        ),
      ),
      maxLines: 1,
    );

    painter.layout();

    painter.paint(
      canvas,
      Offset(0, yPosition - painter.size.height.twoThirds),
    );

    return painter.size;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
