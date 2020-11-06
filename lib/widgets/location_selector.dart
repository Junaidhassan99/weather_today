import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/location.dart';

class LocationSelector extends StatelessWidget {
  final double textSize;
  const LocationSelector({
    @required this.textSize,
    Key key,
  }) : super(key: key);

  Widget get errorTextWidget {
    return Text(
      'Loading...',
      style: TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: FutureBuilder(
            future:
                Provider.of<Location>(context, listen: false).getSelectedCity(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data == null) {
                return errorTextWidget;
              }
              return !(snapshot.connectionState == ConnectionState.done)
                  ? errorTextWidget
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
