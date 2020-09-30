import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/current_condition.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Weather Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: Provider.of<CurrentCondition>(context)
                    .loadCurrentCondition(),
                builder: (_, snapshot) {
                  return !(snapshot.connectionState == ConnectionState.done)
                      ? Container(
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 60),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${(snapshot.data as CurrentCondition).temp}',
                              //'-1',
                              style: TextStyle(fontSize: 60),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        );
                },
              )
            ],
          ),
          Expanded(
            child: Image.network(
              'http:' + '//cdn.weatherapi.com/weather/64x64/day/116.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
