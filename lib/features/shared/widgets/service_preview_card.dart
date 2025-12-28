import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/data/models/service.dart';

/// Reusable service preview card for home page
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
        boxShadow: AppColors.softShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingLG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (service.icon != null)
                  Icon(
                    _getIconData(service.icon!),
                    size: AppDimensions.iconXL,
                    color: AppColors.primary,
                  ),
                const SizedBox(height: AppDimensions.spacingMD),
                Text(
                  service.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppDimensions.spacingSM),
                Text(
                  service.shortDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    // Map string icon names to Material Icons
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

