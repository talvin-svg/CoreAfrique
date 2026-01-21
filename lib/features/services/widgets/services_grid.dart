import 'package:coreafrique/core/constants/app_colors.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/services/view_model/services_view_model.dart';
import 'package:coreafrique/features/services/widgets/service_card.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Services grid widget
class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServicesViewModel(),
      child: Consumer<ServicesViewModel>(
        builder: (context, viewModel, child) {
          return SectionContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionTitle(
                  title: 'Our Services',
                  subtitle:
                      'Comprehensive financial and business advisory solutions',
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(height: AppDimensions.spacingXL),
                // Category filters
                if (viewModel.categories.length > 1) ...[
                  Wrap(
                    spacing: AppDimensions.spacingSM,
                    runSpacing: AppDimensions.spacingSM,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFilterChip(
                        context,
                        'All Services',
                        viewModel.selectedCategory == null,
                        () => viewModel.setCategory(null),
                      ),
                      ...viewModel.categories.map(
                        (category) => _buildFilterChip(
                          context,
                          category,
                          viewModel.selectedCategory == category,
                          () => viewModel.setCategory(category),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingXL),
                ],
                // Services grid
                context.isNarrow
                    ? _buildNarrowLayout(context, viewModel)
                    : _buildWideLayout(context, viewModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.primaryLight.withOpacity(0.3),
      checkmarkColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, ServicesViewModel viewModel) {
    return Column(
      children:
          viewModel.filteredServices.map((service) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
              child: ServiceCard(
                service: service,
                isHovered: viewModel.isHovered(service.id),
                onHoverChanged: () {
                  viewModel.setHovered(
                    service.id,
                    !viewModel.isHovered(service.id),
                  );
                },
              ),
            );
          }).toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context, ServicesViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount =
            constraints.maxWidth > 1200
                ? 3
                : constraints.maxWidth > 800
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppDimensions.spacingMD,
            mainAxisSpacing: AppDimensions.spacingMD,
            childAspectRatio: crossAxisCount == 1 ? 3.5 : 2.5,
          ),
          itemCount: viewModel.filteredServices.length,
          itemBuilder: (context, index) {
            final service = viewModel.filteredServices[index];
            return ServiceCard(
              service: service,
              isHovered: viewModel.isHovered(service.id),
              onHoverChanged: () {
                viewModel.setHovered(
                  service.id,
                  !viewModel.isHovered(service.id),
                );
              },
            );
          },
        );
      },
    );
  }
}
