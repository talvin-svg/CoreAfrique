import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/core/data/company_info.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/constants/app_colors.dart';
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
        color: AppColors.surfaceVariant,
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
          flex: 2,
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
              const SizedBox(height: AppDimensions.spacingMD),
              Text(
                'Your Total Investment & Financial Advisory Solutions Provider',
                style: Theme.of(context).textTheme.bodySmall,
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppDimensions.spacingMD),
              _buildFooterLink(context, 'Home', AppRoutes.home),
              _buildFooterLink(context, 'About Us', AppRoutes.about),
              _buildFooterLink(context, 'Investment Advisory', AppRoutes.investmentAdvisory),
              _buildFooterLink(context, 'Blockchain Education', AppRoutes.blockchainEducation),
            ],
          ),
        ),
        Expanded(
          child: _buildContactInfo(context),
        ),
      ],
    );
  }

  Widget _buildFooterLink(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingXS),
      child: InkWell(
        onTap: () => context.go(route),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppDimensions.spacingMD),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppDimensions.spacingXS),
            Expanded(
              child: Text(
                companyInfo.contactInfo['address']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingSM),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppDimensions.spacingXS),
            Text(
              companyInfo.contactInfo['phone']!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingSM),
        Row(
          children: [
            Icon(
              Icons.email,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppDimensions.spacingXS),
            Expanded(
              child: Text(
                companyInfo.contactInfo['email']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

