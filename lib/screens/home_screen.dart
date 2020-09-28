import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/current_condition.dart';
import 'package:weather_today/model/forecast_weather_list.dart';

import 'package:weather_today/widgets/current_weather_conditions_description.dart';

import 'package:weather_today/widgets/hourly_weather_list.dart';
import 'package:weather_today/widgets/basic_weather_data.dart';
import 'package:weather_today/widgets/weekly_weather_buttons.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  static const double defaultPadding = 20;
  @override
  Widget build(BuildContext context) {
    //Provider.of<ForecastWeatherList>(context, listen: false).loadAndSetHourlyForcastData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: FutureBuilder(
        future: Provider.of<CurrentCondition>(context, listen: false)
            .loadCurrentCondition(),
        builder: (_, snapshot) {
          return !(snapshot.connectionState == ConnectionState.done)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              top: defaultPadding,
                              left: defaultPadding,
                              right: defaultPadding,
                            ),
                            child: Column(
                              children: [
                                BasicWeatherData(
                                  loadedData: snapshot.data as CurrentCondition,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                WeeklyWeatherButtons(),
                                Divider(),
                              ],
                            ),
                          ),
                          HourlyWeatherList(),
                          CurrentWeatherConditionsDescription(
                            loadedData: snapshot.data as CurrentCondition,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
