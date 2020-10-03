import 'package:flutter/material.dart';
import 'package:weather_today/main.dart';
import 'package:weather_today/screens/choose_location.dart';

import 'package:weather_today/widgets/custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          const Divider(
            color: ExtraColorsUtility.customFirstColor,
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(ChooseLocation.routeName),
            leading:const Icon(Icons.location_on),
            title: Text(
              'Choose a city',
              style: Theme.of(context).textTheme.headline1,
            
            ),
          ),
         const Divider(
            color: ExtraColorsUtility.customFirstColor,
          ),
        ],
      ),
    );
  }
}
