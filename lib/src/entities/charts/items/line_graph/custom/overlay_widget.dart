part of '../line_graph.dart';

class ChartOverlayWidget extends StatelessWidget {
  final Point pointData;
  final Offset globalBulbPosition;
  final VoidCallback closeCallback;

  const ChartOverlayWidget({
    Key? key,
    required this.pointData,
    required this.globalBulbPosition,
    required this.closeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Duration days = Duration(days: pointData.x.toInt());
    final DateTime dateTime = DateTime(2023).add(days);

    final String text = intl.DateFormat().add_MMMd().format(dateTime);

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          GestureDetector(
            onTap: closeCallback,
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            top: globalBulbPosition.dy - 40,
            left: globalBulbPosition.dx - 24,
            child: AbsorbPointer(
              child: ToolTip(
                color: AppColors.gradient1,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.5,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolTip extends StatelessWidget {
  final Widget child;
  final Color color;

  const ToolTip({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          bottom: -7,
          child: QuickPainterWidget(
            size: const Size(18, 8),
            callback: (canvas, size) {
              final Paint paint = Paint()
                ..color = color
                ..shader = LinearGradient(
                  transform: GradientRotation(90.toRadians),
                  stops: const [0.4, 1],
                  colors: [
                    color,
                    Color.lerp(color, Colors.black, .5)!,
                  ],
                ).createShader(
                  size.toRect(),
                );
              final Path path = Path();
              path
                ..moveTo(0, 0)
                ..lineTo(size.width, 0)
                ..lineTo(size.width.halfed, size.height)
                ..lineTo(0, 0)
                ..lineTo(size.width, 0);

              canvas.drawPath(path, paint);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: 8.circularBorder,
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          child: child,
        ),
      ],
    );
  }
}
