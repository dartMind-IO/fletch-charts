part of 'extensions.dart';

extension BrightnessExtension on Brightness {
  ThemeMode toThemeMode() {
    return switch (this) {
      Brightness.light => ThemeMode.light,
      Brightness.dark => ThemeMode.dark,
    };
  }
}

extension OffsetExtension on Offset {
  Offset normalizeRelativeTo(Rect rect) {
    return Offset(
      ((dx / rect.width) * 2) - 1,
      ((dy / rect.height) * 2) - 1,
    );
  }
}

extension PointExtension on math.Point<double> {
  Offset toOffset() => Offset(x, y);
}

extension SizeExtension on Size {
  Rect toRect() => Rect.fromPoints(
        Offset.zero,
        Offset(width, height),
      );
}
