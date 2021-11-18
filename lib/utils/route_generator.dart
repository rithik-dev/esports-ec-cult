import 'package:esports_ec/screens/splash_screen.dart';
import 'package:esports_ec/widgets/page_transition.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments as dynamic;
    switch (settings.name) {
      case SplashScreen.id:
        return _route(const SplashScreen());
      default:
        return _errorRoute(settings.name);
    }
  }

  static PageTransition _route(Widget widget) => PageTransition(child: widget);

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: Center(
            child: Text('ROUTE \n\n$name\n\nNOT FOUND'),
          ),
        ),
      );
    });
  }
}
