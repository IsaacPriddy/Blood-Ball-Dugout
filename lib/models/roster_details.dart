class RosterDetails {
  final String name;
  final String tier;
  final List<String> specialRules;
  final bool apothecary;
  final String image;
  final String rosterPath;

  RosterDetails({
    required this.name,
    required this.tier,
    required this.specialRules,
    required this.apothecary,
    required this.image,
    required this.rosterPath,
  });

  factory RosterDetails.fromJson(Map<String, dynamic> json) {
    return RosterDetails(
      name: json['name'],
      tier: json['tier'],
      specialRules: List<String>.from(json['specialRules']),
      apothecary: json['apothecary'],
      image: json['image'],
      rosterPath: json['rosterPath'],
    );
  }
}