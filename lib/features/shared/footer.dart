import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/routing/app_router.dart';

/// Footer widget
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.responsivePadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.isNarrow
                ? _buildNarrowLayout(context)
                : _buildWideLayout(context),
            const Divider(),
            const SizedBox(height: AppDimensions.spacingMD),
            Center(
              child: Text(
                '© 2024 ${companyInfo.name}. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          companyInfo.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppDimensions.spacingMD),
        Text(
          companyInfo.tagline,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppDimensions.spacingMD),
        _buildContactInfo(context),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyInfo.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppDimensions.spacingSM),
              Text(
                companyInfo.tagline,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Links',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppDimensions.spacingSM),
              TextButton(
                onPressed: () => context.go(AppRoutes.home),
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () => context.go(AppRoutes.about),
                child: const Text('About'),
              ),
              TextButton(
                onPressed: () => context.go(AppRoutes.services),
                child: const Text('Services'),
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildContactInfo(context),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppDimensions.spacingSM),
        Text(
          companyInfo.contactInfo['address']!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: AppDimensions.spacingXS),
        Text(
          companyInfo.contactInfo['phone']!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: AppDimensions.spacingXS),
        Text(
          companyInfo.contactInfo['email']!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

