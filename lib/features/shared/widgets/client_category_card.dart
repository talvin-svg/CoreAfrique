import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';

/// Reusable client category card widget
class ClientCategoryCard extends StatelessWidget {
  final String category;
  final List<String> examples;

  const ClientCategoryCard({
    super.key,
    required this.category,
    required this.examples,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppDimensions.spacingMD),
            ...examples.map((example) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.spacingXS,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: AppDimensions.iconSM,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: AppDimensions.spacingSM),
                      Expanded(
                        child: Text(
                          example,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

