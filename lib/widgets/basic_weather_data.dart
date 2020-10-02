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
        LocationSelector(
          textSize: 22,
        ),
       const  SizedBox(
          height: 10,
        ),
        const Text(
          'Today',
          style:const  TextStyle(fontSize: 30),
        ),
        Text(
          '$dateData',
          //'Wed, 3 Dec',
          style:const  TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 5,
        ),
        Image.network('http:' + loadedData.iconImageUrl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${loadedData.temp}',
              //'-1',
              style:const  TextStyle(fontSize: 60),
            ),
            const Text(
              '°C',
              style:const  TextStyle(fontSize: 18),
            ),
          ],
        ),
        Text(
          'Fells like ${loadedData.tempFeelsLike}°',
          //'Fells like 3°',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
