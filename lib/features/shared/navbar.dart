import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/routing/app_router.dart';

/// Responsive navigation bar
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingLG,
        vertical: AppDimensions.paddingMD,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppColors.softShadow,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
        child: context.isNarrow ? _buildNarrowNav(context) : _buildWideNav(context),
      ),
    );
  }

  Widget _buildNarrowNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          companyInfo.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        // Show navigation items in a row for narrow screens
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem(context, 'Home', AppRoutes.home),
            const SizedBox(width: AppDimensions.spacingSM),
            _buildNavItem(context, 'About', AppRoutes.about),
            const SizedBox(width: AppDimensions.spacingSM),
            _buildNavItem(context, 'Services', AppRoutes.services),
          ],
        ),
      ],
    );
  }

  Widget _buildWideNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          companyInfo.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            _buildNavItem(context, 'Home', AppRoutes.home),
            const SizedBox(width: AppDimensions.spacingMD),
            _buildNavItem(context, 'About', AppRoutes.about),
            const SizedBox(width: AppDimensions.spacingMD),
            _buildNavItem(context, 'Services', AppRoutes.services),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String label, String route) {
    final isActive = GoRouterState.of(context).uri.path == route;
    return TextButton(
      onPressed: () => context.go(route),
      style: TextButton.styleFrom(
        foregroundColor: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface,
      ),
      child: Text(label),
    );
  }
}

