import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/current_condition.dart';

import 'package:weather_today/widgets/location_selector.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key key,
  }) : super(key: key);

  Widget _buildHeaderWidget(
    CurrentCondition data,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Weather Today',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data == null ? 'Loading...' : '${data.temp}',
                          //'-1',
                          style:data == null ? TextStyle(fontSize: 20):const TextStyle(fontSize: 60),
                        ),
                        Text(
                          data == null ? '' : '°C',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: data == null
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: const Center(
                            child: Text(' '),
                            //CircularProgressIndicator(),
                          ),
                        )
                      : Image.network(
                          'http:' + data.iconImageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
          ),
          LocationSelector(
            textSize: 22,
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<CurrentCondition>(context).loadCurrentCondition(context),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null) {
          return _buildHeaderWidget(null);
        }
        return (snapshot.connectionState == ConnectionState.done)
            ? _buildHeaderWidget(
                (snapshot.data as CurrentCondition),
              )
            : _buildHeaderWidget(null);
      },
    );
  }
}
