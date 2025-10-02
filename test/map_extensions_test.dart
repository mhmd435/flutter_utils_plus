import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('Map extensions', () {
    test('invert', () {
      final map = {'a': 1, 'b': 2};
      expect(map.invert(), {1: 'a', 2: 'b'});
    });

    test('mapKeys and mapValues', () {
      final map = {'a': 1, 'bb': 2};
      expect(map.mapKeys((key) => key.length), {1: 1, 2: 2});
      expect(map.mapValues((value) => value * 2), {'a': 2, 'bb': 4});
    });

    test('pick', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      expect(map.pick(['a', 'c']), {'a': 1, 'c': 3});
      expect(map.pick(['d']), {});
    });

    test('omit', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      expect(map.omit(['a', 'c']), {'b': 2});
    });

    test('merge', () {
      final base = {'a': 1, 'b': 2};
      final other = {'b': 3, 'c': 4};
      expect(base.merge(other), {'a': 1, 'b': 3, 'c': 4});
    });
  });
}
