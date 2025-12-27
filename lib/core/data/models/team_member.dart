class TeamMember {
  final String id;
  final String name;
  final String role;
  final String bio;
  final List<String> qualifications;
  final String? linkedinUrl;
  final String? email;
  final String? image;
  final String? url;

  TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.bio,
    required this.qualifications,
    this.linkedinUrl,
    this.email,
    this.image,
    this.url,
  });
}

