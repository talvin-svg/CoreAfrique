import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/data/models/timeline_event.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

/// Timeline widget for displaying company history
class TimelineWidget extends StatelessWidget {
  final List<TimelineEvent> events;

  const TimelineWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Our Journey',
            subtitle: 'Key milestones in our company history',
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          ...events.asMap().entries.map((entry) {
            final index = entry.key;
            final event = entry.value;
            return _buildTimelineItem(
              context,
              event,
              index == events.length - 1,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    TimelineEvent event,
    bool isLast,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight,
                border: Border.all(color: AppColors.surface, width: 3),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 120,
                color: AppColors.primaryLight.withOpacity(0.4),
              ),
          ],
        ),
        const SizedBox(width: AppDimensions.spacingLG),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacingXL),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                boxShadow: AppColors.softShadow,
              ),
              padding: const EdgeInsets.all(AppDimensions.paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingMD,
                          vertical: AppDimensions.paddingXS,
                        ),
                        decoration: BoxDecoration(
                          color: (event.year >= 2010 && event.year <= 2020)
                              ? AppColors.primary
                              : AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusSM,
                          ),
                        ),
                        child: Text(
                          '${event.year}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: (event.year >= 2010 && event.year <= 2020)
                                ? Colors.white
                                : AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingMD),
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingSM),
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
