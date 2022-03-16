class SexPosition {
  final int id;
  final String name;
  final String? description;
  final String image;

  SexPosition(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  factory SexPosition.fromMap(Map<String, dynamic> json) => SexPosition(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );
}