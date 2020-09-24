import 'package:flutter/material.dart';

import 'package:weather_today/screens/weekly_weather_screen.dart';

void main() {
  runApp(WeatherToday());
 
}

class ExtraColorsUtility {
  //okay
  static const Color customFirstColor = Colors.white;
  static const Color customSecondColor = Colors.black;
  static const Color customThirdColor = Colors.grey;
}

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // primaryColor: Colors.white,
        accentColor: Colors.red,
      ),
      home: 
      WeeklyWeatherScreen(),
      //HomeScreen(),
    );
  }
}
