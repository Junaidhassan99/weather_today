import 'package:flutter/material.dart';
import 'package:weather_today/model/weekly_weather_list.dart';
import 'package:weather_today/widgets/forcast_weather_tile.dart';
import 'package:weather_today/widgets/next_five_days_weather_tile.dart';

class TodayWeatherTile extends StatelessWidget {
  const TodayWeatherTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ForcastWeatherTile(
      fontSizeData: 24,
      weeklyWeatherData: WeeklyWeather(
        date: DateTime.now(),
        icon: Icons.ac_unit,
        maxTemp: -9,
        minTemp: 5,
      ),
    );
  }
}
