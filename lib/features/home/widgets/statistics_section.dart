import 'package:flutter/material.dart';
import 'package:coreafrique/core/data/team_data.dart';
import 'package:coreafrique/core/data/services_data.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/features/shared/widgets/stat_card.dart';

/// Statistics section for home page
class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.secondaryLight.withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          const SectionTitle(
            title: 'Why CAI',
            subtitle: 'Trusted partner for Africa\'s digital economy',
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
        StatCard(
          value: 'Regulatory-Aware',
          label: 'Built around Ghana\'s VASP framework',
          icon: Icons.verified_user,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        StatCard(
          value: '8+',
          label: 'Years of Blockchain Experience',
          icon: Icons.currency_bitcoin,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        StatCard(
          value: 'NaVALI',
          label: 'Knowledge Partner',
          icon: Icons.school,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        StatCard(
          value: 'Local + Global',
          label: 'African markets, international standards',
          icon: Icons.public,
        ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Wrap(
      spacing: AppDimensions.spacingLG,
      runSpacing: AppDimensions.spacingLG,
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          width: context.isMedium ? 250 : 280,
          child: StatCard(
            value: 'Regulatory-Aware',
            label: 'Built around Ghana\'s VASP framework',
            icon: Icons.verified_user,
          ),
        ),
        SizedBox(
          width: context.isMedium ? 250 : 280,
          child: StatCard(
            value: '8+',
            label: 'Years of Blockchain Experience',
            icon: Icons.currency_bitcoin,
          ),
        ),
        SizedBox(
          width: context.isMedium ? 250 : 280,
          child: StatCard(
            value: 'NaVALI',
            label: 'Knowledge Partner',
            icon: Icons.school,
          ),
        ),
        SizedBox(
          width: context.isMedium ? 250 : 280,
          child: StatCard(
            value: 'Local + Global',
            label: 'African markets, international standards',
            icon: Icons.public,
          ),
        ),
      ],
    );
  }
}
