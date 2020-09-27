import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class CurrentCondition with ChangeNotifier {
  DateTime date;
  int temp; //'C
  int tempFeelsLike; //'C
  String sunShineAt; //am/pmR
  String sunSetAt; //am/pm
  int precipitation; //%
  int humidity; //%
  double wind; //km/h
  double pressure; //hpa

  CurrentCondition({
    this.date,
    this.humidity,
    this.precipitation,
    this.pressure,
    this.sunSetAt,
    this.sunShineAt,
    this.temp,
    this.tempFeelsLike,
    this.wind,
  });
  dynamic data;

  Future<CurrentCondition> loadCurrentCondition() async {
    try {
      final response = await get(
        ApiRefrences.currentConditionApi,
      );

      data = json.decode(response.body);
      print(response.statusCode);
      //print(data.toString());
    } catch (error) {
      print(error.toString());
    }

    date = DateTime.parse(data['location']['localtime'].toString());

    humidity = double.parse(data['current']['humidity'].toString()).round();
    precipitation =
        double.parse(data['current']['precip_mm'].toString()).round();

    pressure = double.parse(data['current']['pressure_mb'].toString());
    temp = double.parse(data['current']['temp_c'].toString()).round();
    tempFeelsLike =
        double.parse(data['current']['feelslike_c'].toString()).round();
    wind = double.parse(data['current']['wind_kph'].toString());

    return CurrentCondition(
      date: date,
      humidity: humidity,
      precipitation: precipitation,
      pressure: pressure,
      sunSetAt: sunSetAt,
      sunShineAt: sunShineAt,
      temp: temp,
      tempFeelsLike: tempFeelsLike,
      wind: wind,
    );
  }
}
