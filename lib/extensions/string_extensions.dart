extension NullableStringExtensions on String? {
  /// Returns `true` if the string is either `null` or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension StringExtensions on String {
  /// Capitalizes only the first character of the string.
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalizes each word in the string while preserving spacing.
  String capitalizeWords() {
    if (trim().isEmpty) {
      return this;
    }
    final buffer = StringBuffer();
    final parts = split(RegExp(r'(\s+)'));
    for (final part in parts) {
      if (part.trim().isEmpty) {
        buffer.write(part);
      } else {
        buffer.write(part[0].toUpperCase());
        if (part.length > 1) {
          buffer.write(part.substring(1).toLowerCase());
        }
      }
    }
    return buffer.toString();
  }

  /// Attempts to parse the string into an integer.
  int? toInt() => int.tryParse(trim());

  /// Attempts to parse the string into a double.
  double? toDouble() => double.tryParse(trim());

  /// Attempts to parse the string into a boolean.
  ///
  /// Accepts common truthy/falsy representations such as `yes`, `no`, `1`, `0`,
  /// `on`, `off`, `true`, and `false`.
  bool? toBool() {
    final lower = trim().toLowerCase();
    if (lower.isEmpty) {
      return null;
    }

    const truthy = {'true', '1', 'yes', 'y', 'on'};
    const falsy = {'false', '0', 'no', 'n', 'off'};

    if (truthy.contains(lower)) {
      return true;
    }
    if (falsy.contains(lower)) {
      return false;
    }
    return null;
  }

  /// Returns `true` if the string can be parsed as a number.
  bool get isNumeric => toDouble() != null;

  /// Basic email validation using a regular expression.
  bool get isEmail {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(trim());
  }

  /// Validates an international phone number (7-15 digits, optional leading `+`).
  bool get isPhoneNumber {
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    return phoneRegex.hasMatch(trim());
  }

  /// Truncates the string to the provided [length] and appends ellipsis if needed.
  String truncate(int length) {
    if (length < 0) {
      throw ArgumentError.value(length, 'length', 'Must be greater than or equal to 0');
    }
    if (length == 0 || isEmpty) {
      return length == 0 ? '' : this;
    }
    if (length >= this.length) {
      return this;
    }
    if (length <= 3) {
      return substring(0, length);
    }
    return '${substring(0, length - 3)}...';
  }

  /// Returns the reversed string.
  String reverse() => split('').reversed.join();

  /// Removes all whitespace characters from the string.
  String removeWhitespaces() => replaceAll(RegExp(r'\s+'), '');

  /// Returns a string containing only the digit characters.
  String onlyDigits() => replaceAll(RegExp(r'\D'), '');

  /// Case-insensitive containment check.
  bool containsIgnoreCase(String other) => toLowerCase().contains(other.toLowerCase());

  /// Parses a [DateTime] from the string.
  ///
  /// Supports ISO-8601 parsing by default and a subset of custom formats
  /// containing `yyyy`, `MM`, `dd`, `HH`, `mm`, and `ss` tokens.
  DateTime? toDateTime([String? format]) {
    final trimmed = trim();
    if (trimmed.isEmpty) {
      return null;
    }
    if (format == null) {
      return DateTime.tryParse(trimmed);
    }

    final tokenRegex = RegExp(r'(yyyy|MM|dd|HH|mm|ss)');
    final tokens = tokenRegex
        .allMatches(format)
        .map((match) => match.group(0)!)
        .toList();
    if (tokens.isEmpty) {
      return null;
    }

    final numberMatches = RegExp(r'\d+')
        .allMatches(trimmed)
        .map((match) => int.parse(match.group(0)!))
        .toList();
    if (numberMatches.length < tokens.length) {
      return null;
    }

    int? getValue(String token) {
      final index = tokens.indexOf(token);
      if (index == -1 || index >= numberMatches.length) {
        return null;
      }
      return numberMatches[index];
    }

    final year = getValue('yyyy');
    final month = getValue('MM') ?? 1;
    final day = getValue('dd') ?? 1;
    final hour = getValue('HH') ?? 0;
    final minute = getValue('mm') ?? 0;
    final second = getValue('ss') ?? 0;

    if (year == null) {
      return null;
    }

    return DateTime(year, month, day, hour, minute, second);
  }

  /// Masks the string by replacing characters between [start] and [end] with `*`.
  String mask({int start = 2, int end = 2}) {
    if (start < 0 || end < 0) {
      throw ArgumentError('start and end must be non-negative');
    }
    if (length <= start + end) {
      return '*' * length;
    }

    final maskedSectionLength = length - start - end;
    final maskedSection = '*' * maskedSectionLength;
    return '${substring(0, start)}$maskedSection${substring(length - end)}';
  }
}
