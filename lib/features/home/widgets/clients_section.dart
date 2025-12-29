import 'package:flutter/material.dart';
import 'package:coreafrique/core/data/clients_data.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';
import 'package:coreafrique/features/shared/widgets/section_container.dart';
import 'package:coreafrique/features/shared/widgets/section_title.dart';
import 'package:coreafrique/features/shared/widgets/client_category_card.dart';

/// Clients section for home page
class ClientsSection extends StatelessWidget {
  const ClientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimensions.spacingXXL),
          const SectionTitle(
            title: 'Our Clients',
            subtitle: 'Trusted by leading organizations across Africa',
          ),
          const SizedBox(height: AppDimensions.spacingXXL),
          context.isNarrow
              ? _buildNarrowLayout(context)
              : _buildWideLayout(context),
          const SizedBox(height: AppDimensions.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: clientsData
          .map((client) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacingLG),
                child: ClientCategoryCard(
                  category: client.category,
                  examples: client.examples,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMedium ? 2 : 3,
        crossAxisSpacing: AppDimensions.spacingLG,
        mainAxisSpacing: AppDimensions.spacingLG,
        childAspectRatio: 1.8,
      ),
      itemCount: clientsData.length,
      itemBuilder: (context, index) => ClientCategoryCard(
        category: clientsData[index].category,
        examples: clientsData[index].examples,
      ),
    );
  }
}
