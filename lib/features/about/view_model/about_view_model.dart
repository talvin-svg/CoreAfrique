import 'package:coreafrique/core/data/models/team_member.dart';
import 'package:coreafrique/core/data/models/timeline_event.dart';
import 'package:coreafrique/core/data/team_data.dart';
import 'package:coreafrique/core/data/timeline_data.dart';
import 'package:flutter/material.dart';

/// ViewModel for About page - manages team data and timeline events
class AboutViewModel extends ChangeNotifier {
  final List<TeamMember> teamMembers = teamData;
  final List<TimelineEvent> timelineEvents = timelineData;

  @override
  void dispose() {
    // Cleanup if needed
    super.dispose();
  }
}
