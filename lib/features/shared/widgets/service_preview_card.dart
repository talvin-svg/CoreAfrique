import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/data/models/service.dart';

/// Reusable service preview card - Compact and visually interesting
class ServicePreviewCard extends StatelessWidget {
  final Service service;
  final VoidCallback? onTap;

  const ServicePreviewCard({
    super.key,
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingLG),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingMD),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLight.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  ),
                  child: Icon(
                    _getIconData(service.icon),
                    size: AppDimensions.iconLG,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMD),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        service.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppDimensions.spacingXS),
                      Text(
                        service.shortDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppDimensions.spacingSM),
                          Row(
                            children: [
                              Text(
                                'Learn more',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(width: AppDimensions.spacingXS),
                              Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String? iconName) {
    if (iconName == null) return Icons.business;
    final iconMap = {
      'business': Icons.business,
      'account_balance': Icons.account_balance,
      'trending_up': Icons.trending_up,
      'show_chart': Icons.show_chart,
      'search': Icons.search,
      'description': Icons.description,
      'handshake': Icons.handshake,
      'calculate': Icons.calculate,
      'assessment': Icons.assessment,
      'account_balance_wallet': Icons.account_balance_wallet,
      'pie_chart': Icons.pie_chart,
      'assignment': Icons.assignment,
      'lightbulb': Icons.lightbulb,
      'analytics': Icons.analytics,
      'public': Icons.public,
    };
    return iconMap[iconName] ?? Icons.business;
  }
}
