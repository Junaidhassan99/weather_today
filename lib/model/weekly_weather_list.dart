import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class WeeklyWeather {
  IconData icon;
  DateTime date;
  int minTemp;
  int maxTemp;
  WeeklyWeather({
    @required this.date,
    @required this.icon,
    @required this.maxTemp,
    @required this.minTemp,
  });
}

class WeeklyWeatherList with ChangeNotifier {
  List<WeeklyWeather> _weeklyWeatherListData = [
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.cloud,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.wb_sunny,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -2,
    //   minTemp: -9,
    // ),
    // WeeklyWeather(
    //   date: DateTime.now(),
    //   icon: Icons.ac_unit,
    //   maxTemp: -555,
    //   minTemp: -9,
    // ),
  ];

  Future<List<WeeklyWeather>> loadAndSetForcastData() async {
    final response = await get(ApiRefrences.forcastApi);
    final responseDecoded = json.decode(response.body) as Map<String, dynamic>;
    final responseListData =
        responseDecoded['forecast']['forecastday'] as List<dynamic>;

    print(responseListData.length);

    _weeklyWeatherListData = responseListData.map((e) {
      int maxTemp = double.parse(e['day']['maxtemp_c'].toString()).round();
      int minTemp = double.parse(e['day']['mintemp_c'].toString()).round();

      return WeeklyWeather(
          icon: Icons.ac_unit,
          date: DateTime.parse(e['date'].toString()),
          maxTemp: maxTemp,
          minTemp: minTemp);
    }).toList();

    return _weeklyWeatherListData;
  }

  List<WeeklyWeather> get getWeeklyWeatherListData {
    //loadAndSetForcastData();
    return _weeklyWeatherListData;
  }
}
