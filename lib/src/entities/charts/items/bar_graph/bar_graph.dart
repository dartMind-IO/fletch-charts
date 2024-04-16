import 'dart:math';

import 'package:fletch_charts/src/entities/charts/items/line_graph/line_graph.dart'
    as chart;
import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable/touchable.dart';

part 'custom/background_painter.dart';

part 'custom/painter.dart';

class BarGraph extends StatefulWidget {
  final List<String> verticalTexts;
  final List<String> horizontalTexts;
  final Map<double, double> values;
  final Point<double> maxPoint;

  const BarGraph({
    Key? key,
    required this.verticalTexts,
    required this.horizontalTexts,
    required this.values,
    required this.maxPoint,
  }) : super(key: key);

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  void showOverlay(
    BuildContext context,
    Point point,
    Offset globalPosition,
  ) {
    late final OverlayEntry entry;

    void closeOverlay() => entry.remove();

    entry = OverlayEntry(
      builder: (context) => chart.ChartOverlayWidget(
        pointData: point,
        closeCallback: closeOverlay,
        globalBulbPosition: globalPosition,
      ),
    );

    Overlay.of(context).insert(entry);
  }

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    const Size size = Size(450, 170);

    return Builder(builder: (context) {
      final graphSize = Size(
        size.width - 42,
        size.height,
      );
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: CustomPaint(
                    size: size,
                    painter: _BackgroundPainter(
                      verticalTexts: widget.verticalTexts,
                    ),
                  ),
                ),
                SizedBox(
                  height: graphSize.height,
                  width: graphSize.width,
                  child: CanvasTouchDetector(
                    gesturesToOverride: const [GestureType.onTapDown],
                    builder: (context) {
                      return CustomPaint(
                        painter: _BarGraphPainter(
                          context,
                          barWidth: 30.6.w,
                          selectedIndex: selectedIndex,
                          size: graphSize,
                          maxPoint: widget.maxPoint,
                          dispatchChange: (
                            Offset gPosition,
                            Point point,
                            int index,
                          ) {
                            setState(() {
                              selectedIndex = index;
                            });
                            showOverlay(context, point, gPosition);
                          },
                          points: [
                            for (final item in widget.values.entries)
                              Point(
                                item.key.toDouble(),
                                item.value.toDouble(),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          21.boxHeight,
          SizedBox(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 72.w),
              child: Row(
                children: widget.horizontalTexts.map((text) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: widget.horizontalTexts.indexOf(text) == 0
                          ? 0
                          : (size.width / widget.horizontalTexts.length) - 14,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.5,
                        color: AppColors.paleBlue,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
