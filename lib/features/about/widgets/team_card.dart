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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Our Team',
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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMedium ? 2 : 3,
        crossAxisSpacing: AppDimensions.spacingMD,
        mainAxisSpacing: AppDimensions.spacingMD,
        childAspectRatio: 0.75,
      ),
      itemCount: members.length,
      itemBuilder: (context, index) => _buildMemberCard(context, members[index]),
    );
  }

  Widget _buildMemberCard(BuildContext context, TeamMember member) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: AppColors.softShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLG),
        child: Column(
          children: [
            // Profile image placeholder
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight,
                border: Border.all(
                  color: AppColors.primary,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.person,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMD),
            Text(
              member.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXS),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMD,
                vertical: AppDimensions.paddingXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
              ),
              child: Text(
                member.role,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMD),
            Expanded(
              child: Text(
                member.bio,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (member.qualifications.isNotEmpty) ...[
              const SizedBox(height: AppDimensions.spacingSM),
              Wrap(
                spacing: AppDimensions.spacingXS,
                runSpacing: AppDimensions.spacingXS,
                children: member.qualifications.take(2).map((qual) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSM,
                        vertical: AppDimensions.paddingXS,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                      ),
                      child: Text(
                        qual,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

