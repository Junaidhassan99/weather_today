import 'package:flutter/material.dart';
import 'package:weather_today/main.dart';

class CurrentWeatherDataTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUNRISE',
          style: TextStyle(
            color: ExtraColorsUtility.customThirdColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '7:38',
              style: TextStyle(
                color: ExtraColorsUtility.customSecondColor,
                fontSize: 26
              ),
            ),
            Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              child: Text(
                'am',
                style: TextStyle(
                  color: ExtraColorsUtility.customSecondColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
