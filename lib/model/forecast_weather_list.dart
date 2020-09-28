import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class ForecastWeeklyWeather {
  IconData icon;
  DateTime date;
  int minTemp;
  int maxTemp;
  ForecastWeeklyWeather({
    @required this.date,
    @required this.icon,
    @required this.maxTemp,
    @required this.minTemp,
  });
}

class ForecastHourlyWeather {
  IconData icon;
  int temp;
  DateTime time;
  ForecastHourlyWeather({
    @required this.icon,
    @required this.temp,
    @required this.time,
  });
}

class ForecastWeatherList with ChangeNotifier {
  List<ForecastWeeklyWeather> _weeklyWeatherListData = [];
  List<ForecastHourlyWeather> _hourlyWeatherListData = [];

  Future<List<ForecastWeeklyWeather>> loadAndSetWeeklyForcastData() async {
    final response = await get(ApiRefrences.forcastApi);
    final responseDecoded = json.decode(response.body) as Map<String, dynamic>;
    final responseListData =
        responseDecoded['forecast']['forecastday'] as List<dynamic>;

    print(responseListData.length);

    _weeklyWeatherListData = responseListData.map((e) {
      int maxTemp = double.parse(e['day']['maxtemp_c'].toString()).round();
      int minTemp = double.parse(e['day']['mintemp_c'].toString()).round();

      return ForecastWeeklyWeather(
          icon: Icons.ac_unit,
          date: DateTime.parse(e['date'].toString()),
          maxTemp: maxTemp,
          minTemp: minTemp);
    }).toList();
    //loadAndSetHourlyForcastData();

    return _weeklyWeatherListData;
  }

  Future<List<ForecastHourlyWeather>> loadAndSetHourlyForcastData() async {
    final response = await get(ApiRefrences.forcastApi);
    final responseDecoded = json.decode(response.body) as Map<String, dynamic>;
    final responseListData =
        responseDecoded['forecast']['forecastday'][0]['hour'] as List<dynamic>;

    print(responseListData.length);

    _hourlyWeatherListData = responseListData.map((e) {
      int temp = double.parse(e['temp_c'].toString()).round();
      DateTime time = DateTime.parse(e['time'].toString());
      print('test 1: $temp');
      print('test 2: $time');

      return ForecastHourlyWeather(
        icon: Icons.ac_unit,
        temp: temp,
        time: time,
      );
    }).toList();

    return _hourlyWeatherListData;
  }

  List<ForecastWeeklyWeather> get getWeeklyWeatherListData {
    //loadAndSetForcastData();
    return _weeklyWeatherListData;
  }
}
