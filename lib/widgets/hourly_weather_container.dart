import 'package:flutter/material.dart';
import 'package:weather_today/main.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final String temp;
  HourlyWeatherContainer({
   @required this.temp,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Now',
            ),
            SizedBox(
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.black,
                  ),
                  Text(
                    temp,
                    //'-1°C',
                    style:
                        TextStyle(color: ExtraColorsUtility.customSecondColor),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
