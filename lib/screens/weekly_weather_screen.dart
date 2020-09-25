import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/main.dart';
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
      body: SingleChildScrollView(
        child: Container(
          //width: double.infinity,
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.,
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
                color: ExtraColorsUtility.customThirdColor,
              ),
              CurrentWeatherConditionDescriptionWeeklyWeatherScreen(),
              Divider(
                color: ExtraColorsUtility.customThirdColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...WeeklyWeatherList()
                      .getWeeklyWeatherListData
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Icon(e.icon),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  DateFormat('EEEEE, d MMM ').format(
                                    e.date,
                                  ),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  e.maxTemp.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  e.minTemp.toString(),
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Divider(
                              color: ExtraColorsUtility.customThirdColor,
                            )
                          ],
                        ),
                      )
                      .toList(), //okay
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
