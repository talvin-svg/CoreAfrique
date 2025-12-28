import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/features/shared/widgets/animated_counter.dart';

/// Reusable statistics card widget
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData? icon;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.softShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: AppDimensions.iconXL,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppDimensions.spacingMD),
            ],
            _isNumeric(value)
                ? AnimatedCounter(
                    targetValue: _extractNumber(value),
                    suffix: _extractSuffix(value),
                    textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                  )
                : Text(
                    value,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                  ),
            const SizedBox(height: AppDimensions.spacingXS),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  bool _isNumeric(String str) {
    // Remove suffix like '+' if present
    final cleaned = str.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleaned) != null;
  }

  int _extractNumber(String str) {
    final cleaned = str.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleaned) ?? 0;
  }

  String? _extractSuffix(String str) {
    final match = RegExp(r'[^0-9]+$').firstMatch(str);
    return match?.group(0);
  }
}

