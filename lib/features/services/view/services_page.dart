import 'package:flutter/material.dart';
import 'package:coreafrique/features/services/widgets/services_grid.dart';
import 'package:coreafrique/features/shared/navbar.dart';
import 'package:coreafrique/features/shared/footer.dart';

/// Services page - Display all services
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Navbar()),
          const SliverToBoxAdapter(child: ServicesGrid()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
