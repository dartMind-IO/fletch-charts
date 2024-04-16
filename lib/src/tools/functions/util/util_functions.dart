import 'dart:convert';
import 'dart:math';

import 'package:fletch_charts/src/tools/tools_barrel.dart';
import 'package:intl/intl.dart';

abstract class UtilFunctions {
  static String generateRandomID([int length = 16]) {
    final Random random = Random.secure();

    final List<int> values = List<int>.generate(
      length,
      (i) => random.nextInt(256),
    );
    return base64Url.encode(values);
  }

  static String generateID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static int generateIntID() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static DateTime dateTimeFromSecondsSinceEpoch(int secondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch * 1000);
  }

  static DateTime parseDateTime(
    dynamic data, {
    bool mustReturnDate = false,
    DateTime? defaultDate,
  }) {
    try {
      if (data is DateTime) return data.toLocal();
      return DateTime.parse(data).toLocal();
    } on FormatException {
      if (data is DateTime) return data.toLocal();
      if (data is String) {
        return DateTime.fromMillisecondsSinceEpoch(int.parse(data)).toLocal();
      }
      return DateTime.fromMillisecondsSinceEpoch(data as int).toLocal();
    } catch (e) {
      if (mustReturnDate) {
        return defaultDate ?? DateTime(DateTime.now().year).toLocal();
      }

      if (defaultDate != null) return defaultDate;
      throw "Balablu $e";
    }
  }

  static String formatMinutesDuration(Duration duration) {
    final int inSeconds = duration.inSeconds;
    final int seconds = inSeconds % 60;
    final int minutes = inSeconds ~/ 60;

    return '${'$minutes'.padLeft(2, '0')}:${'$seconds'.padLeft(2, '0')}';
  }

  static String formatDuration(Duration duration) {
    final int seconds = duration.inSeconds;

    if (seconds < 60) return '$seconds sec${duration.inSeconds.pluralS}';

    final int minutes = duration.inMinutes;

    if (minutes >= 60) {
      return '${duration.inHours} hr${duration.inHours.pluralS}';
    }

    return '$minutes min${duration.inMinutes.pluralS}';
  }

  // static String formatDateWithShortMonth(DateTime date) {
  //   // final String month = Values.shortMonths[date.month];
  //   final String year = '${date.year}';
  //   return '$month $year';
  // }

  static bool compareQueries(String value, String query) {
    final String formattedValue = value.trim().toLowerCase();
    final List<String> queryWords = query.split(' ');
    if (queryWords.length == 1) {
      return formattedValue.contains(query.trim().toLowerCase());
    }
    bool hasMatch = false;
    for (String queryWord in queryWords) {
      hasMatch = formattedValue.contains(queryWord.trim().toLowerCase());
      if (hasMatch) return true;
    }
    return false;
  }

  static String formatNumberInput(num number) {
    String trailingDecimal = '';
    if (number is double) {
      trailingDecimal = '.${'$number'.split('.').last}';
    }
    final String numText = number.toInt().toString();
    final int numLength = numText.length;

    String fullNumText = '';
    for (int i = _getHighestThreeMultiple(numLength); i >= 0; i -= 3) {
      bool onHighestPlaceValue = (_getHighestThreeMultiple(numLength) - i) < 3;
      bool onLowestPlaceValue = i <= 3;
      fullNumText += numText.substring(
        onHighestPlaceValue ? 0 : (numLength - i),
        onLowestPlaceValue ? null : numLength - (i - 3),
      );
      if (onLowestPlaceValue) return '$fullNumText$trailingDecimal';
      fullNumText += ',';
    }
    return '$fullNumText$trailingDecimal';
  }

  static String formatMoneyInput(
    double number, {
    String currency = '\$',
  }) {
    String trailingDecimal = '.${'$number'.split('.').last}';
    trailingDecimal = trailingDecimal.length > 3
        ? trailingDecimal.substring(0, 3)
        : trailingDecimal.padRight(3, '0');
    final String numText = number.toInt().toString();
    final int numLength = numText.length;

    String fullNumText = '';
    for (int i = _getHighestThreeMultiple(numLength); i >= 0; i -= 3) {
      bool onHighestPlaceValue = (_getHighestThreeMultiple(numLength) - i) < 3;
      bool onLowestPlaceValue = i <= 3;
      fullNumText += numText.substring(
        onHighestPlaceValue ? 0 : (numLength - i),
        onLowestPlaceValue ? null : numLength - (i - 3),
      );
      if (onLowestPlaceValue) return '$currency$fullNumText$trailingDecimal';
      fullNumText += ',';
    }
    return '$currency$fullNumText$trailingDecimal';
  }

  static String formatFollowers(num number) {
    final String formatted = formatNumberInput(number);

    final List<String> thousands = formatted.split(',');

    final String trailing = switch (thousands.skip(1).length) {
      1 => 'k',
      2 => 'm',
      3 => 'b',
      4 => 'tr',
      _ => '',
    };
    return '${thousands.first}$trailing';
  }

  static String formatDate(DateTime dateTime) {
    final DateTime now = DateTime.now();

    final int year = dateTime.year;
    final int month = dateTime.month;
    final int day = dateTime.day;

    if (now.difference(dateTime).inDays == 0) return 'Today';

    if (now.difference(dateTime).inDays == 1) return 'Yesterday';

    return '$day/$month/$year';
  }

  // static String formatDateOfBirth(
  //   DateTime dateTime, {
  //   bool inFull = false,
  // }) {
  //   final int day = dateTime.day;
  //
  //   final String monthText = Values.shortMonths[dateTime.month - 1];
  //   if (inFull) {
  //     final int year = dateTime.year;
  //     return '${day.toOrdinal()} $monthText, $year';
  //   }
  //
  //   return '${day.toOrdinal()} $monthText';
  // }

  static int _getHighestThreeMultiple(int numString) {
    if (numString % 3 == 0) return numString;
    return numString + (3 - (numString % 3));
  }

  static String getTimeAgo(DateTime date) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(date);
    //todo increase precision
    if (difference.inDays > 7) return DateFormat.yMd().format(date);
    if (difference.inDays > 0) return '${difference.inDays}d';
    if (difference.inHours > 0) return '${difference.inHours}hr';
    if (difference.inMinutes > 0) return '${difference.inMinutes}min';
    return 'now';
  }
}
