import 'package:flutter/material.dart';
import 'package:weather_today/main.dart';

class CurrentWeatherDataTile extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  CurrentWeatherDataTile({
    @required this.title,
    @required this.unit,
    @required this.value
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ExtraColorsUtility.customThirdColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              //'7:38',
              style: TextStyle(
                  color: ExtraColorsUtility.customSecondColor, fontSize: 26),
            ),
            Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              child: Text(
                unit,
                //'am',
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
