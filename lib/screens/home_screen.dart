import 'package:flutter/material.dart';

import 'package:weather_today/widgets/current_weather_conditions_description.dart';

import 'package:weather_today/widgets/hourly_weather_list.dart';
import 'package:weather_today/widgets/basic_weather_data.dart';
import 'package:weather_today/widgets/weekly_weather_buttons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Column(
              children: [
                BasicWeatherData(),
                SizedBox(
                  height: 10,
                ),
                WeeklyWeatherButtons(),
                Divider(),
                HourlyWeatherList(),
              ],
            ),
          ),
          CurrentWeatherConditionsDescription(),
        ],
      ),
    );
  }
}
