import 'package:flutter/material.dart';

class UnFocusOnTap extends StatelessWidget {
  static const id = 'UnFocusOnTap';

  final Widget child;

  const UnFocusOnTap({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: child,
    );
  }
}
