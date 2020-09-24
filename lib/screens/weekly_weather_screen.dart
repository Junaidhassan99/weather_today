import 'package:flutter/material.dart';
import 'package:weather_today/model/weekly_weather_list.dart';
import 'package:weather_today/widgets/current_weather_conditions_description_weekly_weather_screen.dart';
import 'package:weather_today/widgets/location_selector.dart';


class WeeklyWeatherScreen extends StatelessWidget {
  //hello
  //changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: Container(
        //width: double.infinity,
        padding: EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LocationSelector(),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Next 5 days',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.ac_unit),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Thursday, 4 Dec',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(child: Container()),
                Text(
                  '-1*',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  '-5*',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.white,
            ),
            CurrentWeatherConditionDescriptionWeeklyWeatherScreen(),
            Divider(
              color: Colors.white,
            ),
            Column(
              children: [
                ...WeeklyWeatherList()
                    .getWeeklyWeatherListData
                    .map(
                      (e) => Row(
                        children: [
                          Icon(e.icon),
                          Text(
                            e.date.toString(),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            e.maxTemp.toString(),
                          ),
                          Text(
                            e.minTemp.toString(),
                          ),
                        ],
                      ),
                    )
                    .toList(),//okay
              ],
            )
          ],
        ),
      ),
    );
  }
}
