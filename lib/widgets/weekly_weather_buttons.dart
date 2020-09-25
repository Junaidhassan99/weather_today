import 'package:flutter/material.dart';

class WeeklyWeatherButtons extends StatelessWidget {
  const WeeklyWeatherButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Today',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Tomorrow',
          style: TextStyle(fontSize: 18),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Next 5 days',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
