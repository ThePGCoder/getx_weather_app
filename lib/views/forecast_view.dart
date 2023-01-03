/*import 'package:flutter/material.dart';
import 'package:flutter_getx_weather_app/constants/strings.dart';
import 'package:flutter_getx_weather_app/controllers/home_controller.dart';
import 'package:flutter_getx_weather_app/models/forecast_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';

class DayForecast extends StatelessWidget {
  DayForecast({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(MdiIcons.arrowLeft, color: Colors.blue),
                onPressed: (){Get.back();},
              ),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('24 Hour Forecast', style: TextStyle(color: Colors.blue),),
                  ),
                  Icon(MdiIcons.clockOutline, color: Colors.blue, size: 30),
                ],
              ),
              centerTitle: true,
              elevation: 5,
            ),
            body: Stack(
              children: [
                Center(
                  child: Container(
                    height: double.infinity,
                    child: Image.asset(homeController.locationImage.value, fit: BoxFit.cover, color: Color(0xff999999).withOpacity(0.7), colorBlendMode: BlendMode.modulate, ),
                  ),
                ),
                Center(
                  child: FutureBuilder(
                    future: homeController.hourlyWeatherData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        HourlyWeatherData hourlyData = snapshot.data;

                        return SizedBox(
                          height: 260,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: hourlyData.list!.length > 6 ? 6 : hourlyData.list!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var time = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(
                                  hourlyData.list![index].dt!.toInt() * 1000));

                              return Card(
                                child: Container(
                                  width: 140,
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Image.asset(
                                        "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                                        width: 80,
                                      ),
                                      Text(("${hourlyData.list![index].weather![0].description}") ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(MdiIcons.weatherWindy, color: Colors.grey),
                                          Text("${hourlyData.list![index].wind!.speed} km/h"),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(MdiIcons.navigationVariantOutline, color: Colors.grey,),
                                          Text(homeController.calculateWindDirection(hourlyData.list![index].wind!.deg!.toInt()),
                                          )],
                                      ),


                                      Text("${hourlyData.list![index].main!.temp}$degree", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                      Text(time),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            )
        );

  }
}*/