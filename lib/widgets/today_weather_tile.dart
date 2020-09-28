import 'package:flutter/material.dart';
import 'package:weather_today/model/forecast_weather_list.dart';
import 'package:weather_today/widgets/forcast_weather_tile.dart';


class TodayWeatherTile extends StatelessWidget {
  const TodayWeatherTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ForcastWeatherTile(
      fontSizeData: 24,
      weeklyWeatherData: ForecastWeeklyWeather(
        date: DateTime.now(),
        icon: Icons.ac_unit,
        maxTemp: -9,
        minTemp: 5,
      ),
    );
  }
}
