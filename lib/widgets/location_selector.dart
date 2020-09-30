import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  final double textSize;
  const LocationSelector({
    @required this.textSize,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on),
        SizedBox(
          width: 5,
        ),
        Text(
          'Islamabad,',
          softWrap: true,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' Pakistan',
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
