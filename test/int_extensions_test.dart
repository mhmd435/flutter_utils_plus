import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('Int extensions', () {
    test('nullable helpers', () {
      int? value;
      expect(value.isEven, isFalse);
      expect(value.isOdd, isFalse);
      expect(value.toDouble(), isNull);
      int? another = 4;
      expect(another.isEven, isTrue);
      expect(another.isOdd, isFalse);
      expect(another.toDouble(), 4.0);
    });

    test('toCurrency', () {
      final expected = NumberFormat.currency(locale: 'en_US').format(1000);
      expect(1000.toCurrency(), expected);
      expect(1000.toCurrency(locale: 'en_US', symbol: 'USD '), 'USD 1,000.00');
    });

    test('toDuration', () {
      expect(30.toDuration(), const Duration(seconds: 30));
      expect(2.toDuration(unit: DurationUnit.minutes), const Duration(minutes: 2));
      expect(1.toDuration(unit: DurationUnit.hours), const Duration(hours: 1));
    });

    test('isPrime', () {
      expect(2.isPrime, isTrue);
      expect(17.isPrime, isTrue);
      expect(1.isPrime, isFalse);
      expect(18.isPrime, isFalse);
    });

    test('factorial', () {
      expect(0.factorial(), BigInt.one);
      expect(5.factorial(), BigInt.from(120));
      expect(() => (-1).factorial(), throwsArgumentError);
    });

    test('clampMinMax', () {
      expect(5.clampMinMax(1, 10), 5);
      expect(0.clampMinMax(1, 10), 1);
      expect(20.clampMinMax(1, 10), 10);
      expect(() => 5.clampMinMax(10, 1), throwsArgumentError);
    });

    test('toHex', () {
      expect(255.toHex(), 'FF');
      expect(16.toHex(), '10');
    });
  });
}
