import 'package:esports_ec/screens/auth_screen.dart';
import 'package:esports_ec/services/local_storage.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/onboarding_background.dart';
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
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Expanded(child: OnboardingBackground()),
                Expanded(
                  child: Image.asset(
                    'assets/images/graphic.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            MyButton(
              text: 'START',
              isBold: true,
              onTap: () {
                LocalStorage.write('first_time_open', false);
                Navigator.pushReplacementNamed(context, AuthScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
