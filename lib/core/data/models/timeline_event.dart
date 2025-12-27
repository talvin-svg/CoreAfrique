/// Timeline event model for company history/about page
class TimelineEvent {
  final String id;
  final int year;
  final String title;
  final String description;
  final String? imageUrl;

  const TimelineEvent({
    required this.id,
    required this.year,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  @override
  String toString() => 'TimelineEvent(id: $id, year: $year, title: $title)';
}

