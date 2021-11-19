import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  static const id = 'OnboardingBackground';

  final List<Widget>? children;

  const OnboardingBackground({
    Key? key,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          'assets/images/onboarding_top.png',
          fit: BoxFit.cover,
        ),
        ...?children,
      ],
    );
  }
}
