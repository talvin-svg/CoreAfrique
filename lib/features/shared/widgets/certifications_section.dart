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
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Certifications & Credentials',
            subtitle: 'Recognized expertise and professional qualifications',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          context.isNarrow
              ? _buildNarrowLayout(context, certifications)
              : _buildWideLayout(context, certifications),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, List<Map<String, String>> certs) {
    return Column(
      children: certs.map((cert) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
            child: _buildCertCard(context, cert),
          )).toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context, List<Map<String, String>> certs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: certs.map((cert) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingSM),
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
        boxShadow: AppColors.softShadow,
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingXL),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified,
              size: 40,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMD),
          Text(
            cert['title']!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingXS),
          Text(
            cert['description']!,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

