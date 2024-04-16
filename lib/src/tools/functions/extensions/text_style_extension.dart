part of 'extensions.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withSize(double size) => copyWith(fontSize: size);

  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  TextStyle withHeight(double height) => copyWith(height: height);

  TextStyle withDecoration(TextDecoration decoration) => copyWith(
        decoration: decoration,
      );

  TextStyle withSpacing(double spacing) => copyWith(letterSpacing: spacing);

  /// weight: FontWeight.w500
  TextStyle get asMedium => copyWith(fontWeight: FontWeight.w500);

  /// weight: FontWeight.w600
  TextStyle get asSemibold => copyWith(fontWeight: FontWeight.w600);

  /// weight: FontWeight.w700
  TextStyle get asBold => copyWith(fontWeight: FontWeight.bold);

  /// weight: FontWeight.w400
  TextStyle get asRegular => copyWith(fontWeight: FontWeight.w400);
}
