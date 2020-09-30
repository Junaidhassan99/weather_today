import 'package:flutter/material.dart';

class ChooseLocation extends StatelessWidget {
  static const routeName = '/choose-location-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Location'),
      ),
    );
  }
}
