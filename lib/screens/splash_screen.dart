import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/widgets/custom_loader.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, BottomNavScreen.id);
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomLoader(),
      ),
    );
  }
}
