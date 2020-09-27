

import 'package:flutter/material.dart';

import 'package:weather_today/screens/weekly_weather_screen.dart';

class WeeklyWeatherButtons extends StatelessWidget {
  const WeeklyWeatherButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  =>Navigator.of(context).pushNamed(WeeklyWeatherScreen.routeName),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Next 5 days',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.navigate_next,
          )
        ],
      ),
    );
  }
}
