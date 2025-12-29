import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';

/// Certifications and credentials section
class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final certifications = [
      {'title': 'CFA Institute', 'description': 'Chartered Financial Analyst'},
      {'title': 'Ghana Investment', 'description': 'Licensed Investment Advisor'},
      {'title': 'ISO Certified', 'description': 'Quality Management'},
    ];

    return SectionContainer(
      backgroundColor: AppColors.primaryLight.withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          const SectionTitle(
            title: 'Certifications & Credentials',
            subtitle: 'Recognized expertise and professional qualifications',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
          context.isNarrow
              ? _buildNarrowLayout(context, certifications)
              : _buildWideLayout(context, certifications),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, List<Map<String, String>> certs) {
    return Column(
      children: certs.map((cert) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacingLG),
            child: _buildCertCard(context, cert),
          )).toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context, List<Map<String, String>> certs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: certs.map((cert) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMD),
              child: _buildCertCard(context, cert),
            ),
          )).toList(),
    );
  }

  Widget _buildCertCard(BuildContext context, Map<String, String> cert) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.mediumShadow,
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingLG),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.secondaryLight.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Icon(
              Icons.verified,
              size: AppDimensions.iconLG,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cert['title']!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppDimensions.spacingXS),
                Text(
                  cert['description']!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
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
