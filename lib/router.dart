import './dishes/dishes.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/welcome/welcome.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomePage.routeName:
      return _getPageRoute(const WelcomePage(), settings);
    case DishesPage.routeName:
      return _getPageRoute(const DishesPage(), settings);
    case DishDetailsPage.routeName:
      final args = settings.arguments as DishDetailsPageArguments;
      return _getPageRoute(DishDetailsPage(args: args), settings);
    case EditDishPage.routeName:
      final args = settings.arguments as EditDishPageArguments;
      return _getPageRoute(EditDishPage(args: args), settings);
    default:
      return noRouteDefinedPage(settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => child,
    settings: settings,
  );
}

MaterialPageRoute noRouteDefinedPage(RouteSettings settings) {
  return MaterialPageRoute(
      builder: (context) => Scaffold(
            appBar:
                AppBar(title: Text("No route defined for ${settings.name}")),
            body: Center(child: Text("No route defined for ${settings.name}")),
          ));
}
