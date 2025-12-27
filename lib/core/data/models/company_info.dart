/// Company information model
class CompanyInfo {
  final String name;
  final String tagline;
  final String description;
  final String mission;
  final String vision;
  final Map<String, String> contactInfo;
  final List<String> clientCategories;
  final String establishmentYear;
  final String location;
  final List<String> keyDifferentiators;

  const CompanyInfo({
    required this.name,
    required this.tagline,
    required this.description,
    required this.mission,
    required this.vision,
    required this.contactInfo,
    required this.clientCategories,
    required this.establishmentYear,
    required this.location,
    required this.keyDifferentiators,
  });
}

