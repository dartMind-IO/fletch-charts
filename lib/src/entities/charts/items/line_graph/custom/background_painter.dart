part of '../line_graph.dart';

class BackgroundPainter extends CustomPainter {
  final List<String> verticalTexts;

  const BackgroundPainter({
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

      canvas.drawLine(
        Offset(textPart == null ? 0 : (textPart + 10), yPosition),
        Offset(size.width, yPosition),
        paint,
      );
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
