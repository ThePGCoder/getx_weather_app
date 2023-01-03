import 'dart:convert';

import 'package:getx_weather_app/models/main_model.dart';
import 'package:getx_weather_app/models/weather_model.dart';
import 'package:getx_weather_app/models/wind_model.dart';

CurrentWeather currentWeatherFromJson(String str) => CurrentWeather.fromJson(json.decode(str));

class CurrentWeather {
  CurrentWeather({
    this.weather,
    this.main,
    this.wind,
    this.name,
  });

  List<Weather>? weather;
  Main? main;
  Wind? wind;
  int? dt;
  String? name;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main: Main.fromJson(json["main"]),
    wind: Wind.fromJson(json["wind"]),
    name: json["name"],
  );
}





