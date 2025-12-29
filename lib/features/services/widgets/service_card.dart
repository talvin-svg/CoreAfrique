import 'package:flutter/material.dart';
import 'package:coreafrique/core/data/models/service.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';

/// Service card widget with expandable read more functionality
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
  bool _isExpanded = false;

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
    final hasLongDescription = widget.service.longDescription != null &&
        widget.service.longDescription!.isNotEmpty;
    final showReadMore = hasLongDescription && !_isExpanded;

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
                boxShadow: widget.isHovered
                    ? AppColors.mediumShadow
                    : AppColors.softShadow,
                border: Border.all(
                  color: widget.isHovered
                      ? AppColors.primary
                      : AppColors.primaryLight.withOpacity(0.2),
                  width: widget.isHovered ? 2 : 1,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (hasLongDescription) {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    }
                  },
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingLG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppDimensions.paddingMD),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryLight.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                              ),
                              child: Icon(
                                _getIconData(widget.service.icon),
                                size: AppDimensions.iconLG,
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spacingMD),
                            Expanded(
                              child: Text(
                                widget.service.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.spacingSM),
                        Text(
                          _isExpanded && widget.service.longDescription != null
                              ? widget.service.longDescription!
                              : widget.service.shortDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                          maxLines: _isExpanded ? null : 2,
                          overflow: _isExpanded ? null : TextOverflow.ellipsis,
                        ),
                        if (showReadMore) ...[
                          const SizedBox(height: AppDimensions.spacingXS),
                          Row(
                            children: [
                              Text(
                                'Read more',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(width: AppDimensions.spacingXS),
                              Icon(
                                Icons.arrow_downward,
                                size: 14,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                        ],
                        if (_isExpanded && hasLongDescription) ...[
                          const SizedBox(height: AppDimensions.spacingXS),
                          Row(
                            children: [
                              Text(
                                'Read less',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(width: AppDimensions.spacingXS),
                              Icon(
                                Icons.arrow_upward,
                                size: 14,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: AppDimensions.spacingSM),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                widget.service.category.split(' ').first,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: AppColors.secondary,
                            ),
                          ],
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
