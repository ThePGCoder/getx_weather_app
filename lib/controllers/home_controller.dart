import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getx_weather_app/services/api_services.dart';

class HomeController extends GetxController {
  final dateTime = DateTime.now();

  RxString locationImage = ''.obs;

  var isDark = false.obs;
  dynamic currentWeather;
  dynamic hourlyWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isloaded = false.obs;

  calculateWindDirection(int angle) {
    if (angle > 0 && angle < 22.5) {
      return ('N');
    }
    if (angle > 22.5 && angle < 67.5) {
      return ('NE');
    }
    if (angle > 67.5 && angle < 112.5) {
      return ('E');
    }
    if (angle > 112.5 && angle < 157.5) {
      return ('SE');
    }
    if (angle > 157.5 && angle < 202.5) {
      return ('S');
    }
    if (angle > 202.5 && angle < 247.5) {
      return ('SW');
    }
    if (angle > 247.5 && angle < 292.5) {
      return ('W');
    }
    if (angle > 292.5 && angle < 337.5) {
      return ('NW');
    }
    if (angle > 337.5 && angle < 360) {
      return ('N');
    } else
      return ('None');
  }

  getImage(String? name) {
    if (name == 'Mountain View') {
      locationImage.value = 'assets/images/mountainview.jpg';
      return 'assets/images/mountainview.jpg';
    }
    if (name == 'Lower Hutt City') {
      locationImage.value = 'assets/images/lower_hutt.jpg';
      return 'assets/images/lower_hutt.jpg';
    }
    else {
      locationImage.value = 'assets/images/no-image.png';
    return 'assets/images/no-image.png';}
  }

  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isloaded.value = true;
    });
  }

  @override
  void onInit() async {
    await getUserLocation();
    currentWeather = getCurrentWeather(-41.2626, 174.9471);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
