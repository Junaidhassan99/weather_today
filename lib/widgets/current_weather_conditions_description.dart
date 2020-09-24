import 'package:flutter/material.dart';
import 'package:weather_today/main.dart';
import 'package:weather_today/widgets/current_weather_data_tile.dart';

class CurrentWeatherConditionsDescription extends StatelessWidget {
  const CurrentWeatherConditionsDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ExtraColorsUtility.customSecondColor,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ExtraColorsUtility.customFirstColor,
        ),
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CurrentWeatherDataTile(),
                        CurrentWeatherDataTile(),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}