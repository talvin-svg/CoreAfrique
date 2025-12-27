/// App-wide dimensions and responsive sizes
class AppDimensions {
  AppDimensions._(); // Private constructor to prevent instantiation

  // Padding & Margins
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // Border radius
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Icon sizes
  static const double iconSM = 16.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;

  // Breakpoints (for responsive web design)
  static const double narrowBreakpoint = 600.0;  // Small browser window
  static const double mediumBreakpoint = 900.0;   // Medium browser window
  static const double wideBreakpoint = 1200.0;    // Large browser window
  
  // Legacy names for compatibility
  static const double mobileBreakpoint = narrowBreakpoint;
  static const double tabletBreakpoint = mediumBreakpoint;
  static const double desktopBreakpoint = wideBreakpoint;

  // Max content width
  static const double maxContentWidth = 1200.0;
}

