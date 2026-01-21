import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/routing/app_router.dart';

/// Call to action section for home page
class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.primaryLight.withOpacity(0.2),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              boxShadow: AppColors.mediumShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingXXL),
              child: Column(
                children: [
                  Text(
                    'Building Africa\'s Digital Asset Future—Responsibly',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacingLG),
                  Text(
                    'Whether you are seeking strategic advisory, investment insight, or Blockchain education aligned with Ghana\'s regulatory framework, CAI is your trusted partner.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacingXXL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Open contact form or email
                          // For now, just show contact info
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingXL,
                            vertical: AppDimensions.paddingMD,
                          ),
                        ),
                        child: const Text('Contact Us'),
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
                  const SizedBox(height: AppDimensions.spacingLG),
                  Text(
                    'Email: ${companyInfo.contactInfo['email']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppDimensions.spacingXS),
                  Text(
                    'Phone: ${companyInfo.contactInfo['phone']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }
}
