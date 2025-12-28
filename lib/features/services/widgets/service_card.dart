import 'package:flutter/material.dart';
import 'package:coreafrique/core/data/models/service.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';

/// Service card widget with hover effects
class ServiceCard extends StatefulWidget {
  final Service service;
  final bool isHovered;
  final VoidCallback? onHoverChanged;

  const ServiceCard({
    super.key,
    required this.service,
    this.isHovered = false,
    this.onHoverChanged,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(ServiceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHovered != oldWidget.isHovered) {
      if (widget.isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.onHoverChanged?.call(),
      onExit: (_) => widget.onHoverChanged?.call(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                boxShadow: _elevationAnimation.value > 0.5
                    ? AppColors.mediumShadow
                    : AppColors.softShadow,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // TODO: Show service details
                  },
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingLG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppDimensions.paddingMD),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                          ),
                          child: Icon(
                            _getIconData(widget.service.icon),
                            size: AppDimensions.iconXL,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacingMD),
                        Text(
                          widget.service.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: AppDimensions.spacingSM),
                        Text(
                          widget.service.shortDescription,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppDimensions.spacingMD),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingSM,
                            vertical: AppDimensions.paddingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                          ),
                          child: Text(
                            widget.service.category,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 11,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

