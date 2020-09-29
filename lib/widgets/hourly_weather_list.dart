import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/forecast_weather_list.dart';
import 'package:weather_today/widgets/hourly_weather_container.dart';

class HourlyWeatherList extends StatelessWidget {
  const HourlyWeatherList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ForecastWeatherList>(context, listen: false)
          .loadAndSetHourlyForcastData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final snapShotData = snapshot.data as List<ForecastHourlyWeather>;
          return Container(
            height: 100,
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      for (int i = 0; i < 12; i++)
                        HourlyWeatherContainer(
                          temp: snapShotData[i].temp.toString(),
                          iconImageUrl: snapShotData[i].iconImageUrl,
                          time: snapShotData[i].time,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
