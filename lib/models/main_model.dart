class Main {
  Main({
    this.temp,
  });

  int? temp;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toInt(),
  );
}