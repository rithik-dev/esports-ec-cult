import 'package:esports_ec/controllers/user_controller.dart';
import 'package:esports_ec/screens/auth_screen.dart';
import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/screens/let_the_game_begin_screen.dart';
import 'package:esports_ec/services/local_storage.dart';
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
      await LocalStorage.initialize();

      final firstTimeOpened =
          LocalStorage.read<bool>('first_time_open') ?? true;

      if (firstTimeOpened) {
        Navigator.pushReplacementNamed(context, LetTheGameBeginScreen.id);
        return;
      }

      final _userCon = UserController.of(context, listen: false);
      await _userCon.initializeUser();

      if (_userCon.isLoggedIn) {
        Navigator.pushReplacementNamed(context, BottomNavScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, AuthScreen.id);
      }
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(75),
            child: Image.asset('assets/images/app-logo.png'),
          ),
        ),
        bottomNavigationBar: const SizedBox(
          height: 150,
          child: CustomLoader(),
        ),
      ),
    );
  }
}
