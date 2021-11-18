import 'package:flutter/material.dart';

class ArenaScreen extends StatelessWidget {
  static const id = 'ArenaScreen';

  const ArenaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'ArenaScreen',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
