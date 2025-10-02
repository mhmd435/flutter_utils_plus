extension MapExtensions<K, V> on Map<K, V> {
  /// Inverts the map by swapping keys and values.
  Map<V, K> invert() {
    final inverted = <V, K>{};
    for (final entry in entries) {
      inverted[entry.value] = entry.key;
    }
    return inverted;
  }

  /// Maps the keys using [transform].
  Map<T, V> mapKeys<T>(T Function(K key) transform) {
    final result = <T, V>{};
    for (final entry in entries) {
      result[transform(entry.key)] = entry.value;
    }
    return result;
  }

  /// Maps the values using [transform].
  Map<K, R> mapValues<R>(R Function(V value) transform) {
    final result = <K, R>{};
    for (final entry in entries) {
      result[entry.key] = transform(entry.value);
    }
    return result;
  }

  /// Returns a new map containing only the [keys].
  Map<K, V> pick(Iterable<K> keys) {
    final result = <K, V>{};
    for (final key in keys) {
      if (containsKey(key)) {
        result[key] = this[key] as V;
      }
    }
    return result;
  }

  /// Returns a new map excluding the [keys].
  Map<K, V> omit(Iterable<K> keys) {
    final exclude = keys.toSet();
    final result = <K, V>{};
    for (final entry in entries) {
      if (!exclude.contains(entry.key)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  /// Returns a new map merging this map with [other]. Values in [other] win.
  Map<K, V> merge(Map<K, V> other) {
    return {...this, ...other};
  }
}
