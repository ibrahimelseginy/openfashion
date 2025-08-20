import 'package:flutter/material.dart';
import '../Home/screens/splash.dart';
import '../Home/screens/home.dart';
import '../Home/screens/checkout.dart';
import '../Home/screens/add_card.dart';
import '../Home/screens/add_address.dart';
import '../Home/screens/place_order.dart';

class AppRoutes {
  // Route names
  static const String splash = '/splash';
  static const String home = '/home';
  static const String checkout = '/checkout';
  static const String placeOrder = '/place-order';
  static const String addCard = '/add-card';
  static const String addAddress = '/add-address';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }

  // Helper method to navigate to a specific route
  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Helper method to navigate and replace current route
  static void navigateAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  // Helper method to navigate and clear all previous routes
  static void navigateAndClearAll(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  // Helper method to go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // Helper method to go back with result
  static void goBackWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
