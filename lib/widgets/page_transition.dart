library page_transition;

import 'package:flutter/material.dart';

class PageTransition<T> extends PageRouteBuilder<T> {
  static const _duration = Duration(milliseconds: 150);

  final Widget child;

  PageTransition({
    Key? key,
    required this.child,
  }) : super(
          pageBuilder: (_, __, ___) => child,
          transitionDuration: _duration,
          reverseTransitionDuration: _duration,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
        );
}
