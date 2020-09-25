import 'package:flutter/material.dart';

class WeeklyWeather {
  IconData icon;
  DateTime date;
  int minTemp;
  int maxTemp;
  WeeklyWeather({this.date, this.icon, this.maxTemp, this.minTemp});
}

class WeeklyWeatherList {
  List<WeeklyWeather> weeklyWeatherListData = [
    WeeklyWeather(
      date: DateTime.now(),
      icon: Icons.ac_unit,
      maxTemp: -2,
      minTemp: -9,
    ),
    WeeklyWeather(
      date: DateTime.now(),
      icon: Icons.ac_unit,
      maxTemp: -2,
      minTemp: -9,
    ),
    WeeklyWeather(
      date: DateTime.now(),
      icon: Icons.cloud,
      maxTemp: -2,
      minTemp: -9,
    ),
    WeeklyWeather(
      date: DateTime.now(),
      icon: Icons.wb_sunny,
      maxTemp: -2,
      minTemp: -9,
    ),
    WeeklyWeather(
      date: DateTime.now(),
      icon: Icons.ac_unit,
      maxTemp: -2,
      minTemp: -9,
    ),
  ];
  List<WeeklyWeather> get getWeeklyWeatherListData {
    return weeklyWeatherListData;
  }
}
