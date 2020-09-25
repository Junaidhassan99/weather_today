import 'package:flutter/material.dart';
import 'package:weather_today/screens/weekly_weather_screen.dart';

class WeeklyWeatherButtons extends StatelessWidget {
  const WeeklyWeatherButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Today',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Tomorrow',
          style: TextStyle(fontSize: 18),
        ),
        Expanded(
          child: Container(),
        ),
        FlatButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(WeeklyWeatherScreen.routeName),
          child: Text(
            'Next 5 days',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
