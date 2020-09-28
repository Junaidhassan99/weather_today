

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:weather_today/main.dart';

import 'package:weather_today/model/forecast_weather_list.dart';

import 'package:weather_today/widgets/location_selector.dart';
import 'package:weather_today/widgets/next_five_days_weather_tile.dart';

class WeeklyWeatherScreen extends StatefulWidget {
  static const routeName = '/weekly-weather-screen';
  static const double defaultPadding = 20;

  @override
  _WeeklyWeatherScreenState createState() => _WeeklyWeatherScreenState();
}

class _WeeklyWeatherScreenState extends State<WeeklyWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: FutureBuilder(
        future: Provider.of<ForecastWeatherList>(context, listen: false)
            .loadAndSetForcastData(),
        builder: (_, snapshot) {
          return !(snapshot.connectionState == ConnectionState.done)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    //width: double.infinity,
                    padding: EdgeInsets.only(
                      top: WeeklyWeatherScreen.defaultPadding,
                      left: WeeklyWeatherScreen.defaultPadding,
                      right: WeeklyWeatherScreen.defaultPadding,
                    ),
                    child: Column(
                      children: [
                        LocationSelector(),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Next 3 days',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //TodayWeatherTile(),
                        SizedBox(
                          height: 20,
                        ),
                        // Divider(
                        //   color: ExtraColorsUtility.customThirdColor,
                        // ),
                        // CurrentWeatherConditionDescriptionWeeklyWeatherScreen(),
                        Divider(
                          color: ExtraColorsUtility.customThirdColor,
                        ),
                        NextFiveDaysWeatherTiles(listData: snapshot.data,),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
