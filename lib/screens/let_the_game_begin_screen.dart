import 'package:esports_ec/screens/login_screen.dart';
import 'package:esports_ec/services/local_storage.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:flutter/material.dart';

class LetTheGameBeginScreen extends StatelessWidget {
  static const id = 'LetTheGameBeginScreen';

  const LetTheGameBeginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 100,
              left: 75,
              right: 75,
              child: Image.asset(
                'assets/images/app-logo.png',
                width: 150,
              ),
            ),
            MyButton(
              text: 'Next',
              onTap: () {
                LocalStorage.write('first_time_open', false);
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
