import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class ForecastWeather {
  IconData icon;
  DateTime date;
  int minTemp;
  int maxTemp;
  ForecastWeather({
    @required this.date,
    @required this.icon,
    @required this.maxTemp,
    @required this.minTemp,
  });
}

class ForecastWeatherList with ChangeNotifier {
  List<ForecastWeather> _weeklyWeatherListData = [];

  Future<List<ForecastWeather>> loadAndSetForcastData() async {
    final response = await get(ApiRefrences.forcastApi);
    final responseDecoded = json.decode(response.body) as Map<String, dynamic>;
    final responseListData =
        responseDecoded['forecast']['forecastday'] as List<dynamic>;

    print(responseListData.length);

    _weeklyWeatherListData = responseListData.map((e) {
      int maxTemp = double.parse(e['day']['maxtemp_c'].toString()).round();
      int minTemp = double.parse(e['day']['mintemp_c'].toString()).round();

      return ForecastWeather(
          icon: Icons.ac_unit,
          date: DateTime.parse(e['date'].toString()),
          maxTemp: maxTemp,
          minTemp: minTemp);
    }).toList();

    return _weeklyWeatherListData;
  }

  List<ForecastWeather> get getWeeklyWeatherListData {
    //loadAndSetForcastData();
    return _weeklyWeatherListData;
  }
}
