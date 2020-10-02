import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather_today/model/api_refrences.dart';

import 'package:location/location.dart' as geoLocation;

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
  //String _selectedCity = 'Lahaur, Punjab, Pakistan';
  String _selectedCity;

  Future<void> initiateSelectedCity() async {
    final geoLocationCoordinates = await geoLocation.Location().getLocation();

    final responseData = await autoCompleteLocationApiNamesList(
        '${geoLocationCoordinates.latitude},${geoLocationCoordinates.longitude}');
    _selectedCity = responseData[0]['name'];
  }

  void setSelectedCity(String name) {
    _selectedCity = name;
  }

  Future<String> getSelectedCity() async {
    if (_selectedCity == null || _selectedCity.isEmpty) {
      await initiateSelectedCity();
    }
    return _selectedCity;
  }

  Future<List<dynamic>> autoCompleteLocationApiNamesList(String name) async {
    final response = await get(ApiRefrences.autoCompleteLocationApi(name));

    final responseData = json.decode(response.body) as List<dynamic>;

    return responseData;
  }

  void loadLocationList(String name) async {
    final responseData = await autoCompleteLocationApiNamesList(name);
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
