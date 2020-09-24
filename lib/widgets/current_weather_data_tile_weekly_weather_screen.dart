import 'package:flutter/material.dart';

class CurrentWeatherDataTileWeeklyWeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Wind',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          '8 km/h',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
