import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class LevelBar extends StatelessWidget {
  static const id = 'LevelBar';

  final String level;

  const LevelBar({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      child: Text(
        level.toUpperCase(),
        style: const TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.bold,
        ),
      ),
      showBorder: true,
      margin: 0,
      color: Colors.transparent,
      borderRadius: 10,
      borderColor: Colors.cyan,
      customPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2.5,
      ),
    );
  }
}
