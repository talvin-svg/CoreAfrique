import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

/// Reusable section title widget
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign? textAlign;
  final CrossAxisAlignment? crossAxisAlignment;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: textAlign,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppDimensions.spacingSM),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}
