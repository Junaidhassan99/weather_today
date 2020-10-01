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
  double _bodyHeight(BuildContext context) {
    final bodyHeightData = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        kToolbarHeight;
    return bodyHeightData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<ForecastWeatherList>(context, listen: false)
              .refreshForcastWeather(context);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
            future: Provider.of<ForecastWeatherList>(context)
                .loadAndSetWeeklyForcastData(context),
            builder: (_, snapshot) {
              //print((snapshot.data as List<ForecastWeeklyWeather>)[0].date);
              return !(snapshot.connectionState == ConnectionState.done)
                  ? Container(
                      height: _bodyHeight(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      //width: double.infinity,
                      padding: EdgeInsets.only(
                        top: WeeklyWeatherScreen.defaultPadding,
                        left: WeeklyWeatherScreen.defaultPadding,
                        right: WeeklyWeatherScreen.defaultPadding,
                      ),
                      child: Column(
                        children: [
                          LocationSelector(
                            textSize: 22,
                          ),
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

                          Divider(
                            color: ExtraColorsUtility.customThirdColor,
                          ),
                          NextFiveDaysWeatherTiles(
                            listData:
                                snapshot.data as List<ForecastWeeklyWeather>,
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
