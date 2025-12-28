import 'package:flutter/material.dart';

/// Utility class for scroll-triggered animations
class ScrollAnimations {
  /// Creates a fade-in animation that triggers when widget enters viewport
  static Widget fadeInOnScroll({
    required Widget child,
    Duration duration = const Duration(milliseconds: 600),
    Curve curve = Curves.easeOut,
    double offset = 20.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, offset * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Creates a stagger animation for list items
  static Widget staggerFadeIn({
    required Widget child,
    required int index,
    Duration baseDuration = const Duration(milliseconds: 400),
    Duration staggerDelay = const Duration(milliseconds: 100),
    Curve curve = Curves.easeOut,
    double offset = 20.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: baseDuration + (staggerDelay * index),
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, offset * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

