import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Services preview section for home page - Two Core Business Lines
class ServicesPreviewSection extends StatelessWidget {
  const ServicesPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          const SectionTitle(
            title: 'Our Two Core Business Lines',
            subtitle: 'Specialized services for Africa\'s digital economy',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
          context.isNarrow
              ? _buildNarrowLayout(context)
              : _buildWideLayout(context),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildServiceCard(
          context,
          title: 'Investment & Strategic Advisory',
          description: 'We support startups, SMEs, and institutions with investment readiness, digital economy strategy, Blockchain advisory, and market entry guidance.',
          features: [
            'Investment readiness and capital structuring',
            'Digital economy strategy',
            'Blockchain and fintech advisory',
            'Market entry and growth strategy',
          ],
          icon: Icons.account_balance,
          color: AppColors.primary,
          route: AppRoutes.investmentAdvisory,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        _buildServiceCard(
          context,
          title: 'Blockchain Education & Advocacy',
          description: 'As part of Ghana\'s National Virtual Assets Literacy Initiative (NaVALI) ecosystem, CAI delivers education, training, and advocacy programs.',
          features: [
            'Blockchain and digital asset education',
            'Public and private sector training',
            'Policy-aligned advocacy and literacy programs',
            'VASP compliance education',
          ],
          icon: Icons.school,
          color: AppColors.secondary,
          route: AppRoutes.blockchainEducation,
        ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildServiceCard(
            context,
            title: 'Investment & Strategic Advisory',
            description: 'We support startups, SMEs, and institutions with investment readiness, digital economy strategy, Blockchain advisory, and market entry guidance.',
            features: [
              'Investment readiness and capital structuring',
              'Digital economy strategy',
              'Blockchain and fintech advisory',
              'Market entry and growth strategy',
            ],
            icon: Icons.account_balance,
            color: AppColors.primary,
            route: AppRoutes.investmentAdvisory,
          ),
        ),
        const SizedBox(width: AppDimensions.spacingLG),
        Expanded(
          child: _buildServiceCard(
            context,
            title: 'Blockchain Education & Advocacy',
            description: 'As part of Ghana\'s National Virtual Assets Literacy Initiative (NaVALI) ecosystem, CAI delivers education, training, and advocacy programs.',
            features: [
              'Blockchain and digital asset education',
              'Public and private sector training',
              'Policy-aligned advocacy and literacy programs',
              'VASP compliance education',
            ],
            icon: Icons.school,
            color: AppColors.secondary,
            route: AppRoutes.blockchainEducation,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String description,
    required List<String> features,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          boxShadow: AppColors.mediumShadow,
          border: Border.all(color: color.withOpacity(0.2), width: 2),
        ),
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingMD),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              ),
              child: Icon(
                icon,
                size: AppDimensions.iconXL,
                color: color,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLG),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            const SizedBox(height: AppDimensions.spacingMD),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
            ),
            const SizedBox(height: AppDimensions.spacingLG),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.spacingSM,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: color,
                      ),
                      const SizedBox(width: AppDimensions.spacingSM),
                      Expanded(
                        child: Text(
                          feature,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: AppDimensions.spacingLG),
            ElevatedButton(
              onPressed: () => context.go(route),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}
