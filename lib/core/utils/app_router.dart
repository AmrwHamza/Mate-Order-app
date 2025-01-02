import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/splash/views/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
