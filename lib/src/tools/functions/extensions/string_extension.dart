part of 'extensions.dart';

extension StringExtension on String {
  String toFirstUpperCase() {
    if (isEmpty) return '';
    if (length == 1) return toUpperCase();
    final List<String> charsList = chars;

    final String first = charsList.first;
    final String remainingChars = charsList.join().replaceFirst(first, '');

    return '${first.toUpperCase()}$remainingChars';
  }

  String get cleanLower => trim().toLowerCase();

  String get cleanUnderScoreFirstUpper =>
      replaceAll('_', ' ').toLowerCase().toFirstUpperCase();

  String get possessive => chars.last == 's' ? '$this\'' : '$this\'s';

  String get cleanUpper => trim().toUpperCase();

  String removeAll(String pattern) {
    return replaceAll(pattern, '');
  }

  String joinRequestPath(String extra) {
    return '$this/$extra';
  }

  String pluralize() {
    if (isEmpty) return '';
    if (length == 1) return toUpperCase();
    if (chars.last == 's') return this;
    if (chars.last == 'y') return replaceRange(length - 1, length, 'ies');
    return '${this}s';
  }

  String removeAtLast(String pattern) {
    if (chars.last == pattern) {
      return substring(0, length - 1);
    }
    return this;
  }

  bool get isNetworkUrl => split(':').first.contains('http');

  String? get nullIfEmpty => isEmpty ? null : this;

  String get reversed => chars.reversed.join();

  String removeAllAtLast(List<String> patterns) {
    String result = this;
    for (final String pattern in patterns) {
      result = result.removeAtLast(pattern);
      return result;
    }
    return result;
  }

  List<String> get words => split(' ');

  String toEachFirstUpperCase() {
    if (isEmpty) return '';
    if (length == 1) return toUpperCase();
    final List<String> upperWords = words.map((e) {
      return e.toFirstUpperCase();
    }).toList();
    return upperWords.join(' ');
  }

  String get linesRemoved => removeAll('\n');

  List<String> get chars => split('');

  String addParam({required String key, required String value}) {
    if (contains('?')) return '$this&$key=$value';
    return '$this?$key=$value';
  }

  String replaceLast(String from, String to, [int startIndex = 0]) {
    for (int i = (length - 1); i >= startIndex; i--) {
      if (this[i] == from) {
        return replaceRange(i, i + 1, to);
      }
    }
    return this;
  }
}

String stringFromUtf8Encoded(List<int> data) => utf8.decode(data);

extension NullableStringExtension on String? {
  String get orEmpty => this ?? '';

  bool get isNullOrEmpty => orEmpty.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
