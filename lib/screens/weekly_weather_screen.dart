import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/main.dart';
import 'package:weather_today/model/weekly_weather_list.dart';
import 'package:weather_today/widgets/current_weather_conditions_description_weekly_weather_screen.dart';
import 'package:weather_today/widgets/location_selector.dart';
import 'package:weather_today/widgets/next_five_days_weather_tile.dart';
import 'package:weather_today/widgets/today_weather_tile.dart';

class WeeklyWeatherScreen extends StatelessWidget {
  static const routeName = '/weekly-weather-screen';
  static const double defaultPadding = 20;
  //hello
  //changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: SingleChildScrollView(
        child: Container(
          //width: double.infinity,
          padding: EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: Column(
            children: [
              LocationSelector(),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Next 5 days',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TodayWeatherTile(),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: ExtraColorsUtility.customThirdColor,
              ),
              CurrentWeatherConditionDescriptionWeeklyWeatherScreen(),
              Divider(
                color: ExtraColorsUtility.customThirdColor,
              ),
              NextFiveDaysWeatherTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
