import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/views/widgets/error_refresh.dart';
import 'package:weather_app/views/widgets/reuseable_row.dart';
import 'package:weather_app/views/widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    print('build');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: GetBuilder<HomeController>(
              init: controller,
              builder: (_) {
                if (controller.loading == true) {
                  return const CircularProgressIndicator();
                } else if (controller.error == true) {
                  return ErrorRefresh(
                    ontap: () {
                      controller.location.value = 'Islamabad';
                      controller.getWeatherData();
                    },
                  );
                } else {
                  return Stack(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        controller.bgImgUrl,
                        height: 900,
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_.name}, ${_.country}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SearchField(
                                  Controller: controller.searchController,
                                  onSubmit: (String val) {
                                    controller.location.value = val;
                                    controller.getWeatherData();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            'https://openweathermap.org/img/w/${_.iconCode}.png',
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.black,
                            child: Column(
                              children: [
                                Text(
                                  '${_.temp} °C',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  _.main,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  _.formatDate.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ReuseableRow(
                              title1: 'Feels like',
                              value1: '${_.feels_like} °C'.toString(),
                              icon1: Icons.cloud,
                              title2: 'Wind',
                              value2: '${_.wind} km/h'.toString(),
                              icon2: Icons.wind_power),
                          const SizedBox(
                            height: 25,
                          ),
                          ReuseableRow(
                              title1: 'Humidity',
                              value1: '${_.humidity} %'.toString(),
                              icon1: Icons.water_drop,
                              title2: 'Pressure',
                              value2: _.pressure.toString(),
                              icon2: Icons.cloudy_snowing),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
