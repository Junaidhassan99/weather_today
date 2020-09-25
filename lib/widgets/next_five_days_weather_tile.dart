import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/weekly_weather_list.dart';

import '../main.dart';

class NextFiveDaysWeatherTiles extends StatelessWidget {
  const NextFiveDaysWeatherTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weeklyWeatherListData =
        Provider.of<WeeklyWeatherList>(context)
            .getWeeklyWeatherListData;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: weeklyWeatherListData.length,
      itemBuilder: (_, index) => Column(
        children: [
          Row(
            children: [
              Icon(weeklyWeatherListData[index].icon),
              SizedBox(
                width: 10,
              ),
              Text(
                DateFormat('EEEEE, d MMM ').format(
                  weeklyWeatherListData[index].date,
                ),
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                weeklyWeatherListData[index].maxTemp.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                weeklyWeatherListData[index].minTemp.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
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
