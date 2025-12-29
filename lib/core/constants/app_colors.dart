import 'package:flutter/material.dart';

/// App-wide color palette - Finance-themed with dark green primary
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary - Dark Green (professional, trustworthy)
  static const Color primary = Color(0xFF0F5132); // Deep forest green
  static const Color primaryDark = Color(0xFF0A3D26); // Darker green
  static const Color primaryLight = Color(0xFF1A7A4A); // Lighter green

  // Secondary - Teal/Cyan (complements dark green, modern)
  static const Color secondary = Color(0xFF0D9488); // Teal
  static const Color secondaryDark = Color(0xFF0F766E); // Darker teal
  static const Color secondaryLight = Color(0xFF14B8A6); // Lighter teal

  // Background - Light Gray
  static const Color background = Color(0xFFF5F5F5); // Light gray
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceVariant = Color(0xFFFAFAFA); // Off-white

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A); // Near black
  static const Color textSecondary = Color(0xFF6B7280); // Medium gray
  static const Color textTertiary = Color(0xFF9CA3AF); // Light gray

  // Accent Colors
  static const Color accent = Color(0xFF2563EB); // Blue accent
  static const Color success = Color(0xFF10B981); // Green
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color error = Color(0xFFEF4444); // Red

  // Borders & Dividers
  static const Color divider = Color(0xFFE5E7EB); // Light gray border
  static const Color border = Color(0xFFD1D5DB); // Medium gray border

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );

  // Shadows (soft, subtle)
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get mediumShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 15,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get largeShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ];
}
