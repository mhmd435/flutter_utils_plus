import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('Double extensions', () {
    test('nullable toInt', () {
      double? value;
      expect(value.toInt(), isNull);
      double? other = 3.8;
      expect(other.toInt(), 3);
    });

    test('toStringAsFixedWithoutTrailingZeros', () {
      expect(3.1400.toStringAsFixedWithoutTrailingZeros(4), '3.14');
      expect(3.0.toStringAsFixedWithoutTrailingZeros(2), '3');
    });

    test('isBetween', () {
      expect(5.0.isBetween(1, 10), isTrue);
      expect(() => 5.0.isBetween(10, 1), throwsArgumentError);
      expect(5.0.isBetween(5, 5), isTrue);
    });

    test('rounding helpers', () {
      expect(3.14159.roundTo(2), closeTo(3.14, 0.0001));
      expect(3.14159.floorTo(2), 3.14);
      expect(3.14159.ceilTo(2), 3.15);
      expect(() => 3.14.roundTo(-1), throwsArgumentError);
      expect(() => 3.14.floorTo(-1), throwsArgumentError);
      expect(() => 3.14.ceilTo(-1), throwsArgumentError);
    });

    test('percentageOf', () {
      expect(50.0.percentageOf(200), 25);
      expect(10.0.percentageOf(0), 0);
    });

    test('formatAsCurrency', () {
      final expected = NumberFormat.currency(locale: 'en_US').format(1234.56);
      expect(1234.56.formatAsCurrency(), expected);
      expect(1234.56.formatAsCurrency(locale: 'en_US', symbol: 'USD '), 'USD 1,234.56');
    });
  });
}
