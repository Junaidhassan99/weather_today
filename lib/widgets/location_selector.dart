import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Islamabad,',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' Pakistan',
          style: TextStyle(fontSize: 22),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
