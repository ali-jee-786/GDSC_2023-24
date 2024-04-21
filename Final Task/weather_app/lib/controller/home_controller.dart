import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../data/weather_api.dart';

class HomeController extends GetxController {
  final api = WeatherApi();

  var location = 'Islamabad'.obs;
  TextEditingController searchController = TextEditingController();
  var bgImgUrl =
      'https://w0.peakpx.com/wallpaper/1001/142/HD-wallpaper-space-black-stars-night-dark.jpg';
  var formatDate = DateFormat('EEEE, d MMMM').format(DateTime.now()).obs;

  var name = '';
  var main = '';
  var country = '';
  var iconCode = '10d';
  var temp = 0.0;
  var humidity = 0.0;
  var pressure = 0.0;
  var wind = 0.0;
  var feels_like = 0.0;
  bool error = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    getWeatherData();
  }
   getWeatherData() async {
    try {
    loading = true;
      var data = await api.getWeatherData(location.value);
      print(data);
      data.fold(
            (l) {
              name = l.name;
              main = l.weather[0].main;
              feels_like = l.main.feels_like;
              country = l.sys.country;
              temp = l.main.temp;
              humidity = l.main.humidity.toDouble();
              pressure = l.main.pressure.toDouble();
              wind = l.wind.speed;
              iconCode = l.weather[0].icon;
              error = false;
              loading = false;
              update();
        }, (r) {
              loading = false;
              error = true;
              update();
              },
      );
    } catch (e) {
      loading = false;
      error = true;
      update();
      print(e);
    }
  }
}
