import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class ForecastWeeklyWeather {
  String iconImageUrl;
  DateTime date;
  int minTemp;
  int maxTemp;
  ForecastWeeklyWeather({
    @required this.date,
    @required this.iconImageUrl,
    @required this.maxTemp,
    @required this.minTemp,
  });
}

class ForecastHourlyWeather {
  String iconImageUrl;
  int temp;
  DateTime time;
  ForecastHourlyWeather({
    @required this.iconImageUrl,
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

    //print(responseListData.length);

    _weeklyWeatherListData = responseListData.map((e) {
      int maxTemp = double.parse(e['day']['maxtemp_c'].toString()).round();
      int minTemp = double.parse(e['day']['mintemp_c'].toString()).round();
      String iconImageUrl = e['day']['condition']['icon'].toString();
      print(iconImageUrl);

      return ForecastWeeklyWeather(
        iconImageUrl: iconImageUrl,
        //iconImageUrl: '//cdn.weatherapi.com/weather/64x64/day/116.png',
        date: DateTime.parse(e['date'].toString()),
        maxTemp: maxTemp,
        minTemp: minTemp,
      );
    }).toList();
    //loadAndSetHourlyForcastData();

    return _weeklyWeatherListData;
  }

  Future<List<ForecastHourlyWeather>> loadAndSetHourlyForcastData() async {
    final response = await get(ApiRefrences.forcastApi);
    final responseDecoded = json.decode(response.body) as Map<String, dynamic>;
    final responseListData0 =
        responseDecoded['forecast']['forecastday'][0]['hour'] as List<dynamic>;
    final responseListData1 =
        responseDecoded['forecast']['forecastday'][1]['hour'] as List<dynamic>;
    final responseListData = responseListData0 + responseListData1;

    //print('length=' + responseListData.length.toString());

    final hourlyWeatherListData48Hours = responseListData.map((e) {
      int temp = double.parse(e['temp_c'].toString()).round();
      DateTime time = DateTime.parse(e['time'].toString());
      String iconImageUrl = e['condition']['icon'];

      //print('test 1: $temp');
      //print('test 2: $time');
      //

      return ForecastHourlyWeather(
        iconImageUrl: iconImageUrl,
        temp: temp,
        time: time,
      );
    }).toList();

    _hourlyWeatherListData = hourlyWeatherListData48Hours.where((element) {
      return element.time.isAfter(DateTime.now());
    }).toList();

    //print('length 2=' + _hourlyWeatherListData.length.toString());

    return _hourlyWeatherListData;
  }

  Future<void> refreshForcastWeather() async {
    await loadAndSetWeeklyForcastData();
    await loadAndSetHourlyForcastData();
    notifyListeners();
  }

  List<ForecastWeeklyWeather> get getWeeklyWeatherListData {
    //loadAndSetForcastData();
    return _weeklyWeatherListData;
  }
}
