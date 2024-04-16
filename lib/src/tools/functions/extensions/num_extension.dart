part of 'extensions.dart';

extension NumExtension on num {
  ///returns value * (percentage/100)
  double percent(num percentage) => (this * (percentage / 100)).toDouble();

  num? get nullIfZero => this == 0 ? null : this;

  num limitBetween(num min, num max) {
    return this < min
        ? min
        : this > max
            ? max
            : this;
  }

  double get squared => (this * this).toDouble();

  num get nonNegative => (this < 0) ? 0 : this;

  num? get isZeroNull => this == 0 ? null : this;

  bool get isFiveMultiple => this % 5 == 0;

  double get negate => this * -1;

  String get pluralS => this == 1 ? '' : 's';

  String get textVowelPlural => this == 1 ? '' : 'es';

  SizedBox get boxWidth => SizedBox(width: w);

  SizedBox get boxHeight => SizedBox(height: h);

  double get l => math.max(w, h);

  double get m => math.min(w, h);

  bool isBetween({
    required num min,
    required num max,
  }) {
    return this > min && this < max;
  }

  bool isBetweenEqual({
    required num min,
    required num max,
  }) {
    return this >= min && this <= max;
  }

  Duration get seconds => Duration(seconds: toInt());

  SliverToBoxAdapter get sliverBoxWidth => SliverToBoxAdapter(
        child: SizedBox(width: w),
      );

  SliverToBoxAdapter get sliverBoxHeight => SliverToBoxAdapter(
        child: SizedBox(height: h),
      );

  double get halfed => this / 2;

  double get sixth => this / 6;

  double get third => this / 3;

  double get twoThirds => this * 2 / 3;

  double get doubled => this * 2;

  double ratio(double value) => this * value;

  double get toRadians => this * (math.pi / 180);

  double get toDegrees => this == 0 ? 0 : this * (180 / math.pi);

  double get pi => this * math.pi;

  double get degreesToPi => this * (180 / math.pi);

  double? get nullIfNan => isNaN ? null : toDouble();

  BorderRadius get circularBorder => BorderRadius.all(
        Radius.circular(toDouble()),
      );

  BorderRadius get circularBorderTop => BorderRadius.vertical(
        top: Radius.circular(toDouble()),
      );

  BorderRadius get circularBorderBottom => BorderRadius.vertical(
        bottom: Radius.circular(toDouble()),
      );

  BorderRadius get circularBorderLeft => BorderRadius.horizontal(
        left: Radius.circular(toDouble()),
      );

  BorderRadius get circularBorderRight => BorderRadius.horizontal(
        right: Radius.circular(toDouble()),
      );
}

extension IntExtension on int {
  List<int> range([int start = 1]) => List<int>.generate(
        this,
        (int index) => index + start,
      );

  List<int> indexRange() => List<int>.generate(
        this,
        (int index) => index + 0,
      );

  Duration get seconds => Duration(seconds: this);

  int? get nullIfZero => this == 0 ? null : this;

  bool get isSingleDigit => this > -1 && this <= 9;

  double get half => this / 2;

  double get sixth => this / 6;

  double get third => this / 3;

  double get twoThirds => this * 2 / 3;

  double get doubled => this * 2;

  double percent(double value) => this * value / 100;

  double ratio(double value) => this * value;

  double get toRadians => this * (math.pi / 180);

  double get pi => this * math.pi;

  num get oneIfZero => this == 0 ? 1 : this;

  int get zeroIfLess => this < 0 ? 0 : this;

  double bezierRelativeWidth(double newWidth) {
    return this * (newWidth / 107.7.w);
  }

  bool isAround(num other, {double offBy = 2}) {
    return other >= this - 2 && other < (this + 2);
  }

  bool isAroundOrGreaterThan(num other, {double offBy = 2}) {
    return this >= other + 2 || isAround(other, offBy: offBy);
  }

  bool isAroundOrLessThan(num other, {double offBy = 2}) {
    return this <= other - 2 || isAround(other, offBy: offBy);
  }

  double bezierRelativeHeight(double newHeight) {
    return this * (newHeight / 37.3.w);
  }

  String toOrdinal() {
    final int number = toInt();
    final int remainder = number % 100;

    if (remainder >= 11 && remainder <= 13) {
      return '${number}th';
    }

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  String get pluralS {
    if (this == 1) {
      return '';
    }
    return 's';
  }
}

extension GenericNumExtension<T extends num> on T {
  String commaFormatted() {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  T capAt(T cap) => this >= cap ? cap : this;

  T capBetween(T min, T max) => this >= max
      ? max
      : this <= min
          ? min
          : this;
}

extension NullableIntExtension on int? {
  bool get isSingleDigitOrNull {
    if (this == null) return true;
    if (this != null) {
      if (this! > -1 && this! <= 9) return true;
    }
    return false;
  }
}
