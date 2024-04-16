import 'package:fletch_charts/src/entities/app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get light => _light;
}

ThemeData get _light => ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.navy1000,
    );
