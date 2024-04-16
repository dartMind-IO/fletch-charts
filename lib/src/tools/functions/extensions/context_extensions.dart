part of 'extensions.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get verticalViewPadding => mediaQuery.viewPadding.vertical;

  double get bottomScreenPadding => mediaQuery.viewPadding.bottom;

  double get topScreenPadding => mediaQuery.viewPadding.top;

  Size get queryScreenSize => mediaQuery.size;

  double get screenHeight => queryScreenSize.height;

  double get screenWidth => queryScreenSize.width;

  double get mediaScreenWidth => queryScreenSize.width;

  double get mediaScreenHeight => queryScreenSize.height;
}
