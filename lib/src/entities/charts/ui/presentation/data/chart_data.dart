part of '../charts_screen.dart';

abstract final class ChartData {
  static final List<String> barGraphHorizontalText = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];

  static final List<String> barGraphVerticalText = [
    '8hr',
    '4hr',
    // '1hr',
  ];

  static final Map<double, double> barGraphDaysCommits = {
    1: 8,
    2: 1.333,
    3: 3.75,
    4: 2,
    5: 6.25,
    6: 1.5,
    7: 4.15,
  };

  static final List<String> lineVerticalHorizontalText = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static final List<String> lineText = [
    '',
    '4k',
    '3k',
    '2k',
    '1k',
    '0',
  ];

  static final Map<double, double> lineGraphDaysCommits = {
    15: 1400,
    55: 2500,
    87: 1500,
    161: 3800,
    196: 1200,
    214: 450,
    289: 1700,
    323: 3650,
    365: 1000,
  };
}
