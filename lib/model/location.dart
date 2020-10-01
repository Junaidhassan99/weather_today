import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

class LocationModel {
  final int id;
  final String name;
  final double lat;
  final double long;
  LocationModel({
    @required this.id,
    @required this.lat,
    @required this.long,
    @required this.name,
  });
}

class Location with ChangeNotifier {
  List<LocationModel> _locationList = [];
  String _selectedCity='Lahaur, Punjab, Pakistan';
  void setSelectedCity(String name) {
    _selectedCity = name;
  }

  String get getSelectedCity {
    return _selectedCity;
  }

  void loadLocationList(String name) async {
    final response =
        await get(ApiRefrences.autoCompleteLocationApi(name));
    print(json.decode(response.body));
    final responseData = json.decode(response.body) as List<dynamic>;
    //print('length: '+responseData.length.toString());
    _locationList = responseData
        .map(
          (e) => LocationModel(
            id: e['id'],
            lat: e['lat'],
            long: e['lon'],
            name: e['name'],
          ),
        )
        .toList();
  }

  List<LocationModel> get getLocationList {
    return _locationList;
  }
}
