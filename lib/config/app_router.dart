// ignore_for_file: avoid_print
import 'package:debut/screens/screens.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: '/error',
      ),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
    );
  }
}
