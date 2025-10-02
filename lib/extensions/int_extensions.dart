import 'dart:math';

import 'package:intl/intl.dart';

enum DurationUnit { seconds, minutes, hours }

extension NullableIntExtensions on int? {
  /// Returns `true` when the value is not `null` and even.
  bool get isEven => this != null && this!.isEven;

  /// Returns `true` when the value is not `null` and odd.
  bool get isOdd => this != null && this!.isOdd;

  /// Converts the nullable integer to a nullable double.
  double? toDouble() => this?.toDouble();
}

extension IntExtensions on int {
  /// Formats the integer as currency using the provided [locale] and [symbol].
  String toCurrency({String locale = 'en_US', String? symbol}) {
    final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(this);
  }

  /// Converts the integer into a [Duration].
  Duration toDuration({DurationUnit unit = DurationUnit.seconds}) {
    switch (unit) {
      case DurationUnit.seconds:
        return Duration(seconds: this);
      case DurationUnit.minutes:
        return Duration(minutes: this);
      case DurationUnit.hours:
        return Duration(hours: this);
    }
  }

  /// Determines whether the integer is a prime number.
  bool get isPrime {
    if (this < 2) {
      return false;
    }
    if (this == 2) {
      return true;
    }
    if (isEven) {
      return false;
    }
    final limit = sqrt(this).floor();
    for (var i = 3; i <= limit; i += 2) {
      if (this % i == 0) {
        return false;
      }
    }
    return true;
  }

  /// Computes the factorial of the integer.
  BigInt factorial() {
    if (this < 0) {
      throw ArgumentError('Factorial is not defined for negative numbers.');
    }
    if (this == 0 || this == 1) {
      return BigInt.one;
    }
    var result = BigInt.one;
    for (var i = 2; i <= this; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }

  /// Clamps the integer between [min] and [max].
  int clampMinMax(int min, int max) {
    if (min > max) {
      throw ArgumentError('min must be less than or equal to max');
    }
    if (this < min) {
      return min;
    }
    if (this > max) {
      return max;
    }
    return this;
  }

  /// Converts the integer to a hexadecimal representation.
  String toHex() => toRadixString(16).toUpperCase();
}
