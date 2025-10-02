import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Provides convenient access to [MediaQuery.of].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Provides convenient access to [Theme.of].
  ThemeData get theme => Theme.of(this);

  /// Shortcut for [ThemeData.textTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Shortcut for [ThemeData.colorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns `true` when the current theme is dark.
  bool get isDarkMode =>
      theme.brightness == Brightness.dark || mediaQuery.platformBrightness == Brightness.dark;

  /// Returns the width of the screen.
  double get screenWidth => mediaQuery.size.width;

  /// Returns the height of the screen.
  double get screenHeight => mediaQuery.size.height;

  /// Returns the current screen orientation.
  Orientation get orientation => mediaQuery.orientation;

  /// Pushes a new [page] onto the navigation stack.
  Future<T?> pushPage<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pops the current route.
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
