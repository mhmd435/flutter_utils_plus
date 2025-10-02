import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  group('DateTime extensions', () {
    test('isToday, isYesterday, isTomorrow', () {
      final now = DateTime.now();
      expect(now.isToday, isTrue);
      expect(now.subtract(const Duration(days: 1)).isYesterday, isTrue);
      expect(now.add(const Duration(days: 1)).isTomorrow, isTrue);
    });

    test('isLeapYear', () {
      expect(DateTime(2024).isLeapYear, isTrue);
      expect(DateTime(2023).isLeapYear, isFalse);
    });

    test('daysBetween', () {
      final date1 = DateTime(2023, 1, 1);
      final date2 = DateTime(2023, 1, 10);
      expect(date1.daysBetween(date2), 9);
      expect(date2.daysBetween(date1), 9);
    });

    test('formatting helpers', () {
      final date = DateTime(2023, 9, 11);
      expect(date.toShortDateString(), '2023-09-11');
      expect(date.toLongDateString(), '11 September 2023');
    });

    test('addDays and subtractDays', () {
      final date = DateTime(2023, 9, 11);
      expect(date.addDays(5), DateTime(2023, 9, 16));
      expect(date.subtractDays(11), DateTime(2023, 8, 31));
    });

    test('startOfDay and endOfDay', () {
      final date = DateTime(2023, 9, 11, 15, 30);
      expect(date.startOfDay, DateTime(2023, 9, 11));
      expect(date.endOfDay, DateTime(2023, 9, 11, 23, 59, 59, 999, 999));
    });
  });
}
