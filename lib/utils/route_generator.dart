import 'package:esports_ec/screens/auth_screen.dart';
import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/screens/complete_profile_screen.dart';
import 'package:esports_ec/screens/let_the_game_begin_screen.dart';
import 'package:esports_ec/screens/splash_screen.dart';
import 'package:esports_ec/screens/instructor_screen.dart';
import 'package:esports_ec/widgets/page_transition.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case SplashScreen.id:
        return _route(const SplashScreen());
      case BottomNavScreen.id:
        return _route(const BottomNavScreen());
      // case CourseScreen.id:
      //   return _route(CourseScreen(course: args));
      case InstructorScreen.id:
        return _route(InstructorScreen(instructor: args));
      case AuthScreen.id:
        return _route(const AuthScreen());
      case LetTheGameBeginScreen.id:
        return _route(const LetTheGameBeginScreen());
      case CompleteProfileScreen.id:
        return _route(const CompleteProfileScreen());
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
