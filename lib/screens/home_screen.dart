import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'HomeScreen',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
