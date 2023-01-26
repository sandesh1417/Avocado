import 'package:flutter/material.dart';
import '../screens/home_screen/home_screen.dart';
import '../widgets/navigation.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case "/home_screen":
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return null;
    }
  }
}
