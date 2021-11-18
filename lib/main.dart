import 'package:esports_ec/screens/splash_screen.dart';
import 'package:esports_ec/utils/app_theme.dart';
import 'package:esports_ec/utils/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(_, child, ___) => child;
}

class _MyApp extends StatelessWidget {
  static const id = '_MyApp';

  const _MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => ScrollConfiguration(
        behavior: _ScrollBehavior(),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: SplashScreen.id,
    );
  }
}
