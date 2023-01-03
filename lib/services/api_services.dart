import 'package:getx_weather_app/models/current_model.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';

Future getCurrentWeather(lat, long) async {
  var link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherFromJson(res.body.toString());

    return data;
  }
}
