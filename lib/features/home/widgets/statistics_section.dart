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
            title: 'Our Impact',
            subtitle: 'Numbers that speak for themselves',
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
          value: '${teamData.length}',
          label: 'Team Members',
          icon: Icons.people,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        StatCard(
          value: '${servicesData.length}',
          label: 'Services Offered',
          icon: Icons.business_center,
        ),
        const SizedBox(height: AppDimensions.spacingLG),
        StatCard(
          value: '15+',
          label: 'Years Experience',
          icon: Icons.calendar_today,
        ),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            value: '${teamData.length}',
            label: 'Team Members',
            icon: Icons.people,
          ),
        ),
        const SizedBox(width: AppDimensions.spacingLG),
        Expanded(
          child: StatCard(
            value: '${servicesData.length}',
            label: 'Services Offered',
            icon: Icons.business_center,
          ),
        ),
        const SizedBox(width: AppDimensions.spacingLG),
        Expanded(
          child: StatCard(
            value: '15+',
            label: 'Years Experience',
            icon: Icons.calendar_today,
          ),
        ),
      ],
    );
  }
}
