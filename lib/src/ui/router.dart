import 'package:drohealth/src/constants/route_names.dart';
import 'package:drohealth/src/ui/views/itemdetail/item_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getMaterialPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );

    case ItemDetailViewRoute:
      return _getMaterialPageRoute(
        routeName: settings.name,
        viewToShow: ItemDetailView(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getMaterialPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

// ignore: unused_element
PageRoute _getCupertinoRoute({String routeName, Widget viewToShow}) {
  return CupertinoPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
