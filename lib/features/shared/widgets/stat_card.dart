import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/features/shared/widgets/animated_counter.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Reusable statistics card widget - Compact and visually interesting
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData? icon;

  StatCard({super.key, required this.value, required this.label, this.icon});

  final GlobalKey<AnimatedCounterState> _counterKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 140),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.mediumShadow,
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLG),
        child: VisibilityDetector(
          key: Key('counter-detector-$value'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.5) {
              _counterKey.currentState?.startAnimation();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingMD),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLight.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  ),
                  child: Icon(
                    icon,
                    size: AppDimensions.iconLG,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMD),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isNumeric(value)
                        ? AnimatedCounter(
                          key: _counterKey,
                          targetValue: _extractNumber(value),
                          suffix: _extractSuffix(value),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                        )
                        : Text(
                          value,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    const SizedBox(height: AppDimensions.spacingXS),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isNumeric(String str) {
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
