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
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data == null ? '-' : '${data.temp}',
                        //'-1',
                        style: TextStyle(fontSize: 60),
                      ),
                      Text(
                        data == null ? '' : '°C',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: data == null
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: CircularProgressIndicator(
                              //backgroundColor: Colors.white,
                              ),
                        ),
                      )
                    : Image.network(
                        'http:' + data.iconImageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
          LocationSelector(
            textSize: 22,
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CurrentCondition>(context).loadCurrentCondition(),
      builder: (_, snapshot) {
        return (snapshot.connectionState == ConnectionState.done)
            ? _buildHeaderWidget(
                (snapshot.data as CurrentCondition),
              )
            : _buildHeaderWidget(null);
      },
    );
  }
}
