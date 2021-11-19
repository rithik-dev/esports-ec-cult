import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'LoginScreen';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            MyTextField(
              labelText: 'Enter username',
            ),
            const SizedBox(height: 10),
            MyButton(
              text: 'Complete',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                BottomNavScreen.id,
                (route) => false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
