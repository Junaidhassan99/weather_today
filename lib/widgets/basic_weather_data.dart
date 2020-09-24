import 'package:flutter/material.dart';
import 'package:weather_today/widgets/location_selector.dart';

class BasicWeatherData extends StatelessWidget {
  const BasicWeatherData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationSelector(),
        SizedBox(
          height: 10,
        ),
        Text(
          'Today',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'Wed, 3 Dec',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '-1',
              style: TextStyle(fontSize: 60),
            ),
            Text(
              '*C',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        Text(
          'Fells like 3*',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

