class Weather {

  int? id;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    description: json["description"],
    icon: json["icon"],
  );
}