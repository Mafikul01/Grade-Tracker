import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF009688);
  static const Color secondaryColor = Color(0xFF00BCD4);
  static const Color accentColor = Color(0xFF4CAF50);

  static const Color backgroundLight1 = Color(0xFFE0F2F1);
  static const Color backgroundLight2 = Color(0xFFF0F4F8);

  static const Color backgroundDark1 = Color(0xFF1E272E);
  static const Color backgroundDark2 = Color(0xFF101820);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: Colors.white,
        onSurface: const Color(0xFF2D3436),
        surfaceContainerHighest: const Color(
          0xFFF0F4F8,
        ), // Used for second gradient color
      ),
      scaffoldBackgroundColor: const Color(0xFFF0F4F8),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For Android
          statusBarBrightness: Brightness.light, // For iOS
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF2D3436),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: primaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: primaryColor.withValues(alpha: 0.3),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: const Color(0xFF1E272E),
        onSurface: Colors.white,
        surfaceContainerHighest: const Color(
          0xFF101820,
        ), // Used for second gradient color
      ),
      scaffoldBackgroundColor: const Color(0xFF101820),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E272E),
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For Android
          statusBarBrightness: Brightness.dark, // For iOS
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2D3436),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: secondaryColor, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: secondaryColor,
      ),
    );
  }
}
