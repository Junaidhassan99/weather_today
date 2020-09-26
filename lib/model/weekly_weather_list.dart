import 'package:flutter/material.dart';

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
  List<WeeklyWeather> get getWeeklyWeatherListData {
    return _weeklyWeatherListData;
  }
}
