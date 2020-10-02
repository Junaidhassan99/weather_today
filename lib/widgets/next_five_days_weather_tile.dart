import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:weather_today/model/forecast_weather_list.dart';
import 'package:weather_today/widgets/forcast_weather_tile.dart';

import '../main.dart';

class NextFiveDaysWeatherTiles extends StatelessWidget {
  final List<ForecastWeeklyWeather> listData;
  NextFiveDaysWeatherTiles({
    Key key,
    @required this.listData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: (_, index) => Column(
        children: [
          ForcastWeatherTile(
            fontSizeData: 24,
            weeklyWeatherData: ForecastWeeklyWeather(
              date: listData[index].date,
              iconImageUrl: listData[index].iconImageUrl,
              maxTemp: listData[index].maxTemp,
              minTemp: listData[index].minTemp,
            ),
          ),
         const Divider(
            color: ExtraColorsUtility.customThirdColor,
          )
        ],
      ),
    );
  }
}
