import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/data/services_data.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/home/widgets/outlined_buttons.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/features/shared/widgets/service_preview_card.dart';
import 'package:coreafrique/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Services preview section for home page
class ServicesPreviewSection extends StatelessWidget {
  const ServicesPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Get featured services (first 6 services)
    final featuredServices = servicesData.take(6).toList();

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Our Services',
            subtitle: 'Comprehensive financial and business advisory solutions',
          ),
          const SizedBox(height: AppDimensions.spacingXL),
          context.isNarrow
              ? _buildNarrowLayout(context, featuredServices)
              : _buildWideLayout(context, featuredServices),
          const SizedBox(height: AppDimensions.spacingXL),
          Center(
            child: OutlinedButton(
              onPressed: () => context.go(AppRoutes.services),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXL,
                  vertical: AppDimensions.paddingMD,
                ),
              ),
              child: const Text('View All Services'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, List featuredServices) {
    return Column(
      children:
          featuredServices
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.spacingMD,
                  ),
                  child: ServicePreviewCard(
                    service: service,
                    onTap: () => context.go(AppRoutes.services),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context, List featuredServices) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMedium ? 2 : 3,
        crossAxisSpacing: AppDimensions.spacingMD,
        mainAxisSpacing: AppDimensions.spacingMD,
        childAspectRatio: 2.5,
      ),
      itemCount: featuredServices.length,
      itemBuilder:
          (context, index) => ServicePreviewCard(
            service: featuredServices[index],
            onTap: () => context.go(AppRoutes.services),
          ),
    );
  }
}
