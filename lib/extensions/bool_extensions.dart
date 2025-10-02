extension BoolExtensions on bool {
  /// Returns the inverted boolean value.
  bool toggle() => !this;

  /// Converts the boolean to an integer (`true` = 1, `false` = 0).
  int toInt() => this ? 1 : 0;

  /// Converts the boolean to a `Yes`/`No` string.
  String toYesNo() => this ? 'Yes' : 'No';

  /// Converts the boolean to an `On`/`Off` string.
  String toOnOff() => this ? 'On' : 'Off';
}
