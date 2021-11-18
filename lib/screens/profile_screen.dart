import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const id = 'ProfileScreen';

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'ProfileScreen',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
