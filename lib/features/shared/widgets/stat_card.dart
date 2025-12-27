import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: AppDimensions.iconXL,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: AppDimensions.spacingMD),
            ],
            Text(
              value,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
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
}

