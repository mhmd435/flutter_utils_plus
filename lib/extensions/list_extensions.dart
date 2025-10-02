import 'dart:math';

extension ListExtensions<T> on List<T> {
  /// Returns the first element or `null` if the list is empty.
  T? get firstOrNull => isEmpty ? null : first;

  /// Returns the last element or `null` if the list is empty.
  T? get lastOrNull => isEmpty ? null : last;

  /// Splits the list into chunks of the given [size].
  List<List<T>> chunked(int size) {
    if (size <= 0) {
      throw ArgumentError('size must be greater than 0');
    }
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      final end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }

  /// Groups the list elements by the provided [keySelector].
  Map<K, List<T>> groupBy<K>(K Function(T element) keySelector) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => <T>[]).add(element);
    }
    return map;
  }

  /// Returns a list containing distinct elements while preserving order.
  List<T> distinct() {
    final set = <T>{};
    final result = <T>[];
    for (final element in this) {
      if (set.add(element)) {
        result.add(element);
      }
    }
    return result;
  }

  /// Returns a random element from the list or `null` if empty.
  T? randomElement([Random? random]) {
    if (isEmpty) {
      return null;
    }
    final rng = random ?? Random();
    return this[rng.nextInt(length)];
  }

  /// Returns a shuffled copy of the list.
  List<T> shuffleCopy([Random? random]) {
    final copy = List<T>.from(this);
    copy.shuffle(random);
    return copy;
  }
}

extension NumListExtensions on List<num> {
  /// Returns the sum of all elements in the list.
  num sum() => fold<num>(0, (previousValue, element) => previousValue + element);

  /// Returns the average of the list elements.
  double average() => isEmpty ? 0 : sum().toDouble() / length;

  /// Returns the minimum value in the list or `null` if empty.
  num? min() => isEmpty ? null : reduce((value, element) => value < element ? value : element);

  /// Returns the maximum value in the list or `null` if empty.
  num? max() => isEmpty ? null : reduce((value, element) => value > element ? value : element);
}

extension NestedListExtensions<T> on List<List<T>> {
  /// Flattens the nested list into a single list.
  List<T> flatten() => expand((element) => element).toList();
}
