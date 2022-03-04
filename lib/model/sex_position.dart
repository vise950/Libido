class SexPosition {
  final int id;
  final String name;
  final String? description;
  // final int difficulty;
  // final Category? category;
  final String image;

  SexPosition(
      {required this.id,
      required this.name,
      required this.description,
      // required this.difficulty,
      // required this.category,
      required this.image});

  factory SexPosition.fromMap(Map<String, dynamic> json) => SexPosition(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        // difficulty: json["difficulty"],
        // category: EnumToString.fromString(Category.values, json["category"]),
        image: json["image"],
      );
}

// enum Category {
//   oral,
//   manActive,
//   womanActive,
// }
