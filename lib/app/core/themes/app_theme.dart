import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sese/app/core/values/app_colors.dart';

class CustomTextStyle extends TextStyle {
  static TextStyle h1(Color color) {
    return GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h2(Color color) {
    return GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h3(Color color) {
    return GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h4(Color color) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h5(Color color) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h6(Color color) {
    return GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle t1(Color color) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle t2(Color color) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle t3(Color color) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle t4(Color color) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle t5(Color color) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
      height: 1.8,
    );
  }

  static TextStyle t6(Color color) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle t7(Color color) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle t8(Color color) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle t9(Color color) {
    return GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle t10(Color color) {
    return GoogleFonts.inter(
      fontSize: 10.5,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle link(Color color) {
    return GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}

class AppTheme {
  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    ),
  );

  static final TextButtonThemeData _secondaryButtonDarkThemeData =
      TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))));
  static final TextButtonThemeData _secondaryButtonLightThemeData =
      TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))));

  static final OutlinedButtonThemeData _outlinedButtonDarkThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))));

  static final OutlinedButtonThemeData _outlinedButtonLightThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              side: const BorderSide(color: AppColors.primaryColor, width: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))));
  static TextTheme _textTheme(Color textColor) => TextTheme(
        displayLarge: GoogleFonts.inter(
          color: textColor,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: GoogleFonts.inter(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: GoogleFonts.inter(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.inter(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.inter(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 10.5,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: GoogleFonts.montserrat(
          color: textColor.withOpacity(0.5),
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          wordSpacing: 1.5,
        ),
        bodySmall: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 14,
        ),
        labelSmall: GoogleFonts.montserrat(
          color: textColor,
        ),
      );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: AppColors.lightBackgroundColor,
      iconTheme: const IconThemeData(color: AppColors.darkBackgroundColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.lightTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 1.5,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    textButtonTheme: _secondaryButtonLightThemeData,
    outlinedButtonTheme: _outlinedButtonLightThemeData,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedIconTheme:
          const IconThemeData(color: AppColors.primaryColor, opacity: 1),
      unselectedIconTheme: const IconThemeData(
          color: AppColors.lightGreyColor,
          opacity: AppColors.disabledIconOpacity),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.lightTextColor,
      unselectedLabelColor:
          AppColors.lightTextColor.withOpacity(AppColors.disabledTextOpacity),
      labelPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 12.0),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: AppColors.lightTextColor),
      ),
    ),
    textTheme: _textTheme(AppColors.lightTextColor),
    iconTheme: const IconThemeData(color: AppColors.lightTextColor),
    scaffoldBackgroundColor: AppColors.lightDeepBackgroundColor,
    dividerColor:
        AppColors.lightTextColor.withOpacity(AppColors.disabledTextOpacity),
    colorScheme: const ColorScheme.light()
        .copyWith(
          primary: AppColors.primaryColor,
        )
        .copyWith(background: AppColors.lightBackgroundColor),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: AppColors.darkBackgroundColor,
      iconTheme: const IconThemeData(color: AppColors.lightBackgroundColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 1.5,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    textButtonTheme: _secondaryButtonDarkThemeData,
    outlinedButtonTheme: _outlinedButtonDarkThemeData,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedIconTheme:
          const IconThemeData(color: AppColors.darkTextColor, opacity: 1),
      unselectedIconTheme: const IconThemeData(
          color: AppColors.darkTextColor,
          opacity: AppColors.disabledIconOpacity),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.darkTextColor,
      unselectedLabelColor:
          AppColors.darkTextColor.withOpacity(AppColors.disabledTextOpacity),
      labelPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 12.0),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: AppColors.darkTextColor),
      ),
    ),
    textTheme: _textTheme(AppColors.darkTextColor),
    iconTheme: const IconThemeData(color: AppColors.darkTextColor),
    scaffoldBackgroundColor: AppColors.darkDeepBackgroundColor,
    dividerColor:
        AppColors.darkTextColor.withOpacity(AppColors.disabledTextOpacity),
    colorScheme: const ColorScheme.dark()
        .copyWith(
          primary: AppColors.primaryColor,
        )
        .copyWith(background: AppColors.darkBackgroundColor),
  );
  static ThemeData currentTheme = (Get.isDarkMode ? darkTheme : lightTheme);
}
