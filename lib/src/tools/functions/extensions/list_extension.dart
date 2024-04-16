part of 'extensions.dart';

extension ObjectExtension on Object {
  List<T> singleList<T>() => [this].cast();
}

extension ListExtension<T> on List<T> {
  List<List<T>> chunk(int chunkSize) {
    List<List<T>> result = [];

    if (length <= chunkSize) {
      result.add(this);
    } else {
      for (int i = 0; i < length; i += chunkSize) {
        result.add(
          sublist(i, i + chunkSize > length ? length : i + chunkSize),
        );
      }
    }

    return result;
  }

  List<String> toEachString() => map<String>((e) => e.toString()).toList();

  int get lastIndex => length - 1;

  T? get lastOrNull => isEmpty ? null : last;

  T? get firstOrNull => isEmpty ? null : first;

  List<T> get copy => List.from(this);

  List<T>? get nullIfEmpty => isEmpty ? null : this;

  T? tryRemoveLast() {
    try {
      return removeLast();
    } catch (e) {
      return null;
    }
  }

  void addAllWhereAbsent(Iterable<T> it) {
    if (it.isEmpty) return;

    if (isEmpty) return addAll(it);

    for (T item in it) {
      if (!contains(item)) {
        add(item);
      }
    }
  }

  List<T> removeDuplicates({
    bool Function(T previous, T next)? test,
  }) {
    if (isEmpty) return [];
    if (test == null) return toSet().toList();
    final List<T> result = [];

    for (T item in this) {
      if (result.containsWhere((element) => test(item, element))) continue;
      result.add(item);
    }

    return result;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  T? lastWhereOrNull(bool Function(T element) test) {
    try {
      return lastWhere(test);
    } catch (e) {
      return null;
    }
  }

  bool everyAfter(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(index + 1);
    return nextList.every(test);
  }

  bool isEqualTo(List<T> list) {
    if (length != list.length) return false;
    for (int i = 0; i < length; i++) {
      if (this[i] != list[i]) return false;
    }
    return true;
  }

  bool isEqualBy(
    List<T> list,
    bool Function(T element, T other) equalityChecker,
  ) {
    if (length != list.length) return false;
    for (int i = 0; i < length; i++) {
      if (!equalityChecker(this[i], list[i])) return false;
    }
    return true;
  }

  List<E> mapWithIndex<E>(E Function(int index, T element) test) {
    final List<E> nextList = [];
    for (int i = 0; i < length; i++) {
      nextList.add(test(i, this[i]));
    }
    return nextList;
  }

  void clearDuplicates() {
    final List<T> nextList = [];
    for (int i = 0; i < length; i++) {
      if (!nextList.contains(this[i])) {
        nextList.add(this[i]);
      }
    }
    clear();
    addAll(nextList);
  }

  void clearDuplicatesWhere(bool Function(T element1, T element2) test) {
    final List<T> nextList = [];
    for (int i = 0; i < length; i++) {
      if (!nextList.containsWhere((element) => test(element, this[i]))) {
        nextList.add(this[i]);
      }
    }
    clear();
    addAll(nextList);
  }

  void replaceWhere(Iterable<T> replacement, bool Function(T element) test) {
    int index = indexWhere(test);

    if (index == -1) throw StateError('index not found in $this');
    replaceRange(index, index + 1, replacement);
  }

  void replaceOrAddWhere(
    Iterable<T> replacement,
    bool Function(T element) test,
  ) {
    int index = indexWhere(test);

    if (index == -1) {
      return addAll(replacement);
    }
    replaceRange(index, index + 1, replacement);
  }

  bool everyBetween(int start, int end, bool Function(T element) test) {
    final List<T> nextList = sublist(start, end);
    return nextList.every(test);
  }

  bool anyAfter(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(index + 1);
    return nextList.any(test);
  }

  bool anyBetween(int start, int end, bool Function(T element) test) {
    final List<T> nextList = sublist(start, end);
    return nextList.any(test);
  }

  bool anyBefore(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(0, index);
    return nextList.any(test);
  }

  void forEachWhere(
    bool Function(T element) test,
    void Function(T element) action,
  ) {
    for (T element in this) {
      if (test(element)) {
        action(element);
      }
    }
  }

  void forEachWhereAfter({
    required int index,
    required bool Function(T element) where,
    required void Function(T element) action,
  }) {
    final List<T> nextList = sublist(index + 1);
    nextList.forEachWhere(where, action);
  }

  void forEachWhereBefore({
    required int index,
    required bool Function(T element) where,
    required void Function(T element) action,
  }) {
    final List<T> nextList = sublist(0, index);
    nextList.forEachWhere(where, action);
  }

  void forEachWhereBeforeWithIndex({
    required int index,
    required bool Function(T element) where,
    required void Function(int index) action,
  }) {
    final List<T> nextList = sublist(0, index);

    for (int i = 0; i < nextList.length; i++) {
      if (where(nextList[i])) {
        action(i);
      }
    }
  }

  void forEachAfter(
    int index,
    void Function(T element) action,
  ) {
    final List<T> nextList = sublist(index + 1);
    nextList.forEach(action);
  }

  List<T> operator *(int times) {
    if (isEmpty) return [];

    final List<T> nextList = [];
    for (int i = 0; i < times; i++) {
      nextList.addAll(this);
    }

    return nextList;
  }

  bool containsAll(Iterable<T> it) {
    for (T item in it) {
      if (!contains(item)) return false;
    }
    return true;
  }

  void subtractivelyAddUnique(
    Iterable<T> it, {
    required bool Function(T current, T element) test,
  }) {
    final List<(int, T)> replacementIndexes = [];

    for (final T item in it) {
      final int indexContained = indexWhere(
        (element) => test(element, item),
      );

      replacementIndexes.add((indexContained, item));
    }

    for (final (index, item) in replacementIndexes) {
      if (index == -1) {
        add(item);
      } else {
        this[index] = item;
      }
    }
  }

  void addWhereAbsent(Iterable<T> it) {
    for (T item in it) {
      if (!contains(item)) {
        add(item);
      }
    }
  }

  bool isFirst(T element, [bool Function(T? element)? test]) {
    if (isEmpty) return false;
    return test?.call(first) ?? first == element;
  }

  T? elementAtOrNull(int index) {
    try {
      return this[index];
    } catch (e) {
      return null;
    }
  }

  bool hasElementAfter(T element) {
    if (!contains(element)) throw StateError('test element is not in list');

    if (isLast(element)) return false;

    return true;
  }

  bool isLast(T element, [bool Function(T? element)? test]) {
    if (isEmpty) return false;
    return test?.call(last) ?? last == element;
  }

  bool containsWhere(bool Function(T element) test) {
    for (T element in this) {
      bool satisfied = test(element);
      if (satisfied) {
        return true;
      }
    }
    return false;
  }

  void pushFront(T element) {
    return insert(0, element);
  }

  T get lastItem {
    if (isEmpty) throw StateError('List is Empty');
    return this[length - 1];
  }

  List<T> operator +(List<T> other) {
    final List<T> tempList = [];
    tempList.addAll(this);
    tempList.addAll(other);
    return tempList;
  }

  bool isEachEqual(List<T> other) {
    if (length != other.length) return false;
    if (isEmpty && other.isEmpty) return true;
    if (isEmpty ^ other.isEmpty) return false;
    bool isEqual = false;
    for (int i = 0; i < length; i++) {
      isEqual = [i] == other[i];
    }
    return isEqual;
  }

  void replaceLast(Iterable<T> replacement) {
    if (length == 0) throw StateError('List is empty');
    replaceRange(length - 1, length, replacement);
  }

  void addIfAbsent(T element) {
    if (contains(element)) return;
    add(element);
  }

  void replaceFirst(Iterable<T> replacement) {
    if (length == 0) throw StateError('List is empty');
    replaceRange(0, 1, replacement);
  }
}
