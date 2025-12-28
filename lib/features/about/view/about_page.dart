import 'package:flutter/material.dart';
import 'package:coreafrique/features/about/view_model/about_view_model.dart';
import 'package:coreafrique/features/about/widgets/timeline_widget.dart';
import 'package:coreafrique/features/about/widgets/team_card.dart';
import 'package:coreafrique/features/about/widgets/mission_section.dart';
import 'package:coreafrique/features/shared/navbar.dart';
import 'package:coreafrique/features/shared/footer.dart';

/// About page - Company information, team, and timeline
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AboutViewModel();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Navbar()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const MissionSection(),
                TimelineWidget(events: viewModel.timelineEvents),
                TeamCard(teamMembers: viewModel.teamMembers),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
