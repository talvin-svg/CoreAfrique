class Service {
  final String id;
  final String name;
  final String shortDescription;
  final String? longDescription;
  final String category;
  final String? icon;
  final String? url;

  Service({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.category,
    this.longDescription,
    this.icon,
    this.url,
  });
}

