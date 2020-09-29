
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/model/forecast_weather_list.dart';

class ForcastWeatherTile extends StatelessWidget {
  final ForecastWeeklyWeather weeklyWeatherData;
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
        Image.network('http:'+weeklyWeatherData.iconImageUrl),
        //Icon(weeklyWeatherData.icon),
        SizedBox(
          width: 10,
        ),
        Text(
          DateFormat('EE, dd MMM ').format(
            weeklyWeatherData.date,
          ),
          style: TextStyle(fontSize: fontSizeData),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          '${weeklyWeatherData.maxTemp}°',
          style: TextStyle(
            fontSize: fontSizeData+5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${weeklyWeatherData.minTemp}°',
          style: TextStyle(fontSize: fontSizeData),
        ),
      ],
    );
  }
}
