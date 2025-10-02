import 'dart:math';

import 'package:intl/intl.dart';

extension NullableDoubleExtensions on double? {
  /// Converts the nullable double to an integer using [double.toInt].
  int? toInt() => this?.toInt();
}

extension DoubleExtensions on double {
  /// Converts the double to a string without unnecessary trailing zeros.
  String toStringAsFixedWithoutTrailingZeros([int fractionDigits = 2]) {
    var fixed = toStringAsFixed(fractionDigits);
    while (fixed.contains('.') && fixed.endsWith('0')) {
      fixed = fixed.substring(0, fixed.length - 1);
    }
    if (fixed.endsWith('.')) {
      fixed = fixed.substring(0, fixed.length - 1);
    }
    return fixed;
  }

  /// Returns `true` if the value lies between [min] and [max] inclusively.
  bool isBetween(num min, num max) {
    if (min > max) {
      throw ArgumentError('min must be less than or equal to max');
    }
    return this >= min && this <= max;
  }

  /// Rounds the value to [decimals] decimal places.
  double roundTo(int decimals) {
    if (decimals < 0) {
      throw ArgumentError('decimals must be non-negative');
    }
    final factor = pow(10, decimals);
    return (this * factor).round() / factor;
  }

  /// Floors the value to [decimals] decimal places.
  double floorTo(int decimals) {
    if (decimals < 0) {
      throw ArgumentError('decimals must be non-negative');
    }
    final factor = pow(10, decimals);
    return (this * factor).floor() / factor;
  }

  /// Ceils the value to [decimals] decimal places.
  double ceilTo(int decimals) {
    if (decimals < 0) {
      throw ArgumentError('decimals must be non-negative');
    }
    final factor = pow(10, decimals);
    return (this * factor).ceil() / factor;
  }

  /// Calculates the percentage that this value represents of [total].
  double percentageOf(num total) {
    if (total == 0) {
      return 0;
    }
    return (this / total) * 100;
  }

  /// Formats the value as a currency string.
  String formatAsCurrency({String locale = 'en_US', String? symbol}) {
    final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(this);
  }
}
