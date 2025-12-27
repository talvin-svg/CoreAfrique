import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/routing/app_router.dart';

/// Hero section widget for the landing page
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          Text(
            companyInfo.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingMD),
          Text(
            companyInfo.tagline,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          Text(
            companyInfo.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.services),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingXL,
                    vertical: AppDimensions.paddingMD,
                  ),
                ),
                child: const Text('Our Services'),
              ),
              const SizedBox(width: AppDimensions.spacingMD),
              OutlinedButton(
                onPressed: () => context.go(AppRoutes.about),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingXL,
                    vertical: AppDimensions.paddingMD,
                  ),
                ),
                child: const Text('Learn More'),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }
}

