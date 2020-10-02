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
          child: FutureBuilder(
            future:
                Provider.of<Location>(context, listen: false).getSelectedCity(),
            builder: (_, snapshot) {
              return !(snapshot.connectionState == ConnectionState.done)
                  ? Text(
                      '-',
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      (snapshot.data as String),
                      overflow: TextOverflow.ellipsis,
                      
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    );
            },
          ),
        ),
   
      ],
    );
  }
}
