import 'package:flutter/material.dart';

class FadedRoute extends PageRouteBuilder<Widget> {
  FadedRoute(
    Widget page,
    this.curve,
    Duration duration,
  ) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
        );

  final Curve curve;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animation, curve: curve),
    );

    return FadeTransition(
      opacity: tween,
      child: child,
    );
  }
}
