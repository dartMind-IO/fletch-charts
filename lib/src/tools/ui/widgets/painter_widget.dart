import 'package:flutter/material.dart';

typedef PaintCallback = void Function(Canvas canvas, Size size);

class QuickPainterWidget extends StatelessWidget {
  final PaintCallback callback;
  final bool shouldRepaint;
  final Widget? child;
  final Size size;

  const QuickPainterWidget({
    required this.size,
    required this.callback,
    this.shouldRepaint = false,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: CustomPaint(
        painter: _Painter(
          paintCallback: callback,
          shouldRepaint: shouldRepaint,
        ),
        size: size,
        child: child,
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final PaintCallback paintCallback;
  final bool _shouldRepaint;

  const _Painter({
    required this.paintCallback,
    required bool shouldRepaint,
  }) : _shouldRepaint = shouldRepaint;

  @override
  void paint(Canvas canvas, Size size) => paintCallback(canvas, size);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => _shouldRepaint;
}
