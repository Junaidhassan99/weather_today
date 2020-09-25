
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/model/weekly_weather_list.dart';

class ForcastWeatherTile extends StatelessWidget {
  final WeeklyWeather weeklyWeatherData;
  final double fontSizeData;
  ForcastWeatherTile({
    Key key,
    @required this.weeklyWeatherData,
    @required this.fontSizeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(weeklyWeatherData.icon),
        SizedBox(
          width: 10,
        ),
        Text(
          DateFormat('EEEEE, d MMM ').format(
            weeklyWeatherData.date,
          ),
          style: TextStyle(fontSize: fontSizeData),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          weeklyWeatherData.maxTemp.toString(),
          style: TextStyle(
            fontSize: fontSizeData+5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          weeklyWeatherData.minTemp.toString(),
          style: TextStyle(fontSize: fontSizeData),
        ),
      ],
    );
  }
}
