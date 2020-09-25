import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/weekly_weather_list.dart';
import 'package:weather_today/widgets/forcast_weather_tile.dart';

import '../main.dart';

class NextFiveDaysWeatherTiles extends StatelessWidget {
  const NextFiveDaysWeatherTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weeklyWeatherListData =
        Provider.of<WeeklyWeatherList>(context).getWeeklyWeatherListData;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: weeklyWeatherListData.length,
      itemBuilder: (_, index) => Column(
        children: [
          ForcastWeatherTile(
            fontSizeData: 24,
            weeklyWeatherData: WeeklyWeather(
              date: weeklyWeatherListData[index].date,
              icon: weeklyWeatherListData[index].icon,
              maxTemp: weeklyWeatherListData[index].maxTemp,
              minTemp: weeklyWeatherListData[index].minTemp,
            ),
          ),
          Divider(
            color: ExtraColorsUtility.customThirdColor,
          )
        ],
      ),
    );
    //   Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       ...WeeklyWeatherList()
    //           .getWeeklyWeatherListData
    //           .map(
    //             (e) =>
    //           )
    //           .toList(), //okay
    //     ],
    //   ),
    // );
  }
}
