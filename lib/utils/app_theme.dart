import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const _kAccentColor = Color(0xFFE64A68);
  static const kSecondaryColor = Color(0xFF032170);

  static const _elevation = 1.5;

  static const bodyTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 14,
  );

  static const dialogInsetPadding = EdgeInsets.fromLTRB(10, 100, 10, 100);

  static ThemeData _baseTheme(Brightness brightness) {
    return ThemeData(brightness: brightness).copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _kAccentColor,
        secondary: _kAccentColor,
      ),
      toggleableActiveColor: _kAccentColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _kAccentColor,
        selectionColor: _kAccentColor.withOpacity(0.75),
        selectionHandleColor: _kAccentColor.withOpacity(0.75),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: _kAccentColor,
          shadowColor: _kAccentColor,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _elevation,
        highlightElevation: _elevation,
        backgroundColor: _kAccentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _kAccentColor,
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static final lightTheme = _baseTheme(Brightness.light);
  static final darkTheme = _baseTheme(Brightness.dark).copyWith(
    scaffoldBackgroundColor: const Color(0xFF060A29),
    cardColor: kSecondaryColor,
  );
}
