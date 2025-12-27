import 'package:flutter/material.dart';
import 'package:coreafrique/features/home/widgets/hero_section.dart';
import 'package:coreafrique/features/home/widgets/services_preview_section.dart';
import 'package:coreafrique/features/home/widgets/statistics_section.dart';
import 'package:coreafrique/features/home/widgets/clients_section.dart';
import 'package:coreafrique/features/home/widgets/cta_section.dart';
import 'package:coreafrique/features/shared/navbar.dart';
import 'package:coreafrique/features/shared/footer.dart';

/// Home page - Landing page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Navbar()),
          const SliverToBoxAdapter(child: HeroSection()),
          const SliverToBoxAdapter(child: ServicesPreviewSection()),
          const SliverToBoxAdapter(child: StatisticsSection()),
          const SliverToBoxAdapter(child: ClientsSection()),
          const SliverToBoxAdapter(child: CTASection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
