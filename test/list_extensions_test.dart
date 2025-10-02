import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('List extensions', () {
    test('firstOrNull and lastOrNull', () {
      expect(<int>[].firstOrNull, isNull);
      expect([1, 2, 3].firstOrNull, 1);
      expect(<int>[].lastOrNull, isNull);
      expect([1, 2, 3].lastOrNull, 3);
    });

    test('chunked', () {
      expect([1, 2, 3, 4, 5].chunked(2), [[1, 2], [3, 4], [5]]);
      expect(() => [1, 2].chunked(0), throwsArgumentError);
    });

    test('groupBy', () {
      final grouped = ['apple', 'apricot', 'banana', 'blueberry'].groupBy((item) => item[0]);
      expect(grouped['a'], ['apple', 'apricot']);
      expect(grouped['b'], ['banana', 'blueberry']);
    });

    test('distinct', () {
      expect([1, 1, 2, 2, 3].distinct(), [1, 2, 3]);
    });

    test('randomElement', () {
      final list = [1, 2, 3];
      final value = list.randomElement(Random(1));
      expect(list.contains(value), isTrue);
      expect(<int>[].randomElement(), isNull);
    });

    test('shuffleCopy', () {
      final list = [1, 2, 3, 4];
      final shuffled = list.shuffleCopy(Random(1));
      expect(shuffled, isNot(equals(list)));
      expect(shuffled.toSet(), list.toSet());
    });

    test('numeric helpers', () {
      final numbers = [1, 2, 3, 4];
      expect(numbers.sum(), 10);
      expect(numbers.average(), 2.5);
      expect(numbers.min(), 1);
      expect(numbers.max(), 4);
      expect(<num>[].average(), 0);
      expect(<num>[].min(), isNull);
      expect(<num>[].max(), isNull);
    });

    test('flatten', () {
      final nested = [
        [1, 2],
        [3],
        [4, 5]
      ];
      expect(nested.flatten(), [1, 2, 3, 4, 5]);
    });
  });
}
