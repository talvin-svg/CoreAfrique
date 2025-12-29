import 'package:flutter/material.dart';
import 'package:coreafrique/core/data/models/team_member.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';

/// Team card widget for displaying team members
class TeamCard extends StatelessWidget {
  final List<TeamMember> teamMembers;

  const TeamCard({
    super.key,
    required this.teamMembers,
  });

  @override
  Widget build(BuildContext context) {
    // Filter to show only partners and key team members (not placeholders)
    final keyMembers = teamMembers.where((member) => 
      member.role == 'Partner' || 
      (member.name != 'Financial Analyst 1' && 
       member.name != 'Financial Analyst 2' &&
       member.name != 'Associate Consultant 1' &&
       member.name != 'Associate Consultant 2' &&
       member.name != 'Associate Consultant 3' &&
       member.name != 'Associate Consultant 4' &&
       member.name != 'Associate Consultant 5' &&
       member.name != 'Administration Staff 1' &&
       member.name != 'Administration Staff 2')
    ).toList();

    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Our Partners',
            subtitle: 'Experienced professionals dedicated to your success',
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          context.isNarrow
              ? _buildNarrowLayout(context, keyMembers)
              : _buildWideLayout(context, keyMembers),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, List<TeamMember> members) {
    return Column(
      children: members.map((member) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
            child: _buildMemberCard(context, member),
          )).toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context, List<TeamMember> members) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1000 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppDimensions.spacingLG,
            mainAxisSpacing: AppDimensions.spacingLG,
            childAspectRatio: crossAxisCount == 1 ? 2.5 : 1.2,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) => _buildMemberCard(context, members[index]),
        );
      },
    );
  }

  Widget _buildMemberCard(BuildContext context, TeamMember member) {
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
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingXL),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile image placeholder
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                border: Border.all(
                  color: AppColors.primaryDark,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingLG),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppDimensions.spacingXS),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMD,
                      vertical: AppDimensions.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                    ),
                    child: Text(
                      member.role,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMD),
                  Text(
                    member.bio,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (member.qualifications.isNotEmpty) ...[
                    const SizedBox(height: AppDimensions.spacingMD),
                    Wrap(
                      spacing: AppDimensions.spacingXS,
                      runSpacing: AppDimensions.spacingXS,
                      children: member.qualifications.take(3).map((qual) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.paddingSM,
                              vertical: AppDimensions.paddingXS,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryLight.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                            ),
                            child: Text(
                              qual,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10,
                                    color: AppColors.secondary,
                                  ),
                            ),
                          )).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
