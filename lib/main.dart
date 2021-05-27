import 'package:drohealth/src/constants/route_names.dart';
import 'package:drohealth/src/ui/router.dart';
import 'package:flutter/material.dart';

import 'locator.dart';
import 'src/services/navigation_service.dart';

void main() {
  setupLocator();

  runApp(DroHealth());
}

class DroHealth extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DRO Health',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeViewRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
