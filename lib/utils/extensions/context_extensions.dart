import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  OverlayState get overlay => Overlay.of(this);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
  NavigatorState get navigator => Navigator.of(this);
  // Locale get locale => Localizations.localeOf(this);
  TextDirection get textDirection => Directionality.of(this);
  TextStyle? get dispLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get dispMid => Theme.of(this).textTheme.displayMedium;
  TextStyle? get dispSml => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headMid => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get bodLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodMid => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodSml => Theme.of(this).textTheme.bodySmall;
  Color? get primaryColor => Theme.of(this).primaryColor;
  //GoRouter get router => GoRouter.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get top => mediaQuery.viewPadding.top;
  double get bottom => mediaQuery.viewPadding.bottom;

  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom != 0.0;
  bool get isFullScreen => top == 0.0 && bottom == 0.0;
}
