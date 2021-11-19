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
        body: OnboardingBackground(
          children: [
            MyButton(
              text: 'Next',
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
