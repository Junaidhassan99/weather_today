import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/main.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final String temp;
  final DateTime time;
  final String iconImageUrl;
  HourlyWeatherContainer({
    @required this.temp,
    @required this.iconImageUrl,
    @required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              DateFormat('HH:mm').format(time),
              //'Now',
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ExtraColorsUtility.customSecondColor,
                ),
                borderRadius: BorderRadius.circular(20),
                color: ExtraColorsUtility.customFirstColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Container(
                    height: 35,
                    child: Image.network('http:' + iconImageUrl),
                  ),
                  Text(
                    '$temp°',
                    //'-1°C',
                    style: TextStyle(
                      color: ExtraColorsUtility.customSecondColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
