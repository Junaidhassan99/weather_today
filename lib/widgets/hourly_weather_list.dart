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
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 12; i++) HourlyWeatherContainer(),
                //for (int i = 0; i < 12; i++) HourlyWeatherContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
