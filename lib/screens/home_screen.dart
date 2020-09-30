import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/current_condition.dart';

import 'package:weather_today/widgets/current_weather_conditions_description.dart';

import 'package:weather_today/widgets/hourly_weather_list.dart';
import 'package:weather_today/widgets/basic_weather_data.dart';
import 'package:weather_today/widgets/weekly_weather_buttons.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  static const double defaultPadding = 20;
  final GlobalKey _keyGlobal = GlobalKey();

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
          //print(MediaQuery.of(context).size.height);
          //_getSizes();
          await Provider.of<CurrentCondition>(context,listen: false).refreshCurrentCondition();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: FutureBuilder(
            key: _keyGlobal,
            future: Provider.of<CurrentCondition>(context)
                .loadCurrentCondition(),
            builder: (_, snapshot) {
              return !(snapshot.connectionState == ConnectionState.done)
                  ? Container(
                      height: _bodyHeight(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height < 700
                          ? 700
                          : _bodyHeight(context),
                      child: Column(
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
                    );
            },
          ),
        ),
      ),
    );
  }
}
