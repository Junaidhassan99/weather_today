import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:weather_today/model/api_refrences.dart';
import 'package:weather_today/model/location.dart';



class CurrentCondition with ChangeNotifier {
  DateTime date;
  int temp; //'C
  int tempFeelsLike; //'C
  int cloudCover; //%
  String windDirection; //am/pm
  int precipitation; //%
  int humidity; //%
  double wind; //km/h
  int pressure; //hpa
  String iconImageUrl;

  CurrentCondition({
    this.date,
    this.humidity,
    this.precipitation,
    this.pressure,
    this.windDirection,
    this.cloudCover,
    this.temp,
    this.tempFeelsLike,
    this.wind,
    this.iconImageUrl,
  });
  dynamic data;

  String _correctTheTimePattern(String string) {
    if (string.trim().length == 15) {
      string = string.replaceFirst(' ', ' 0');
    }
    return string;
  }

  Future<CurrentCondition> loadCurrentCondition(BuildContext context) async {
    
    try {
      final response = await get(
        ApiRefrences.currentConditionApi(
          await Provider.of<Location>(context, listen: false).getSelectedCity(),
        ),
      );

      data = json.decode(response.body);
      print(response.statusCode);
      //print(data.toString());
    } catch (error) {
      print(error.toString());
    }

    //Problem was that time must be in hh:mm formate
    //like: '2020-10-01 9:48'
    date = DateTime.parse(
        _correctTheTimePattern(data['location']['localtime'] as String));
    // date = DateTime.parse(
    //     _correctTheTimePattern('2020-05-09 9:48'));

    humidity = double.parse(data['current']['humidity'].toString()).round();
    precipitation =
        double.parse(data['current']['precip_mm'].toString()).round();

    pressure = double.parse(data['current']['pressure_mb'].toString()).round();
    temp = double.parse(data['current']['temp_c'].toString()).round();
    tempFeelsLike =
        double.parse(data['current']['feelslike_c'].toString()).round();
    wind = double.parse(data['current']['wind_kph'].toString());

    cloudCover = int.parse(data['current']['cloud'].toString());
    windDirection = data['current']['wind_dir'].toString();

    iconImageUrl = data['current']['condition']['icon'].toString();

    return CurrentCondition(
      date: date,
      humidity: humidity,
      precipitation: precipitation,
      pressure: pressure,
      windDirection: windDirection,
      cloudCover: cloudCover,
      temp: temp,
      tempFeelsLike: tempFeelsLike,
      wind: wind,
      iconImageUrl: iconImageUrl,
    );
  }

  Future<void> refreshCurrentCondition(BuildContext context) async {
    await loadCurrentCondition(context);
    notifyListeners();
  }
}
