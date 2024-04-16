import 'package:fletch_charts/src/entities/app/theme/app_theme.dart';
import 'package:fletch_charts/src/entities/entities_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DartmindCharts extends StatelessWidget {
  const DartmindCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ChartsScreen(),
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return ScreenUtilInit(
          designSize: const Size(1440, 1024),
          child: Theme(
            data: AppTheme.light,
            child: child!,
          ),
        );
      },
    );
  }
}

class PortfolioAppWrapper extends StatelessWidget {
  final Widget child;

  const PortfolioAppWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
