import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

/// Mission section widget
class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'About Us',
            subtitle:
                'Leading investment and financial advisory services in Africa',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
          _buildSection(
            context: context,
            title: 'Our Mission',
            content: companyInfo.mission,
            icon: Icons.flag,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildSection(
            context: context,
            title: 'Our Vision',
            content: companyInfo.vision,
            icon: Icons.visibility,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildSection(
            context: context,
            title: 'Our Values',
            content: companyInfo.keyDifferentiators.join('\n\n'),
            icon: Icons.favorite,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.mediumShadow,
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingXL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Icon(
              icon,
              size: AppDimensions.iconXL,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingLG),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingMD),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
