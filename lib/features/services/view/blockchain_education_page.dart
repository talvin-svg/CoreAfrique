import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/data/services_data.dart';
import 'package:coreafrique/features/shared/navbar.dart';
import 'package:coreafrique/features/shared/footer.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/features/services/widgets/service_card.dart';

/// Blockchain Education & Advocacy Services Page (VASP-Aligned)
class BlockchainEducationPage extends StatelessWidget {
  const BlockchainEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Navbar()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildHeroSection(context),
                _buildServicesSection(context),
                _buildDetailsSection(context),
                _buildComplianceSection(context),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.secondaryLight.withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXL),
          const SectionTitle(
            title: 'Blockchain Education & Advocacy',
            subtitle: 'NaVALI-Aligned Education & Public Awareness',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          Text(
            'Under Ghana\'s Virtual Asset Service Provider (VASP) framework, CAI operates within the Advocacy category, focusing on education, literacy, and public awareness rather than custodial or transactional services.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.spacingMD),
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Text(
              'Supporting Ghana\'s National Virtual Assets Literacy Initiative (NaVALI)',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXL),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXL),
          const SectionTitle(
            title: 'Our Education Programs',
            subtitle: 'Structured learning and advocacy for responsible adoption',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          ...blockchainEducationServices.map((service) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
                child: ServiceCard(service: service),
              )),
          const SizedBox(height: AppDimensions.spacingXL),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          const SectionTitle(
            title: 'Course & Program Details',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildProgramDetail(
            context,
            title: 'Blockchain & Digital Assets Courses',
            subtitle: 'Structured courses tailored for diverse audiences',
            items: [
              'Beginners and general public',
              'Professionals and executives',
              'Entrepreneurs and startups',
              'Students and institutions',
            ],
            topics: [
              'Blockchain fundamentals',
              'Digital assets & tokenization',
              'Web3, DeFi & real-world use cases',
              'Risks, scams, and consumer protection',
              'Ghana\'s VASP framework and compliance basics',
            ],
            icon: Icons.school,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildProgramDetail(
            context,
            title: 'Corporate & Institutional Training',
            subtitle: 'Customized workshops for organizations',
            items: [
              'Financial institutions',
              'Corporates',
              'Government agencies',
              'NGOs and development organizations',
            ],
            topics: [
              'Blockchain for business',
              'Digital assets policy awareness',
              'Emerging tech strategy',
              'Regulatory alignment',
            ],
            icon: Icons.business_center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildProgramDetail(
            context,
            title: 'Public Advocacy & Ecosystem Engagement',
            subtitle: 'Building informed communities',
            items: [
              'Public seminars and webinars',
              'Community education programs',
              'Policy-aligned thought leadership',
              'Collaboration with regulators and ecosystem partners',
            ],
            topics: [
              'Monthly "Blockchain Literacy Series – Ghana Edition"',
              'Regular policy-aligned content',
              'VASP framework whitepapers',
              'Ecosystem development initiatives',
            ],
            icon: Icons.campaign,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildProgramDetail(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<String> items,
    required List<String> topics,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.softShadow,
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimensions.paddingMD),
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                ),
                child: Icon(
                  icon,
                  size: AppDimensions.iconXL,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLG),
          Text(
            'Target Audiences:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: AppDimensions.spacingSM),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDimensions.spacingXS,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 18,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: AppDimensions.spacingSM),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: AppDimensions.spacingMD),
          Text(
            'Topics Covered:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: AppDimensions.spacingSM),
          ...topics.map((topic) => Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDimensions.spacingXS,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 18,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: AppDimensions.spacingSM),
                    Expanded(
                      child: Text(
                        topic,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildComplianceSection(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.warning.withOpacity(0.05),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXL),
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingXL),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              border: Border.all(color: AppColors.warning.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.verified_user,
                  size: 48,
                  color: AppColors.warning,
                ),
                const SizedBox(height: AppDimensions.spacingMD),
                Text(
                  'Regulatory Disclosure',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.spacingMD),
                Text(
                  'Core Afrique Investment Ltd provides education, advocacy, and advisory services only. CAI does not offer custodial, trading, brokerage, or investment solicitation services related to virtual assets.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXL),
        ],
      ),
    );
  }
}

