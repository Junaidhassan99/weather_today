import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_today/model/current_condition.dart';
import 'package:weather_today/widgets/location_selector.dart';

class BasicWeatherData extends StatelessWidget {
  final CurrentCondition loadedData;
  BasicWeatherData({
    Key key,
    @required this.loadedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateData = DateFormat('EEE, d MMM ').format(loadedData.date);
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
          '$dateData',
          //'Wed, 3 Dec',
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
              '${loadedData.temp}',
              //'-1',
              style: TextStyle(fontSize: 60),
            ),
            Text(
              '°C',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Text(
          'Fells like ${loadedData.tempFeelsLike}°',
          //'Fells like 3°',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
