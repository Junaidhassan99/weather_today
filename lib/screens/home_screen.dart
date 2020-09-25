import 'package:flutter/material.dart';

import 'package:weather_today/widgets/current_weather_conditions_description.dart';

import 'package:weather_today/widgets/hourly_weather_list.dart';
import 'package:weather_today/widgets/basic_weather_data.dart';
import 'package:weather_today/widgets/weekly_weather_buttons.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  static const double defaultPadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: defaultPadding,
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  child: Column(
                    children: [
                      BasicWeatherData(),
                      SizedBox(
                        height: 10,
                      ),
                      WeeklyWeatherButtons(),
                      Divider(),
                    ],
                  ),
                ),
                HourlyWeatherList(),
                CurrentWeatherConditionsDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
