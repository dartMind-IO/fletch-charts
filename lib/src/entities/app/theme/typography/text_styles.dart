import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static final TextStyle displayBigDisplay1Bold = TextStyle(
    fontSize: 96.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -3.84,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayBigDisplay2Bold = TextStyle(
    fontSize: 80.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -2.4,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayBigDisplay3Semibold = TextStyle(
    fontSize: 72.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -2.16,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayBigDisplay4Semibold = TextStyle(
    fontSize: 64.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -1.92,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayBigDisplay5Semibold = TextStyle(
    fontSize: 56.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -1.12,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD1Bold = TextStyle(
    fontSize: 52.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -1.04,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD1Medium = TextStyle(
    fontSize: 52.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    letterSpacing: -1.04,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD2Bold = TextStyle(
    fontSize: 46.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.92,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD2Medium = TextStyle(
    fontSize: 46.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    letterSpacing: -0.92,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD3Bold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.8,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD3Medium = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    letterSpacing: -0.8,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD4Bold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.72,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle displayD4Regular = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -0.72,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH1Bold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.45,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH1Regular = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -0.45,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH2SemiBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -0.36,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH2Regular = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -0.36,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH3Bold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.18,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH3Regular = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    letterSpacing: -0.18,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH4Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    letterSpacing: -0.17,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle headlineH4Regular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    letterSpacing: -0.17,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt1Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    height: 7.5,
    letterSpacing: -0.06,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt1Medium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    height: 7.5,
    letterSpacing: -0.06,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt2Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Switzer",
    height: 8.33,
    letterSpacing: -0.05,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt2Regular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    height: 8.33,
    letterSpacing: -0.05,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt3SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 9.38,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt3Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    height: 9.38,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle bodyTextBt3Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 9.38,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextSt1SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 10.71,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextSt1Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    height: 10.71,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
  static final TextStyle smallTextSt1Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 10.71,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextSt2SemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 12.5,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextSt2Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 12.5,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextTiny1 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 15,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle smallTextTiny2 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Switzer",
    height: 18.75,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle buttonTextLargeButton = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    letterSpacing: -0.05,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle buttonTextMediumButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static final TextStyle buttonTextSmallButton = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Switzer",
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
}
