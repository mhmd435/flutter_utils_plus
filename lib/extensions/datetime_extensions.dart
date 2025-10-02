import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Returns `true` if this date is today.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Returns `true` if this date was yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  /// Returns `true` if this date is tomorrow.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  /// Returns `true` if the year is a leap year.
  bool get isLeapYear {
    if (year % 400 == 0) {
      return true;
    }
    if (year % 100 == 0) {
      return false;
    }
    return year % 4 == 0;
  }

  /// Returns the number of days between this date and [other].
  int daysBetween(DateTime other) {
    final a = DateTime(year, month, day);
    final b = DateTime(other.year, other.month, other.day);
    return a.difference(b).inDays.abs();
  }

  /// Returns the date formatted as `YYYY-MM-DD`.
  String toShortDateString() {
    final yyyy = year.toString().padLeft(4, '0');
    final mm = month.toString().padLeft(2, '0');
    final dd = day.toString().padLeft(2, '0');
    return '$yyyy-$mm-$dd';
  }

  /// Returns the date formatted as `11 September 2025`.
  String toLongDateString() => DateFormat('d MMMM yyyy').format(this);

  /// Returns a new [DateTime] by adding [days].
  DateTime addDays(int days) => add(Duration(days: days));

  /// Returns a new [DateTime] by subtracting [days].
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// Returns the start of the day (midnight).
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns the end of the day.
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);
}
