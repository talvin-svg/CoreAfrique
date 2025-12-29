import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/image_urls.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Hero section widget for the landing page - Side by side layout
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.background,
      child: Container(
        constraints: BoxConstraints(
          minHeight: context.isNarrow ? 500 : 650,
        ),
        child: context.isNarrow
            ? _buildNarrowLayout(context)
            : _buildWideLayout(context),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        // Text content
        Container(
          padding: context.responsivePadding,
          child: _buildTextContent(context),
        ),
        // Image
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ImageUrls.heroFinance),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Padding(
      padding: context.responsivePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text content - Left side
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: AppDimensions.spacingXL),
              child: _buildTextContent(context),
            ),
          ),
          // Image - Right side
          Expanded(
            flex: 1,
            child: Container(
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                boxShadow: AppColors.largeShadow,
                image: DecorationImage(
                  image: NetworkImage(ImageUrls.heroFinance),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Pushing forward the frontiers of',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
                fontSize: 28,
              ),
        ),
        const SizedBox(height: AppDimensions.spacingMD),
        Text(
          'Private Equity in Africa',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
                fontSize: 48,
                height: 1.1,
              ),
        ),
        const SizedBox(height: AppDimensions.spacingXL),
        Text(
          companyInfo.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.7,
                fontSize: 16,
              ),
        ),
        const SizedBox(height: AppDimensions.spacingXXL),
        Wrap(
          spacing: AppDimensions.spacingMD,
          runSpacing: AppDimensions.spacingMD,
          children: [
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.services),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXL * 1.5,
                  vertical: AppDimensions.paddingLG,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMD,
                  ),
                ),
                elevation: 4,
              ),
              child: const Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => context.go(AppRoutes.about),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXL * 1.5,
                  vertical: AppDimensions.paddingLG,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMD,
                  ),
                ),
              ),
              child: const Text(
                'Learn More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
