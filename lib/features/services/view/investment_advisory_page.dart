import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/data/services_data.dart';
import 'package:coreafrique/features/shared/navbar.dart';
import 'package:coreafrique/features/shared/footer.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/features/services/widgets/service_card.dart';

/// Investment & Strategic Advisory Services Page
class InvestmentAdvisoryPage extends StatelessWidget {
  const InvestmentAdvisoryPage({super.key});

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
      backgroundColor: AppColors.primaryLight.withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXL),
          const SectionTitle(
            title: 'Investment & Strategic Advisory',
            subtitle: 'Bespoke advisory services for Africa\'s digital economy',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          Text(
            'CAI provides hands-on, research-driven advisory services to startups, SMEs, investors, and institutions operating in or entering Africa\'s digital economy.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
            textAlign: TextAlign.center,
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
            title: 'Our Services',
            subtitle: 'Comprehensive advisory services for digital economy success',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          ...investmentAdvisoryServices.map((service) => Padding(
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
            title: 'Key Service Areas',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildServiceDetail(
            context,
            title: 'Investment Readiness & Capital Structuring',
            items: [
              'Business model refinement',
              'Pitch deck development',
              'Financial modeling',
              'Equity, debt, and hybrid structuring',
              'Investor engagement strategy',
            ],
            icon: Icons.account_balance,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildServiceDetail(
            context,
            title: 'Blockchain & Digital Asset Advisory',
            items: [
              'Blockchain use-case assessment',
              'Tokenization and digital asset strategy',
              'Web3 business models',
              'Risk, governance, and compliance considerations',
            ],
            icon: Icons.currency_bitcoin,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          _buildServiceDetail(
            context,
            title: 'Market Entry & Growth Strategy',
            items: [
              'Ghana and Africa-focused market intelligence',
              'Regulatory landscape analysis',
              'Go-to-market strategy',
              'Strategic partnerships',
            ],
            icon: Icons.trending_up,
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildServiceDetail(
    BuildContext context, {
    required String title,
    required List<String> items,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.softShadow,
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingXL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Icon(
              icon,
              size: AppDimensions.iconXL,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: AppDimensions.spacingLG),
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
                const SizedBox(height: AppDimensions.spacingMD),
                ...items.map((item) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimensions.spacingSM,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 20,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

