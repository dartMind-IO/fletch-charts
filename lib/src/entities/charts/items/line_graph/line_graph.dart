import 'dart:math';

import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:touchable/touchable.dart';

part 'custom/background_painter.dart';

part 'custom/overlay_widget.dart';

part 'custom/painter.dart';

class LineGraph extends StatelessWidget {
  final List<String> verticalTexts;
  final List<String> horizontalTexts;
  final Map<double, double> values;

  const LineGraph({
    super.key,
    required this.verticalTexts,
    required this.horizontalTexts,
    required this.values,
  });

  void showOverlay(
    BuildContext context,
    Point point,
    Offset globalPosition,
  ) {
    late final OverlayEntry entry;

    void closeOverlay() => entry.remove();

    entry = OverlayEntry(
      builder: (context) => ChartOverlayWidget(
        pointData: point,
        closeCallback: closeOverlay,
        globalBulbPosition: globalPosition,
      ),
    );

    Overlay.of(context).insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Size(818, 302.doubled.halfed);
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.fromSize(
            size: size,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: CustomPaint(
                    size: size,
                    painter: BackgroundPainter(verticalTexts: verticalTexts),
                  ),
                ),
                Builder(builder: (context) {
                  final graphSize = Size(
                    size.width - 15.w,
                    size.height,
                  );
                  return Container(
                    height: graphSize.height,
                    width: graphSize.width,
                    margin: EdgeInsets.only(left: 15.w),
                    child: CanvasTouchDetector(
                      gesturesToOverride: const [GestureType.onTapDown],
                      builder: (context) {
                        return CustomPaint(
                          painter: LineGraphPainter(
                            context,
                            size: graphSize,
                            maxPoint: const Point(365, 5000),
                            dispatchChange: (Offset gPosition, Point point) {
                              showOverlay(context, point, gPosition);
                            },
                            points: [
                              for (final item in values.entries)
                                Point(
                                  item.key.toDouble(),
                                  item.value.toDouble(),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          21.boxHeight,
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: horizontalTexts.map((text) {
                return Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.5,
                    color: AppColors.paleBlue,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
