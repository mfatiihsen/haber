class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    print(json["id"]);
    print(json["name"]);

    return Source(
      id: json["id"] ?? "Id bulunamadı",
      name: json["name"],
    );
  }
}
