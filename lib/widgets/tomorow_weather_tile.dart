import 'package:flutter/material.dart';

class TomorowWeatherTile extends StatelessWidget {
  const TomorowWeatherTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.ac_unit),
        SizedBox(
          width: 5,
        ),
        Text(
          'Thursday, 4 Dec',
          style: TextStyle(fontSize: 24),
        ),
        Expanded(child: Container()),
        Text(
          '-1°',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text(
          '-5°',
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
