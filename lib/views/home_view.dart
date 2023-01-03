import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_weather_app/controllers/home_controller.dart';
import 'package:getx_weather_app/models/current_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Weather App',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
              Icon(
                MdiIcons.weatherLightning,
                color: Colors.blue,
                size: 30,
              ),
            ],
          ),
          centerTitle: true,
          elevation: 5,
        ),
        body: Column(
          children: [
            SizedBox(height: 7.h),
            Text(
              homeController.dateTime.format(AmericanDateFormats.dayOfWeek),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
                    height: 70.h,
                    width: 90.w,
                    child: Card(
                        elevation: 8,
                        child: Column(children: [
                          Obx(
                            () => controller.isloaded.value == true
                                ? FutureBuilder(
                                    future: homeController.currentWeather,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        CurrentWeather data = snapshot.data;
                                        return Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              height: 30.h,
                                              child: Image.asset(
                                                  homeController
                                                      .getImage(data.name),
                                                  fit: BoxFit.fill),
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              "${data.name}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/weather/${data.weather![0].icon}.png",
                                                  width: 100,
                                                  height: 100,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            MdiIcons
                                                                .sunThermometerOutline,
                                                            color: Colors.grey),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${data.main!.temp}°",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 36),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      "${data.weather![0].description}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(height: 2.h),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            MdiIcons
                                                                .weatherWindy,
                                                            color: Colors.grey),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            "${data.wind!.speed} km/h"),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          MdiIcons
                                                              .navigationVariantOutline,
                                                          color: Colors.grey,
                                                        ),
                                                        Text(homeController
                                                            .calculateWindDirection(
                                                                (data.wind!.deg!
                                                                    .toInt())))
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    })
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ]))))
          ],
        ));
  }
}
