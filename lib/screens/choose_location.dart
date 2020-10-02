import 'package:flutter/material.dart';

import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/model/location.dart';

class ChooseLocation extends StatefulWidget {
  static const routeName = '/choose-location';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<LocationModel> data = [];
  String nameData;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<Location>(context, listen: false).getLocationList;
    return Scaffold(
      body: FloatingSearchBar.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Provider.of<Location>(context, listen: false)
                  .setSelectedCity(data[index].name);
              Navigator.of(context).pop();
            },
            leading: Text(data[index].name),
          );
        },
        trailing: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              Provider.of<Location>(context, listen: false)
                  .loadLocationList(nameData);
            });
          },
        ),
        onChanged: (String value) {
          setState(() {
            Provider.of<Location>(context, listen: false)
                .loadLocationList(value);
          });
          nameData = value;
        },
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search...",
        ),
      ),
    );
  }
}
