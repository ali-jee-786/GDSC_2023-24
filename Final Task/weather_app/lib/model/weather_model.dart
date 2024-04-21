import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  String name;
  Sys sys;
  List<Weather> weather;
  Main main;
  Wind wind;

  WeatherModel({
    required this.name,
    required this.sys,
    required this.weather,
    required this.main,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> map) =>
      _$WeatherModelFromJson(map);
}

@JsonSerializable()
class Sys {
  late String country;
  Sys({required this.country});
  factory Sys.fromJson(Map<String, dynamic> map) => _$SysFromJson(map);
}

@JsonSerializable()
class Weather {
  late String main;
  late String icon;
  Weather({required this.main, required this.icon});
  factory Weather.fromJson(Map<String, dynamic> map) => _$WeatherFromJson(map);
}

@JsonSerializable()
class Main {
  double temp;
  double feels_like;
  int pressure;
  int humidity;
  Main(
      {required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity});
  factory Main.fromJson(Map<String, dynamic> map) => _$MainFromJson(map);
}

@JsonSerializable()
class Wind {
  double speed;
  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic> map) => _$WindFromJson(map);
}


  //De-serialization: (GET API)
  // //I manually create a fromJson function without using json automatic serializable/deserializable
  // //because in this case my weather mapped data is in nested key/values pairs:
  // WeatherModel.fromMap(Map<String, dynamic> map) {
  //   name = map['name'];
  //   country = map['sys']['country'];
  //   weather = map['weather'][0]['main'];
  //   icon = map['weather'][0]['icon'];
  //   temp = map['main']['temp'].toString();
  //   feels_like = map['main']['feels_like'].toString();
  //   pressure = map['main']['pressure'].toString();
  //   humidity = map['main']['humidity'].toString();
  //   wind = map['wind']['speed'].toString();
  //