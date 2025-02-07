// ignore_for_file: deprecated_member_use

import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:flutter/material.dart';

T darkModeBase<T>(bool isDark, {T? light, T? dark}) {
  T child;
  if (!isDark || dark == null) {
    child = light as T;
  } else {
    child = dark;
  }
  return child;
}

class EmpAppStyle extends StatelessWidget {
  final Widget child;

  const EmpAppStyle({super.key, required this.child});

  static const String bold = 'Roboto_bold';

  static TextTheme empBlackRobotoCondensed = const TextTheme(
    displayLarge: TextStyle(
        debugLabel: 'roboto headline1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black54,
        decoration: TextDecoration.none),
    displayMedium: TextStyle(
        debugLabel: 'roboto headline2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black54,
        decoration: TextDecoration.none),
    displaySmall: TextStyle(
        debugLabel: 'roboto headline3',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black54,
        decoration: TextDecoration.none),
    headlineMedium: TextStyle(
        debugLabel: 'roboto headline4',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black54,
        decoration: TextDecoration.none),
    headlineSmall: TextStyle(
        debugLabel: 'roboto headline5',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    titleLarge: TextStyle(
        debugLabel: 'roboto headline6',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    bodyLarge: TextStyle(
        debugLabel: 'roboto bodyText1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    bodyMedium: TextStyle(
        debugLabel: 'roboto bodyText2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    titleMedium: TextStyle(
        debugLabel: 'roboto subtitle1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    titleSmall: TextStyle(
        debugLabel: 'roboto subtitle2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black,
        decoration: TextDecoration.none),
    bodySmall: TextStyle(
        debugLabel: 'roboto caption',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black54,
        decoration: TextDecoration.none),
    labelLarge: TextStyle(
        debugLabel: 'roboto button',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black87,
        decoration: TextDecoration.none),
    labelSmall: TextStyle(
        debugLabel: 'roboto overline',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.black,
        decoration: TextDecoration.none),
  );

  static TextTheme empWhiteRobotoCondensed = const TextTheme(
    displayLarge: TextStyle(
        debugLabel: 'roboto headline1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white70,
        decoration: TextDecoration.none),
    displayMedium: TextStyle(
        debugLabel: 'roboto headline2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white70,
        decoration: TextDecoration.none),
    displaySmall: TextStyle(
        debugLabel: 'roboto headline3',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white70,
        decoration: TextDecoration.none),
    headlineMedium: TextStyle(
        debugLabel: 'roboto headline4',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white70,
        decoration: TextDecoration.none),
    headlineSmall: TextStyle(
        debugLabel: 'roboto headline5',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    titleLarge: TextStyle(
        debugLabel: 'roboto headline6',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    titleMedium: TextStyle(
        debugLabel: 'roboto subtitle1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    bodyLarge: TextStyle(
        debugLabel: 'roboto bodyText1',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    bodyMedium: TextStyle(
        debugLabel: 'roboto bodyText2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    bodySmall: TextStyle(
        debugLabel: 'roboto caption',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white70,
        decoration: TextDecoration.none),
    labelLarge: TextStyle(
        debugLabel: 'roboto button',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    titleSmall: TextStyle(
        debugLabel: 'roboto subtitle2',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
    labelSmall: TextStyle(
        debugLabel: 'roboto overline',
        fontFamily: 'Roboto',
        inherit: true,
        color: Colors.white,
        decoration: TextDecoration.none),
  );

  static TextTheme empLightText = ThemeData.light().textTheme.copyWith(
        displayLarge: const TextStyle(
            fontSize: 96.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        displayMedium: const TextStyle(
            fontSize: 60.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        displaySmall: const TextStyle(
            fontSize: 48.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        headlineMedium: const TextStyle(
            fontSize: 34.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        headlineSmall: const TextStyle(
            fontSize: 24.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        titleLarge: const TextStyle(
            fontSize: 20.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        titleMedium: const TextStyle(
            fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        titleSmall: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        bodyLarge: const TextStyle(
            fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        bodyMedium: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        labelLarge: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        bodySmall: const TextStyle(
            fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        labelSmall: const TextStyle(
            fontSize: 10.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
      );

  static TextTheme empDarkText = ThemeData.dark().textTheme.copyWith(
        displayLarge: const TextStyle(
            fontSize: 96.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        displayMedium: const TextStyle(
            fontSize: 60.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        displaySmall: const TextStyle(
            fontSize: 48.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        headlineMedium: const TextStyle(
            fontSize: 34.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        headlineSmall: const TextStyle(
            fontSize: 24.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        titleLarge: const TextStyle(
            fontSize: 20.0, fontFamily: 'Roboto', fontWeight: FontWeight.w800),
        titleMedium: const TextStyle(
            fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        titleSmall: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        bodyLarge: const TextStyle(
            fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        bodyMedium: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        labelLarge: const TextStyle(
            fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        bodySmall: const TextStyle(
            fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
        labelSmall: const TextStyle(
            fontSize: 10.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
      );

  ///
  ///PRIMARY [DARK] THEME
  ///
  /*
  static ThemeData primaryDarkTheme = darkTheme.copyWith(
    appBarTheme: darkTheme.appBarTheme.copyWith(
      brightness: Brightness.dark,
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      textTheme: darkText,
    ),
  ); 
  */

  ///
  ///PRIMARY [LIGHT] THEME
  ///
  /*
  static ThemeData primaryLightTheme = lightTheme.copyWith(
    appBarTheme: lightTheme.appBarTheme.copyWith(
      // systemOverlayStyle: SystemUiOverlayStyle(),
      brightness: Brightness.dark,
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      textTheme: darkText,
    ),
  );
   */

  /*
	 *  LIGHT THEME
	 */
  static ThemeData empLightTheme = ThemeData(
    fontFamily: 'Roboto',
    textTheme: empBlackRobotoCondensed,
    primaryColor: EmpColors.primary,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: EmpColors.primary,
      primaryContainer: EmpColors.black,
      secondary: EmpColors.secondary,
      secondaryContainer: EmpColors.black,
      error: Colors.red,
      surface: Colors.white,
      background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: ThemeData.light().iconTheme,
    primaryTextTheme: empLightText,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: EmpColors.primary,
          elevation: 1,
          centerTitle: false,
          // textTheme: lightText,
        ),
    bottomNavigationBarTheme:
        ThemeData.light().bottomNavigationBarTheme.copyWith(
              backgroundColor: Colors.white,
              selectedItemColor: EmpColors.primary,
            ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      fillColor: Colors.white,
      focusColor: EmpColors.primary,
      labelStyle: const TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: EmpColors.black),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: const TextStyle(color: Colors.red),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
    ),
    cardTheme: ThemeData.light().cardTheme,
    cardColor: ThemeData.light().cardColor,
    buttonTheme: ThemeData.light().buttonTheme.copyWith(
          buttonColor: EmpColors.primary,
          colorScheme: const ColorScheme(
            primary: EmpColors.primary,
            primaryContainer: EmpColors.primary,
            secondary: EmpColors.secondary,
            secondaryContainer: EmpColors.secondary,
            surface: EmpColors.primary,
            background: EmpColors.primary,
            error: Colors.red,
            onPrimary: EmpColors.primary,
            onSecondary: EmpColors.primary,
            onSurface: EmpColors.primary,
            onBackground: EmpColors.primary,
            onError: Colors.red,
            brightness: Brightness.light,
          ),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: EmpColors.primary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: EmpColors.primary,
      ),
    ),
  );

  /*
	 *  Dark THEME
	 */
  static ThemeData empDarkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    textTheme: empWhiteRobotoCondensed,
    primaryColor: EmpColors.primary,
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: ThemeData.dark().iconTheme,
    primaryTextTheme: empDarkText,
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          color: Colors.black,
          elevation: 1,
          centerTitle: false,
          // textTheme: darkText,
        ),
    bottomNavigationBarTheme:
        ThemeData.dark().bottomNavigationBarTheme.copyWith(
              backgroundColor: Colors.black,
              selectedItemColor: EmpColors.primary,
            ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: EmpColors.black),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: const TextStyle(color: Colors.red),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      focusColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: EmpColors.light),
      ),
    ),
    cardTheme: ThemeData.dark().cardTheme,
    cardColor: ThemeData.dark().cardColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: EmpColors.secondary),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: EmpAppStyle.empLightTheme,
      child: child,
    );
  }
}
