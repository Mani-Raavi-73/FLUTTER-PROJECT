import 'package:flutter/material.dart';

class AppTheme {
  // Primary Medical Colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color darkBlue = Color(0xFF1976D2);
  static const Color lightBlue = Color(0xFFE3F2FD);
  static const Color scaffoldBackground = Color(0xFFF5F7FA);
  static const Color cardBackground = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);

  // Vital Sign Palette (Soft backgrounds with matching accents)
  static const Color heartRateBg = Color(0xFFFFEBEE);
  static const Color heartRateAccent = Color(0xFFE53935);

  static const Color bloodPressureBg = Color(0xFFEDE7F6);
  static const Color bloodPressureAccent = Color(0xFF5E35B1);

  static const Color temperatureBg = Color(0xFFFFF3E0);
  static const Color temperatureAccent = Color(0xFFFB8C00);

  static const Color oxygenBg = Color(0xFFE0F2F1);
  static const Color oxygenAccent = Color(0xFF00897B);

  // Status Colors
  static const Color statusGreenBg = Color(0xFFE8F5E9);
  static const Color statusGreenText = Color(0xFF2E7D32);

  // Border & Divider
  static const Color borderColor = Color(0xFFE2E8F0);

  // Box Shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.04),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.02),
          blurRadius: 6,
          offset: const Offset(0, 1),
        ),
      ];

  // Material 3 ThemeData
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        surface: scaffoldBackground,
      ),
      scaffoldBackgroundColor: scaffoldBackground,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffoldBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
    );
  }
}
