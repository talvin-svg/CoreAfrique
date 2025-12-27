import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';

/// Extension methods for responsive design
extension ResponsiveExtensions on BuildContext {
  /// Get screen width
  double get width => MediaQuery.of(this).size.width;

  /// Get screen height
  double get height => MediaQuery.of(this).size.height;

  /// Check if screen is narrow (small browser window)
  bool get isNarrow => width < AppDimensions.mobileBreakpoint;

  /// Check if screen is medium (medium browser window)
  bool get isMedium =>
      width >= AppDimensions.mobileBreakpoint &&
      width < AppDimensions.desktopBreakpoint;

  /// Check if screen is wide (large browser window)
  bool get isWide => width >= AppDimensions.desktopBreakpoint;

  /// Get responsive width (percentage of screen width)
  double responsiveWidth(double percentage) => width * (percentage / 100);

  /// Get responsive height (percentage of screen height)
  double responsiveHeight(double percentage) => height * (percentage / 100);

  /// Get responsive padding based on screen size
  EdgeInsets get responsivePadding {
    if (isNarrow) {
      return const EdgeInsets.all(AppDimensions.paddingMD);
    } else if (isMedium) {
      return const EdgeInsets.all(AppDimensions.paddingLG);
    } else {
      return const EdgeInsets.all(AppDimensions.paddingXL);
    }
  }
}

