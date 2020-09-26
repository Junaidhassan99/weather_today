import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/main.dart';
import 'package:weather_today/model/current_condition.dart';
import 'package:weather_today/widgets/current_weather_data_tile.dart';

class CurrentWeatherConditionsDescription extends StatelessWidget {
  final CurrentCondition loadedData;
  Widget _buildCurrentConditionsDescriptionRow({
    String firstTitle,
    String firstValue,
    String firstUnit,
    String secondTile,
    String secondValue,
    String secondUnit,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CurrentWeatherDataTile(
              title: firstTitle,
              unit: firstUnit,
              value: firstValue,
            ),
            CurrentWeatherDataTile(
              title: secondTile,
              unit: secondUnit,
              value: secondValue,
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  CurrentWeatherConditionsDescription({
    Key key,
    @required this.loadedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ExtraColorsUtility.customSecondColor,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: ExtraColorsUtility.customFirstColor,
      ),
      child: Column(
        //PRECIPIATION,,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCurrentConditionsDescriptionRow(
              firstTitle: 'SUNRISE',
              firstUnit: 'am',
              firstValue: '7:38',
              secondTile: 'SUNSET',
              secondUnit: 'pm',
              secondValue: '7:38'),
          _buildCurrentConditionsDescriptionRow(
              firstTitle: 'PRECIPIATION',
              firstUnit: '%',
              firstValue: loadedData.precipitation.toString(),
              secondTile: 'HUMIDITY',
              secondUnit: '%',
              secondValue: loadedData.humidity.toString()),
          _buildCurrentConditionsDescriptionRow(
              firstTitle: 'WIND',
              firstUnit: 'km/h',
              firstValue: loadedData.wind.toString(),
              secondTile: 'PRESSURE',
              secondUnit: 'hpa',
              secondValue: loadedData.pressure.toString()),
        ],
      ),
    );
  }
}
