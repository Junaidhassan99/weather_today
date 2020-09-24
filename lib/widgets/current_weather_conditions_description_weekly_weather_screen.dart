import 'package:flutter/material.dart';
import 'package:weather_today/widgets/current_weather_data_tile_weekly_weather_screen.dart';

class CurrentWeatherConditionDescriptionWeeklyWeatherScreen
    extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CurrentWeatherDataTileWeeklyWeatherScreen(),
            Expanded(
              child: Container(),
            ),
            CurrentWeatherDataTileWeeklyWeatherScreen(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CurrentWeatherDataTileWeeklyWeatherScreen(),
            Expanded(
              child: Container(),
            ),
            CurrentWeatherDataTileWeeklyWeatherScreen(),
            SizedBox(
              height: 20,
            ),
          ],
        ),SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
