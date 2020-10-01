import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/location.dart';

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
        Flexible(
          child: Text(
            Provider.of<Location>(context).getSelectedCity,
            overflow: TextOverflow.ellipsis,
            //softWrap: true,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Text(
        //   ' Pakistan',
        //   style: TextStyle(fontSize: textSize),
        // ),
      ],
    );
  }
}
