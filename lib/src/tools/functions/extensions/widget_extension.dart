part of 'extensions.dart';

extension WidgetExtension on Widget {
  Widget rotate(
    double angle, {
    FilterQuality? filterQuality,
    Alignment? alignment,
  }) {
    return Transform.rotate(
      alignment: alignment,
      filterQuality: filterQuality,
      angle: angle.toRadians,
      child: this,
    );
  }
}
