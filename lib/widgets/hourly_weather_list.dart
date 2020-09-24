import 'package:flutter/material.dart';
import 'package:weather_today/widgets/hourly_weather_container.dart';

class HourlyWeatherList extends StatelessWidget {
  const HourlyWeatherList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 12; i++) HourlyWeatherContainer(),
        ],
      ),
    );
  }
}
